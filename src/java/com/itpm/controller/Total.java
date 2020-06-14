/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itpm.controller;


import com.itpm.model.ControlSDTO;
import com.itpm.model.CouplingDTO;
import com.itpm.model.InheritanceDTO;
import com.itpm.model.SizeDTO;

import com.itpm.model.VeriableDTO;
import com.itpm.model.MethodDTO;
import com.itpm.model.TotalDTO;

import java.io.FileNotFoundException;

import java.io.IOException;
import java.util.ArrayList;



/**
 *
 * @author user
 */
public class Total {

    public  TotalDTO measureTotal(String fileName) throws FileNotFoundException, IOException {
       TotalDTO total = new TotalDTO();
       
       ArrayList<Integer> LineNo = new ArrayList<Integer>();
       ArrayList<Integer> FCs = new ArrayList<Integer>();
       ArrayList<Integer> FCv = new ArrayList<Integer>();
       ArrayList<Integer> FCm = new ArrayList<Integer>();
       ArrayList<Integer> FCi = new ArrayList<Integer>();
       ArrayList<String> CodeLine = new ArrayList<String>();
       ArrayList<Integer> FCcp = new ArrayList<Integer>(); 
       ArrayList<Integer> FCCs = new ArrayList<Integer>(); 
        
        SizeController size = new SizeController();
        ArrayList<SizeDTO> sizeList = size.measureSize(fileName);
        
        for(SizeDTO s:sizeList){
            FCs.add(s.getCs());
            CodeLine.add(s.getCodeLine());
            LineNo.add(s.getSno());
             
        }
        VeriableConrtoller veribale = new VeriableConrtoller();
        ArrayList<VeriableDTO> veribaleList = veribale.measurevariable(fileName);
        
        for(VeriableDTO v:veribaleList){
            FCv.add(v.getCv());
            
             
             
        }
        
        
        MethodController method = new MethodController();
        ArrayList<MethodDTO> mthodList = method.measureMethod(fileName);
        
        
         for(MethodDTO m:mthodList){
            FCm.add(m.getCm());
             
             
        }
         
        InheritanceTotal inher = new InheritanceTotal();
        ArrayList<InheritanceDTO> inherList = inher.measureInherittot(fileName);
        
        
         for(InheritanceDTO s:inherList){
            FCi.add(s.getCi());
             
             
        }
        
        ControlSController cont = new ControlSController();
        ArrayList<ControlSDTO> contList = cont.measureControlS(fileName);
        
        
         for(ControlSDTO c:contList){
            FCCs.add(c.getCcs());
             
             
        } 
         
        Couplingcontroller cup = new Couplingcontroller();
        ArrayList<CouplingDTO> cuptList = cup.measureCoupling(fileName);
        
         for(CouplingDTO n:cuptList){
            FCcp.add(n.getCcp());
             
             
        } 


      
        total.setLineNo(LineNo);
        total.setCodeLine(CodeLine);
        total.setFCs(FCs);
        total.setFCv(FCv);
        total.setFCm(FCm);
        total.setFCi(FCi);
        total.setFCCs(FCCs);
        total.setFCcp(FCcp);
    
     
         
          
         System.out.println("Ravi:"+LineNo);
                                                
        return total;
        
}
}

