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
public class Player {
    String name;
    int sixes;
    int likes;
    int hundreds;

    public Player(String name) {
        this.name = name;
    }

    public Player(String name, int sixes, int likes, int hundreds) {
        this.name = name;
        this.sixes = sixes;
        this.likes = likes;
        this.hundreds = hundreds;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getSixes() {
        return sixes;
    }

    public void setSixes(int sixes) {
        this.sixes = sixes;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

    public int getHundreds() {
        return hundreds;
    }

    public void setHundreds(int hundreds) {
        this.hundreds = hundreds;
    }
    
}
