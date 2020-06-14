/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itpm.model;

/**
 *
 * @author Harindu
 */
public class SizeDTO_1 { 
    
    private String CodeLine;
    private String statement;
    private int WMRT;// key words
    private int Npdtp;// identifiers
    private int Ncdtp;// operators
    private int Cm;// numarical values

    public String getCodeLine() {
        return CodeLine;
    }

    public void setCodeLine(String CodeLine) {
        this.CodeLine = CodeLine;
    }
    public String getStatement() {
        return statement;
    }

    public void setStatement(String statement) {
        this.statement = statement;
    }
    

    
    public int getWMRT() {
        return WMRT;
    }

    public void setWMRT(int WMRT) {
        this.WMRT = WMRT;
    }

    public int getNpdtp() {
        return Npdtp;
    }

    public void setNpdtp(int Npdtp) {
        this.Npdtp = Npdtp;
    }

    public int getNcdtp() {
        return Ncdtp;
    }

    public void setNcdtp(int Ncdtp) {
        this.Ncdtp = Ncdtp;
    }

    public int getCm() {
        return Cm;
    }

    public void setCm(int Cm) {
        this.Cm= Cm;
    }

	public void calculateCM() {
		this.Cm = this.WMRT;
	}
    
}
