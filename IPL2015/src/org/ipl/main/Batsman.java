/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.ipl.main;

/**
 *
 * @author parishkrit
 */
public class Batsman extends Player{
    int matches;
    int runs;
    int strr;

    public Batsman(String name, int runs, int matches, int strr) {
        super(name);
        this.runs = runs;
        this.matches = matches;
        this.strr = strr;
    }

    public int getRuns() {
        return runs;
    }

    public void setRuns(int runs) {
        this.runs = runs;
    }

    public int getMatches() {
        return matches;
    }

    public void setMatches(int matches) {
        this.matches = matches;
    }

    public int getStrr() {
        return strr;
    }

    public void setStrr(int strr) {
        this.strr = strr;
    }
    
}
