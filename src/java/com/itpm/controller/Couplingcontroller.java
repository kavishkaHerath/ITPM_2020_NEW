/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itpm.controller;

import com.itpm.model.Coupling;
import com.itpm.model.CouplingDTO;
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
public class Couplingcontroller {
    private static Connection connection;

//	private static Statement statement;
    private static PreparedStatement ps;

    private static ResultSet rs;


    //==================retrieve the size ===================================
    public static ArrayList<Coupling> getcoupling() {

        ArrayList<Coupling> list = new ArrayList<Coupling>();
        try {
            connection = DBConnectionUtil.getConnection();

            ps = connection.prepareStatement("select * from coupling");
            rs = ps.executeQuery();

            while (rs.next()) {

                Coupling coupling = new Coupling();
                coupling.setId(rs.getString("id"));
                coupling.setProgramComponent(rs.getString("ProgramComponent"));
                coupling.setWeight(rs.getInt("weight"));

                list.add(coupling);

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
    
    public int updateSave(ArrayList<Coupling> coupling) {


        int result = 0;

        try {
            connection = DBConnectionUtil.getConnection();
            for (Coupling coupling1 : coupling) {

                ps = connection.prepareStatement("UPDATE coupling SET  `weight`=? WHERE `id`=?;");

                ps.setInt(1, coupling1.getWeight());
                ps.setString(2, coupling1.getId());

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
    public static ArrayList<CouplingDTO> measureCoupling(String fileName) throws FileNotFoundException, IOException {
        ArrayList<CouplingDTO> couplingList = new ArrayList<>();

        FileReader fr = new FileReader("CodeMe/upload/" + fileName);
        BufferedReader br = new BufferedReader(fr);
        ArrayList<Coupling> alist = new ArrayList<>();
        alist = getcoupling();
        
        
        
       String[] strArray1 = new String[10];
       
        int CP1 = 0;
        int CP2 = 0;
        int CP3 = 0;
        int CP4 = 0;
        int CP5 = 0;
        int CP6 = 0;
        int CP7 = 0;
        int CP8 = 0;
        int CP9 = 0;
        int CP10 = 0;
        int CP11 = 0;
        int CP12 = 0;
        int CP13 = 0;
        

        for (Coupling cs : alist) {
            if (cs.getProgramComponent().equals("A recursive call")) {
                CP1 = cs.getWeight();
            } else if (cs.getProgramComponent().equals("A regular method calling another regular method in the same file")) {
                CP2 = cs.getWeight();
            } else if (cs.getProgramComponent().equals("A regular method calling another regular method in a different file")) {
                CP3 = cs.getWeight();
            } else if (cs.getProgramComponent().equals("A regular method calling a recursive method in the same file")) {
                CP4 = cs.getWeight();
            } else if (cs.getProgramComponent().equals("A regular method calling a recursive method in a different file")) {
                CP5 = cs.getWeight();
            } else if (cs.getProgramComponent().equals("A recursive method calling another recursive method in the same file")) {
                CP6 = cs.getWeight();
            } else if (cs.getProgramComponent().equals("A recursive method calling another recursive method in a different file")) {
                CP7 = cs.getWeight();
            }else if (cs.getProgramComponent().equals("A recursive method calling a regular method in the same file")) {
                CP8 = cs.getWeight();
            } else if (cs.getProgramComponent().equals("A recursive method calling a regular method in a different file")) {
                CP9 = cs.getWeight();
            } else if (cs.getProgramComponent().equals("A regular method referencing a global variable in the same file")) {
                CP10 = cs.getWeight();
            }else if (cs.getProgramComponent().equals("A regular method referencing a global variable in a different file")) {
                CP11 = cs.getWeight();
            } else if (cs.getProgramComponent().equals("A recursive method referencing a global variable in the same file")) {
                CP12 = cs.getWeight();
            } else if (cs.getProgramComponent().equals("A recursive method referencing a global variable in a different file")) {
                CP13 = cs.getWeight();
            }
        }

        String line;
        while ((line = br.readLine()) != null) {

         int Nr = 0;
	 int Nmcms = 0;
	 int Nmcmd = 0;
	 int Nmcrms = 0;
	 int Nmcrmd = 0;
	 int Nrmcrms = 0;
	 int Nrmcrmd = 0;
	 int Nrmcms = 0;
	 int Nrmcmd = 0;
	 int Nmrgvs = 0;
	 int Nmrgvd = 0;
	 int Nrmrgvs = 0;
         int Nrmrgvd = 0;
         int Ccp;
           
            

            char[] lnByChar = line.toCharArray();
             char[] comma = line.toCharArray();
              String[] words = line.split("\\W+");
            
           line = line.trim();
           CouplingDTO coupFunc = new CouplingDTO();
           coupFunc.setCodeLine(line);
           
           
           String[] javaKeyWords = {"if","else-if","for","while","do-while","switch","case"};
           String operators = "<,<=,>,>=,==,!=,:,(";
           
           List<Character> operatorsList = operators.chars() // IntStream
                .mapToObj(e -> (char) e) // Stream<Character>
                .collect(Collectors.toList());
           
           
           for (int i = 0; i < words.length; i++) {
                for (int j = 0; j < javaKeyWords.length; j++) {
                    if (words[i].equals(javaKeyWords[j])) {
                        Nr++;
                    }
                }
                
                
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

           } 
           
           for (int i = 0; i < lnByChar.length; i++) {
                // operators
                if ((operatorsList.contains(lnByChar[i]) && (Nr != 0))) {
                    if (i > 0) {
                      Nmcms++; 
                      Nmcmd++;
                      Nmcrms++;
                      Nmcrmd++;
                      Nrmcrms++;
                      Nrmcrmd++;
                      Nrmcms++;
                      Nrmcmd++;
                      Nmrgvs++;
                      Nmrgvd++;
                      Nrmrgvs++;
                      Nrmrgvd++;
                    }
                }
            }
           
          coupFunc.setNr(Nr);
	  coupFunc.setNmcms(Nmcms);
	  coupFunc.setNmcmd(Nmcmd);
	  coupFunc.setNmcrms(Nmcrms);
	  coupFunc.setNmcrmd(Nmcrmd);
	  coupFunc.setNrmcrms(Nrmcrms);
	  coupFunc.setNrmcrmd(Nrmcrmd);
	  coupFunc.setNrmcms(Nrmcms);
	  coupFunc.setNrmcmd(Nrmcmd);
	  coupFunc.setNmrgvs(Nmrgvs);
	  coupFunc.setNmrgvd(Nmrgvd);
	  coupFunc.setNrmrgvs(Nrmrgvs);
	  coupFunc.setNrmrgvd(Nrmrgvd);
          coupFunc.setCcp((Nr) + (Nmcms) + (Nmcmd) + (Nmcrms) + (Nmcrmd) +(Nrmcrms) + (Nrmcrmd) + (Nrmcms) + (Nrmcmd) +(Nmrgvs) + (Nmrgvd) + (Nrmrgvs) + (Nrmrgvd));

            couplingList.add(coupFunc);
        }

        return couplingList;
    }
    
}
