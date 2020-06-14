/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itpm.controller;

import com.itpm.model.MethodDTO;
import com.itpm.model.SizeVariableMetod;
import com.itpm.util.CommonConstants;
import com.itpm.util.DBConnectionUtil;
import com.sun.org.apache.bcel.internal.classfile.LocalVariable;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author user
 */
public class MethodController {

    private static Connection connection;

//	private static Statement statement;
    private static PreparedStatement ps;

    private static ResultSet rs;


//==========================retrieve the method=================================
    public static ArrayList<SizeVariableMetod> getmethod() {

        ArrayList<SizeVariableMetod> list = new ArrayList<SizeVariableMetod>();
        try {
            connection = DBConnectionUtil.getConnection();

            ps = connection.prepareStatement("select * from method");
            rs = ps.executeQuery();

            while (rs.next()) {

                SizeVariableMetod sizevariablemethod = new SizeVariableMetod();
                sizevariablemethod.setId(rs.getString("id"));
                sizevariablemethod.setProgramComponent(rs.getString("ProgramComponent"));
                sizevariablemethod.setWeight(rs.getInt("weight"));

                list.add(sizevariablemethod);

            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            /*
			 * Close prepared statement and database connectivity at the end of transaction
             */
            try {
                if (ps != null) {
                    ps.close();
                }
                if (connection != null) {
//                    connection.close();
                }
            } catch (SQLException e) {
                //log.log(Level.SEVERE, e.getMessage());
                System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;

    }

    //=====================================Update the method===========================
    public int updateMethod(ArrayList<SizeVariableMetod> methodss) {

//        SizeVMController size = new SizeVMController();
        int result = 0;

        try {
            connection = DBConnectionUtil.getConnection();
            for (SizeVariableMetod methodsss : methodss) {

                ps = connection.prepareStatement("UPDATE method SET  `weight`=? WHERE `id`=?;");

                ps.setInt(1, methodsss.getWeight());
                ps.setString(2, methodsss.getId());

                result = ps.executeUpdate();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (connection != null) {
//                    connection.close();
                }
            } catch (SQLException e) {
                System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
            }
        }
        // Get the updated employee
        return result;

    }
    
    public static ArrayList<MethodDTO> measureMethod(String fileName) throws FileNotFoundException, IOException {
        ArrayList<MethodDTO> variableList = new ArrayList<>();

        FileReader fr = new FileReader("CodeMe/upload/" + fileName);
        BufferedReader br = new BufferedReader(fr);
        ArrayList<SizeVariableMetod> weightList = new ArrayList<>();
        weightList = getmethod();
        
       String[] dataTypes = {"int", "float", "double", "short", "byte", "long", "string","String", "char", "boolean", "void"};
       
        int primitive_return_type = 0;
        int composite_return_type = 0;
        int void_return_type = 0;
        int Primitive_data_type = 0;
        int Composite_data_type = 0;

        for (SizeVariableMetod svm : weightList) {
            if (svm.getId().equals("M1")) {
                 primitive_return_type = svm.getWeight();
            } else if (svm.getId().equals("M2")) {
                composite_return_type = svm.getWeight();
            } else if (svm.getId().equals("M3")) {
                void_return_type = svm.getWeight();
            } else if (svm.getId().equals("M4")) {
                Primitive_data_type = svm.getWeight();
            } else if (svm.getId().equals("M5")) {
                Composite_data_type = svm.getWeight(); 
            }
        }

        int curlyBracesCount = 0;
        List<String> dataTypeList = Arrays.asList(dataTypes);

        String line;
        while ((line = br.readLine()) != null) {

            int Wvs = 0;
            int Wpdtv = 0;
            int Wmrt = 0;
            int Wcdtv = 0;
            int Ncdtv = 0;
            int Npdtp = 0;
             int n =0;

            char[] lnByChar = line.toCharArray();
            line = line.trim();
           MethodDTO variable = new MethodDTO();
           variable.setCodeLine(line);

            for (int i = 0; i < lnByChar.length; i++) {
                if (lnByChar[i] == '{') {
                    curlyBracesCount++;
                } else if (lnByChar[i] == '}') {
                    curlyBracesCount--;
                }
            }

            String[] words = line.split("\\W+");
            for (int i = 0; i < words.length; i++) {
               
                System.out.println(words[i]);
                if (dataTypeList.contains(words[i])) {
                    if (curlyBracesCount == 1) {
                        n=5;
                      if (words[0].equals("public") && words[i].equals("void")) { 
                         Ncdtv++; 
                         
                      }
                        
                       
                    } else if (curlyBracesCount > 1) {
                       
                       n=8;
                     
                       
                            if (words[0].equals("public") && (words[1].equals("int")||words[1].equals("String") || words[1].equals("boolean") || words[1].equals("float") 
                                    || words[1].equals("double") || words[1].equals("char"))) {
                                 Wmrt++; 
                            
                           
                            }
                             
                            
                            else if (words[0].equals("public") && words[i].equals("void")) {

                                Ncdtv++; 
                                if(words[0].equals("public") && words[i].equals("void") && words[i+1].equals("init") )
                                {
                                    Ncdtv=0;
                                }
                           
                                
                             }else{
                                    
                              }
                            }

                         

                    }
                }
        
                int total=0;
                total =Wmrt + (Primitive_data_type * Npdtp) + (Composite_data_type*Ncdtv);
          
                variable.setWMRT(Wmrt);
                variable.setNcdtp(Ncdtv);
                variable.setNpdtp(Npdtp);
                variable.setCm(total);
                
//            variable.setCv(Wpdtv);

            variableList.add(variable);
        }

        return variableList;
    }
}

