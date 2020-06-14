/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itpm.controller;

import com.itpm.model.VeriableDTO;
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
public class VeriableConrtoller {

    private static Connection connection;

//	private static Statement statement;
    private static PreparedStatement ps;

    private static ResultSet rs;


    //========================retrieve the variable ======================
    public static ArrayList<SizeVariableMetod> getvariablemethod() {

        ArrayList<SizeVariableMetod> list = new ArrayList<SizeVariableMetod>();
        try {
            connection = DBConnectionUtil.getConnection();

            ps = connection.prepareStatement("select * from variable");
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

    //=======================update the variable==========================
    public int updateVariable(ArrayList<SizeVariableMetod> variables) {

//        SizeVMController size = new SizeVMController();
        int result = 0;

        try {
            connection = DBConnectionUtil.getConnection();
            for (SizeVariableMetod variabless : variables) {

                ps = connection.prepareStatement("UPDATE variable SET  `weight`=? WHERE `id`=?;");

                ps.setInt(1, variabless.getWeight());
                ps.setString(2, variabless.getId());

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
       // measure weight of variable
    public static ArrayList<VeriableDTO> measurevariable(String fileName) throws FileNotFoundException, IOException {
        ArrayList<VeriableDTO> variableList = new ArrayList<>();

        FileReader fr = new FileReader("CodeMe/upload/" + fileName);
        BufferedReader br = new BufferedReader(fr);
        ArrayList<SizeVariableMetod> weightList = new ArrayList<>();
        weightList = getvariablemethod();
        
        
        
       String[] dataTypes = {"int", "float", "double", "short", "byte", "long", "string","String", "char", "boolean"};
       
        int globalVariable = 0;
        int localVariable = 0;
        int primitive = 0;
        int composite = 0;
        

        for (SizeVariableMetod svm : weightList) {
            if (svm.getId().equals("V1")) {
                globalVariable = svm.getWeight();
            } else if (svm.getId().equals("V2")) {
                localVariable = svm.getWeight();
            } else if (svm.getId().equals("V3")) {
                primitive = svm.getWeight();
            } else if (svm.getId().equals("V4")) {
                composite = svm.getWeight();
            }
        }
        System.out.println(globalVariable);
        System.out.println(localVariable);

        int curlyBracesCount = 0;
       
        
        List<String> dataTypeList = Arrays.asList(dataTypes);

        String line;
        while ((line = br.readLine()) != null) {

            int Wvs = 0;
            int Wpdtv = 0;
            int Npdtv = 0;
            int Wcdtv = 0;
            int Ncdtv = 0;
            int n =  0;
           
            

            char[] lnByChar = line.toCharArray();
             char[] comma = line.toCharArray();
             
            
           line = line.trim();
           VeriableDTO variable = new VeriableDTO();
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
                int x = 0;
                System.out.println(words[i]);
             
             
                 if (curlyBracesCount == 1 ) {
                     
                    if(words[0].equals("private") || words[0].equals("protected") || words[0].equals("static")){
                        Wvs = globalVariable;
                  
                        if (dataTypeList.contains(words[i])) { 
                             n++;
                            int commaCount = 0;
                            for (int j = 0; j < comma.length; j++) {
                                if (comma[j] == ',') {
                                commaCount++;

                                }
                            }  
                            if(commaCount > 0){
                                commaCount = commaCount +1;
                                Npdtv = n * commaCount;
                
                                }
                            else {
                                Npdtv = n;
                                }
                            }
                            if(!dataTypeList.contains(words[1])){
                                x++;
                                Ncdtv = x;
                               
                            }  
                        }
                    }    
                  if (curlyBracesCount == 2) {
                 if(words[i].equals("new")){
                         Wvs = 1;
                     }
                  }
                    if (curlyBracesCount > 1) {
                        if(words[0].equals("private") || words[0].equals("protected") || words[0].equals("static")){
                            if (dataTypeList.contains(words[i] )) { 
                                Wvs = localVariable;
                                
                                if (dataTypeList.contains(words[i])) { 
                                    n++;
                                    int commaCount = 0;
                                    for (int j = 0; j < comma.length; j++) {
                                    if (comma[j] == ',') {
                                    commaCount++;
                                    }
                            }  
                            if(commaCount > 0){
                                commaCount = commaCount +1;
                                Npdtv = n* commaCount;
                
                                }
                            else {
                                Npdtv = n;
                                }
                            }
                     
                            }
                        }
                        else{
                            if (dataTypeList.contains(words[0])) { 
                                Wvs = localVariable;
                                  if (dataTypeList.contains(words[i])) { 
                                    n++;
                                    int commaCount = 0;
                                    for (int j = 0; j < comma.length; j++) {
                                    if (comma[j] == ',') {
                                    commaCount++;
                                    }
                            }  
                            if(commaCount > 0){
                                commaCount = commaCount +1;
                                Npdtv = n* commaCount;
                                }
                            else {
                                Npdtv = n;
                                }
                            }
                           
                            }
                            
                                
                            }
                        if(words[i].equals("new")){
                            x++;
                                Ncdtv = x;
                            
                        }
                        }

                    
            }
            

            
          

            variable.setWvs(Wvs);
            variable.setNpdtv(Npdtv);
            variable.setNcdtv(Ncdtv);
            
            variable.setCv(Wvs * ((primitive * Npdtv)  + ((composite * Ncdtv) )));
           
//            variable.setCv(Wpdtv);

            variableList.add(variable);
        }

        return variableList;
    }
}

