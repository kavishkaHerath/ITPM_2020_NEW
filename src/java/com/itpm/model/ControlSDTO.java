/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itpm.model;

/**
 *
 * @author Pavel
 */
public class ControlSDTO {
    
    private String CodeLine;
    private int Wtcs;
    private int NC;
    private int Ccspps;
    private int Ccs;

    public String getCodeLine() {
        return CodeLine;
    }

    public void setCodeLine(String CodeLine) {
        this.CodeLine = CodeLine;
    }

    public int getWtcs() {
        return Wtcs;
    }

    public void setWtcs(int Wtcs) {
        this.Wtcs = Wtcs;
    }

    public int getNC() {
        return NC;
    }

    public void setNC(int NC) {
        this.NC = NC;
    }

    public int getCcspps() {
        return Ccspps;
    }

    public void setCcspps(int Ccspps) {
        this.Ccspps = Ccspps;
    }

    public int getCcs() {
        return Ccs;
    }

    public void setCcs(int Ccs) {
        this.Ccs = Ccs;
    }
   
}
