/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itpm.controller;


import com.itpm.model.SizeDTO;
import com.itpm.model.VeriableDTO;
import com.itpm.model.TotalDTOFinal;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author Ravi
 */
public class Total_Final {
    
        public  ArrayList<TotalDTOFinal> measureTotal(String fileName) throws FileNotFoundException, IOException {
            
            FileReader fr = new FileReader("CodeMe/upload/" + fileName);
            BufferedReader br = new BufferedReader(fr);
            
            ArrayList<TotalDTOFinal> totalList = new ArrayList<TotalDTOFinal>();
            ArrayList<Integer> Cs = new ArrayList<Integer>();
        
            SizeController size = new SizeController();
            ArrayList<SizeDTO> sizeList = size.measureSize(fileName); 
            
        String line;
        int no=0;
        int FCs =0;
        
   //     int i=0;
//       while ((line = br.readLine()) != null) {
//            line = line.trim();
//            no++;
//            TotalDTOFinal total = new TotalDTOFinal();
//            total.setCodeLine(line);
//            total.setTno(no);
//
//           
////            SizeVMController size2 = new SizeVMController();
////            SizeDTO size = new SizeDTO();
////            
////         
////           i=size.getSno();
////           i=1;
////            if(no==i){
////                
////                total.setFCs(no);
////            }
//totalList.add(total);
//       }
//            
                TotalDTOFinal total = new TotalDTOFinal();
             
            for(SizeDTO s:sizeList ){
                
                no++;
               
                
                //Cs.add(s.getCs());
                total.setCs(Cs);
                if(no == s.getSno()){
                    //total.setFCs(Cs);
                }
                   totalList.add(total);  
            }
               
        return totalList;
}
}
