/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itpm.controller;

import com.itpm.model.InheritanceDTO;
import com.itpm.model.InheritanceMethod;
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
 * @author pasin_000
 */
public class InheritanceController {

    private static Connection connection;
    private static PreparedStatement ps;
    private static ResultSet rs;

    //==================retrieve the Inheritance ===================================
    public static ArrayList<InheritanceMethod> getinheritance() {

        ArrayList<InheritanceMethod> list = new ArrayList<InheritanceMethod>();
        try {
            connection = DBConnectionUtil.getConnection();

            ps = connection.prepareStatement("select * from inheritance");
            rs = ps.executeQuery();

            while (rs.next()) {

                InheritanceMethod InheritanceMethod = new InheritanceMethod();
                InheritanceMethod.setID(rs.getString("id"));
                InheritanceMethod.setInherited_Pattern(rs.getString("inherited_pattern"));
                InheritanceMethod.setWeight(rs.getInt("weight"));

                list.add(InheritanceMethod);

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

    //==========================Update the inheritance ========================
    public int updateInhertance(ArrayList<InheritanceMethod> inheritance) {

        int result = 0;

        try {
            connection = DBConnectionUtil.getConnection();
            for (InheritanceMethod inheritance1 : inheritance) {

                ps = connection.prepareStatement("UPDATE inheritance SET `weight`=? WHERE `id`=?;");

                ps.setInt(1, inheritance1.getWeight());
                ps.setString(2, inheritance1.getID());

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
//     =====================================================================================================
    public static ArrayList<InheritanceDTO> measureInheritance(String fileName) throws FileNotFoundException, IOException {
        ArrayList<InheritanceDTO> inheritanceList = new ArrayList<>();

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

        while ((s = br.readLine()) != null) {
         
            
            
            if(s.contains("//class")){
                continue;
            }
            words = s.split("\\W+");  //Split the word using space
            InheritanceDTO inheritance = new InheritanceDTO();
            List<String> cls = Arrays.asList(words);

            for (String word : words) {
                int nDI = 0;
                int i = cls.indexOf(word);
             
               
                InheritanceDTO inherit = new InheritanceDTO();
               
                
                if (word.equals(input)) //Search for the given word
                {
                    for (int j = 0; j < words.length; j++) {
                        if (words[j].equals("extends") ) {
                            nDI++;
                            
                        
                       
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
                    
                  
                        if(nDI > 0)
                        if (words[1].equals(words[i+1])) {
                            indirect++;    
                        }
                    
                    int total = 0;
                    total = nDI + indirect;

                   inherit.setClassName(words[i + 1]);
                    inherit.setDirectInheritance(nDI);
                    inherit.setIndirectInheritance(indirect);
                    inherit.setTotal(total);
                    
                    
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
                    
                
                   //inherit.setCi(total);
                    
                    
                    inheritanceList.add(inherit);
                } else {

                }

            }

        }

        br.close();
        fr.close();
        return inheritanceList;
    }
}
