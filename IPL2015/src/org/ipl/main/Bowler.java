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
public class Bowler extends Player {
    private int matches;
    private int wtaken;
    private int econ;

    public Bowler(String name, int wtaken, int matches, int econ) {
        super(name);
        this.wtaken = wtaken;
        this.matches = matches;
        this.econ = econ;
    }

    public int getWtaken() {
        return wtaken;
    }

    public void setWtaken(int wtaken) {
        this.wtaken = wtaken;
    }

    public int getMatches() {
        return matches;
    }

    public void setMatches(int matches) {
        this.matches = matches;
    }

    public int getEcon() {
        return econ;
    }

    public void setEcon(int econ) {
        this.econ = econ;
    }
    
    
}
