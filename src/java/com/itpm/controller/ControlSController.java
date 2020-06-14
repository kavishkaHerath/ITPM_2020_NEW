/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itpm.controller;

import com.itpm.model.ControlSDTO;
import com.itpm.model.ControlStructure;
import com.itpm.util.DBConnectionUtil;
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
import java.util.stream.Collectors;
/**
 *
 * @author Pavel
 */
public class ControlSController {
    private static Connection connection;

//	private static Statement statement;
    private static PreparedStatement ps;

    private static ResultSet rs;


    //==================retrieve the size ===================================
    public static ArrayList<ControlStructure> getcontrols() {

        ArrayList<ControlStructure> list = new ArrayList<ControlStructure>();
        try {
            connection = DBConnectionUtil.getConnection();

            ps = connection.prepareStatement("select * from controlstructure");
            rs = ps.executeQuery();

            while (rs.next()) {

                ControlStructure controlstructure = new ControlStructure();
                controlstructure.setId(rs.getString("id"));
                controlstructure.setProgramComponent(rs.getString("ProgramComponent"));
                controlstructure.setWeight(rs.getInt("weight"));

                list.add(controlstructure);

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
    
    public int updateSave(ArrayList<ControlStructure> controlstructure) {


        int result = 0;

        try {
            connection = DBConnectionUtil.getConnection();
            for (ControlStructure controlstructure1 : controlstructure) {

                ps = connection.prepareStatement("UPDATE controlstructure SET  `weight`=? WHERE `id`=?;");

                ps.setInt(1, controlstructure1.getWeight());
                ps.setString(2, controlstructure1.getId());

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

    
//     =====================================================================================================
//    public static ArrayList<SizeDTO_11> measurevariable(String fileName) throws FileNotFoundException, IOException {
//       ArrayList<SizeDTO_11> VariableList = new ArrayList<>();
       
       // measure weight of variable
    public static ArrayList<ControlSDTO> measureControlS(String fileName) throws FileNotFoundException, IOException {
        ArrayList<ControlSDTO> controlList = new ArrayList<>();

       FileReader fr = new FileReader("CodeMe/upload/" + fileName);
       BufferedReader br = new BufferedReader(fr);
        ArrayList<ControlStructure> alist = new ArrayList<>();
        alist = getcontrols();
        
        
        
       String[] strArray1 = new String[10];
       
        int CS1 = 0;
        int CS2 = 0;
        int CS3 = 0;
        int CS4 = 0;
        

        for (ControlStructure cs : alist) {
            if (cs.getProgramComponent().equals("A conditional control structure such as an ‘if’ or ‘else-if’ condition")) {
                CS1 = cs.getWeight();
            } else if (cs.getProgramComponent().equals("An iterative control structure such as a ‘for’, ‘while’, or ‘do-while’ loop")) {
                CS2 = cs.getWeight();
            } else if (cs.getProgramComponent().equals("The ‘switch’ statement in a ‘switch-case’ control structure")) {
                CS3 = cs.getWeight();
            } else if (cs.getProgramComponent().equals("Each ‘case’ statement in a ‘switch-case’ control structure")) {
                CS4 = cs.getWeight();
            }
        }
        String line;
        while ((line = br.readLine()) != null) {

            int Wtcs = 0;
            int NC = 0;
            int Ccspps = 0;
            int n =  0;
           
            

            char[] lnByChar = line.toCharArray();
             char[] comma = line.toCharArray();
              String[] words = line.split("\\W+");
            
           line = line.trim();
           ControlSDTO controlS = new ControlSDTO();
           controlS.setCodeLine(line);
           
           
           String[] javaKeyWord1 = {"if","else-if"};
           String[] javaKeyWord2 = {"for","while","do-while"};
           String[] javaKeyWord3 = {"switch"};
           String[] javaKeyWord4 = {"case"};
           //String[] conditions = {"<","<=",">",">=","==","!=","if","else-if","for","while","do-while","switch","case"};
           String operators = "<,<=,>,>=,==,!=,:,(";
           
           List<Character> operatorsList = operators.chars() // IntStream
                .mapToObj(e -> (char) e) // Stream<Character>
                .collect(Collectors.toList());
           
           
//           for (int i = 0; i < words.length; i++) {
//                for (int j = 0; j < javaKeyWord1.length; j++) {
//                    if (words[i].equals(javaKeyWord1[j])) {
//                        Wtcs++;
//                    }
//                }
                
//                for (int c = 0; c < conditions.length; c++) {
//                    if (words[i].equals(conditions[c])) {
//                        NC++;
//                        Ccspps++;
//                    
//                    }
//                }
                
//            for (int i = 0; i < lnByChar.length; i++) {
//                if (lnByChar[i] == '{') {
//                    curlyBracesCount++;
//                } else if (lnByChar[i] == '}') {
//                    curlyBracesCount--;
//                }
//                
//            }    
        
            
            
            
//
//            String[] words = line.split("\\W+");
//            for (int i = 0; i < words.length; i++) {
//                int x = 0;
//                System.out.println(words[i]);
//             
//             
//                 if (curlyBracesCount == 1 ) {
//                     
//                    if(words[0].equals("private") || words[0].equals("protected") || words[0].equals("static")){
//                        Wvs = globalVariable;
//                  
//                        if (dataTypeList.contains(words[i])) { 
//                             n++;
//                            int commaCount = 0;
//                            for (int j = 0; j < comma.length; j++) {
//                                if (comma[j] == ',') {
//                                commaCount++;
//
//                                }
//                            }  
//                            if(commaCount > 0){
//                                commaCount = commaCount +1;
//                                Npdtv = n* commaCount;
//                
//                                }
//                            else {
//                                Npdtv = n;
//                                }
//                            }
//                            if(!dataTypeList.contains(words[1])){
//                                x++;
//                                Ncdtv = x;
//                               
//                            }  
//                        }
//                    }    
//                  if (curlyBracesCount == 2) {
//                 if(words[i].equals("new")){
//                         Wvs = 1;
//                     }
//                  }
//                    if (curlyBracesCount > 1) {
//                        if(words[0].equals("private") || words[0].equals("protected") || words[0].equals("static")){
//                            if (dataTypeList.contains(words[i] )) { 
//                                Wvs = localVariable;
//                                
//                                if (dataTypeList.contains(words[i])) { 
//                                    n++;
//                                    int commaCount = 0;
//                                    for (int j = 0; j < comma.length; j++) {
//                                    if (comma[j] == ',') {
//                                    commaCount++;
//                                    }
//                            }  
//                            if(commaCount > 0){
//                                commaCount = commaCount +1;
//                                Npdtv = n* commaCount;
//                
//                                }
//                            else {
//                                Npdtv = n;
//                                }
//                            }
//                     
//                            }
//                        }
//                        else{
//                            if (dataTypeList.contains(words[0])) { 
//                                Wvs = localVariable;
//                                  if (dataTypeList.contains(words[i])) { 
//                                    n++;
//                                    int commaCount = 0;
//                                    for (int j = 0; j < comma.length; j++) {
//                                    if (comma[j] == ',') {
//                                    commaCount++;
//                                    }
//                            }  
//                            if(commaCount > 0){
//                                commaCount = commaCount +1;
//                                Npdtv = n* commaCount;
//                                }
//                            else {
//                                Npdtv = n;
//                                }
//                            }
//                           
//                            }
//                            
//                                
//                            }
//                        if(words[i].equals("new")){
//                            x++;
//                                Ncdtv = x;
//                            
//                        }
//                        }

                    
            //}

           //} 
           
           for (int i = 0; i < words.length; i++) {
                for (int j = 0; j < javaKeyWord1.length; j++) {
                    if (words[i].equals(javaKeyWord1[j])) {
                        Wtcs++;
                    }
                }
           }
           for (int i = 0; i < words.length; i++) {
                for (int j = 0; j < javaKeyWord2.length; j++) {
                    if (words[i].equals(javaKeyWord2[j])) {
                        Wtcs++;
                    }
                }
           }
           for (int i = 0; i < words.length; i++) {
                for (int j = 0; j < javaKeyWord3.length; j++) {
                    if (words[i].equals(javaKeyWord3[j])) {
                        Wtcs++;
                    }
                }
           }
           for (int i = 0; i < words.length; i++) {
                for (int j = 0; j < javaKeyWord4.length; j++) {
                    if (words[i].equals(javaKeyWord4[j])) {
                        Wtcs++;
                    }
                }
           }
           
           for (int i = 0; i < lnByChar.length; i++) {
                // operators
                if ((operatorsList.contains(lnByChar[i]) && (Wtcs != 0))) {
                    if (i > 0) {
                      NC++;  
                      Ccspps = 1;
                    }
                }
            }
           
           
           
            controlS.setWtcs(Wtcs);
            controlS.setNC(NC);
            controlS.setCcspps(Ccspps);
            controlS.setCcs((Wtcs * NC) + Ccspps);

            controlList.add(controlS);
        }

        return controlList;
    }
}

