package com.itpm.server;


import com.mysql.jdbc.Buffer;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;


public class UploadMultiple {
    
    public static void main(String[] args) throws IOException{
        File directory = new File("C:\\ccmt\\uploads");
        File[] list = directory.listFiles();
        
        printContents(list);
    }    
//        public static void printNames(File[] list){
//            System.out.println("File: ");
//            for(int i=0; i < list.length; i++){
//                if(list[i].isFile()){
//                    System.out.println(list[i].getName());
//                }
//            
//            
//        }
//    }
       public static void printContents(File[] list)throws IOException{
           for(int i=0; i< list.length; i++){
               String filename = list[i].getPath();
               BufferedReader br = new BufferedReader(new FileReader(filename));
               System.out.println("File: " +filename);
               String line = null;
               while((line = br.readLine()) != null){
                   System.out.println(line);
               }
               System.out.println("**************************************");
           }
           
       }
       
    
}  
