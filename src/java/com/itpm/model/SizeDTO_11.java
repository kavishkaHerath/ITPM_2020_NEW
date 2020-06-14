/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itpm.model;

/**
 
                                              
 * @author Harindu
 */
public class SizeDTO_11 { 
    
    private String CodeLine;
    private int Wvs;// key words
    private int Npdtv;// identifiers
    private int Ncdtv;// operators
    private int Cv;// numarical values
    private int sumOfPrimitiveVariables = 0;
    private int sumOfCompositeVariables = 0;
    private boolean isPrimitiveReturnType = false;
    private boolean isCompositeReturnType = false;
    private boolean isVoidReturnType = false;
    

    public String getCodeLine() {
        return CodeLine;
    }

    public void setCodeLine(String CodeLine) {
        this.CodeLine = CodeLine;
    }
     public int getWvs() {
        return Wvs;
    }

    public void setWvs(int Wvs) {
        this.Wvs = Wvs;
    }

    public int getNpdtv() {
        return Npdtv;
    }

    public void setNpdtv(int Npdtv) {
        this.Npdtv = Npdtv;
    }

    public int getNcdtv() {
        return Ncdtv;
    }

    public void setNcdtv(int Ncdtv) {
        this.Ncdtv = Ncdtv;
    }

    public int getCv() {
        return Cv;
    }

    public void setCv(int Cv) {
        this.Cv= Cv;
    }
     public boolean isPrimitiveReturnType() {
        return isPrimitiveReturnType;
    }

    public boolean isCompositeReturnType() {
        return isCompositeReturnType;
    }

    public boolean isVoidReturnType() {
        return isVoidReturnType;
    }
     public int getSumOfPrimitiveVariables() {
        return sumOfPrimitiveVariables;
    }

    public int getSumOfCompositeVariables() {
        return sumOfCompositeVariables;
    }

    
}
