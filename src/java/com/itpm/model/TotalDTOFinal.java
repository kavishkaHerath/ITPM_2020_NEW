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
public class TotalDTOFinal {
    private String CodeLine;
    private int FCs;
    private int FCv;
    private int Tno;

    public int getTno() {
        return Tno;
    }

    public void setTno(int Tno) {
        this.Tno = Tno;
    }
    private ArrayList<Integer> Cs = new ArrayList<Integer>();

    public ArrayList<Integer> getCs() {
        return Cs;
    }

    public void setCs(ArrayList<Integer> Cs) {
        this.Cs = Cs;
    }

    
    
    public String getCodeLine() {
        return CodeLine;
    }

    public void setCodeLine(String CodeLine) {
        this.CodeLine = CodeLine;
    }

    public int getFCs() {
        return FCs;
    }

    public void setFCs(int FCs) {
        this.FCs = FCs;
    }

    public int getFCv() {
        return FCv;
    }

    public void setFCv(int FCv) {
        this.FCv = FCv;
    }
    
    
    
}
