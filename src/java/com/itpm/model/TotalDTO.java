/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itpm.model;

import java.util.ArrayList;

/**
 *
 * @author Ravi
 */
public class TotalDTO {
   
    private ArrayList<Integer> LineNo = new ArrayList<Integer>();
    
    private ArrayList<String> CodeLine = new ArrayList<String>();
    private ArrayList<Integer> FCs = new ArrayList<Integer>(); 
   // private int FCs;// key words
    //private int FCm;// identifiers
    private ArrayList<Integer> FCv = new ArrayList<Integer>(); 
     
    private ArrayList<Integer> FCm = new ArrayList<Integer>(); 

    private ArrayList<Integer> FCi = new ArrayList<Integer>(); 
    
     private ArrayList<Integer> FCcp = new ArrayList<Integer>(); 

    private ArrayList<Integer> FCCs = new ArrayList<Integer>(); 

    public ArrayList<Integer> getFCcp() {
        return FCcp;
    }

    public void setFCcp(ArrayList<Integer> FCcp) {
        this.FCcp = FCcp;
    }

    public ArrayList<Integer> getFCCs() {
        return FCCs;
    }

    public void setFCCs(ArrayList<Integer> FCCs) {
        this.FCCs = FCCs;
    }

    public ArrayList<String> getCodeLine() {
        return CodeLine;
    }

    public void setCodeLine(ArrayList<String> CodeLine) {
        this.CodeLine = CodeLine;
    }

    
    
    public ArrayList<Integer> getFCi() {
        return FCi;
    }

    public ArrayList<Integer> getFCm() {
        return FCm;
    }

    public void setFCm(ArrayList<Integer> FCm) {
        this.FCm = FCm;
    }
    

    public void setFCi(ArrayList<Integer> FCi) {
        this.FCi = FCi;
    }
     
  

    public ArrayList<Integer> getFCs() {
        return FCs;
    }

    public void setFCs(ArrayList<Integer> FCs) {
        this.FCs = FCs;
    }

    public ArrayList<Integer> getFCv() {
        return FCv;
    }

    public void setFCv(ArrayList<Integer> FCv) {
        this.FCv = FCv;
    }

    public ArrayList<Integer> getLineNo() {
        return LineNo;
    }

    public void setLineNo(ArrayList<Integer> LineNo) {
        this.LineNo = LineNo;
    }
    


  
    
}
