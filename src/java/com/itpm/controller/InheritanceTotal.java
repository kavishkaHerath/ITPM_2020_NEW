/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itpm.controller;

import static com.itpm.controller.InheritanceController.getinheritance;
import com.itpm.model.InheritanceDTO;
import com.itpm.model.InheritanceMethod;
import com.itpm.model.SizeVariableMetod;
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
import java.util.regex.Pattern;

/**
 *
 * @author user
 */
public class InheritanceTotal {

    

    
    private static Connection connection;

//	private static Statement statement;
    private static PreparedStatement ps;

    private static ResultSet rs;


    //==================retrieve the size ===================================
    public static ArrayList<SizeVariableMetod> getsizemethod() {

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

    
//     =====================================================================================================
//    public static ArrayList<SizeDTO_11> measurevariable(String fileName) throws FileNotFoundException, IOException {
//       ArrayList<SizeDTO_11> VariableList = new ArrayList<>();
       
       // measure weight of variable
    public static ArrayList<InheritanceDTO> measureInherittot(String fileName) throws FileNotFoundException, IOException {
        ArrayList<InheritanceDTO> IntotList = new ArrayList<>();

         FileReader fr = new FileReader("CodeMe/upload/" + fileName);
       
        BufferedReader br = new BufferedReader(fr);
        ArrayList<InheritanceMethod> alist = new ArrayList<>();
        alist = getinheritance();
         String s = null;
       String[] words = null;
        String input = "class";
        String[] check = null;
        int direct = 0;
        int indirect = 0;
       
        
        int I1 = 0;
        int I2 = 0;
        int I3 = 0;
        int I4 = 0;
        int I5 = 0;

        for (InheritanceMethod inheritance : alist) {
//            System.out.println(svm.getProgramComponent().equals("Key Word"));
            if (inheritance.getInherited_Pattern().equals("A class with no inheritance (direct or indirect)")) {
                I1 = inheritance.getWeight();
            } else if (inheritance.getInherited_Pattern().equals("A class inheriting (directly or indirectly) from one user-defined class")) {
                I2 = inheritance.getWeight();
            } else if (inheritance.getInherited_Pattern().equals("A class inheriting (directly or indirectly) from two user-defined classes")) {
                I3 = inheritance.getWeight();
            } else if (inheritance.getInherited_Pattern().equals("A class inheriting (directly or indirectly) from three user-defined classes")) {
                I4 = inheritance.getWeight();
            } else if (inheritance.getInherited_Pattern().equals("A class inheriting (directly or indirectly) from more than three user-defined classes")) {
                I5 = inheritance.getWeight();
            }

        }


       
   

        String line;
        int num=0;
        ArrayList<String> clsname = new ArrayList<String>();
        
        while ((line = br.readLine()) != null) {
            num++;
         
          
           line = line.trim();
             words = line.split("\\W+");  
           InheritanceDTO inherit = new InheritanceDTO();
           inherit.setCodeLine(line);
            List<String> cls = Arrays.asList(words);
            
            
           
            

            String[] javaKeyWords = {"extends"};

            //String[] words = line.split("\\W+");
             
            int nDI = 0;
            int Indirect = 0;
            int total = 0;
            int Ci = 0;
            int nSl = 0;
         
           
            for (int i = 0; i < words.length; i++) {
                for (int j = 0; j < javaKeyWords.length; j++) {
                    if (words[i].equals(javaKeyWords[j])) {
                        nDI++;
                          
                 
                        
                    
                    }
                     
            
            
                 
                    
                }
             
                for (int j = 0; j < javaKeyWords.length; j++) {
                    if (words[i].equals("DaysPerMonth")) {
                        Indirect++;
                          
                
                    
                    }
                     
            
            
                 
                    
                }
                            
            
                
                   String regex = ".*java.*";
                    Pattern pattern = Pattern.compile(regex);

                    for (int j = 0; j < words.length; j++) {
                        boolean matches = Pattern.matches(regex, words[j]);
                        System.out.println(matches);
                        if (matches) {
                            nDI--;
                   
                        }

                    }  
           
         
  
      
               
            }
            
           
            
            
            if(nDI < 0){
                nDI=0;
            }
            
            //int total = 0;
            total = nDI+Indirect; 
          
          inherit.setDirectInheritance(nDI);
          inherit.setIndirectInheritance(Indirect);
          inherit.setTotal(nDI+Indirect);
          inherit.setCi(total);
          
          
          
                     if(total == 0){
                         inherit.setCi(I1);
                         
                    }else if(total == 1){
                        inherit.setCi(I2);
                        //inherit.setTotal(I2);
                    }else if(total == 2){
                         inherit.setCi(I3);
                    }else if(total == 3){
                         inherit.setCi(I4);
                    }else{
                         inherit.setCi(I5);
                    }
            IntotList.add(inherit);
            
            
           if(line.contains("//")){
               inherit.setDirectInheritance(0);
          inherit.setIndirectInheritance(0);
          inherit.setTotal(0);
          inherit.setCi(0);
           }  
          
           if(line.contains("import")){
           
          inherit.setDirectInheritance(0);
          inherit.setIndirectInheritance(0);
          inherit.setTotal(0);
          inherit.setCi(0);
           }
           if(line.isEmpty()){
          inherit.setDirectInheritance(0);
          inherit.setIndirectInheritance(0);
          inherit.setTotal(0);
          inherit.setCi(0);
           }
          
            
          
            
        }
       
        br.close();
        fr.close();

        return IntotList;
    }
}

