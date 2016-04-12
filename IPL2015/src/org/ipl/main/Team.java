package org.ipl.main;

//import org.ipl.player.*;

public class Team {
	
	String name;
	int rank;
	String owner;
	Player captain;
	int totalMatches;
	int wins;
	int losses;
	Player[] players;   //array of 11 players for a Squad
	public Team(String name, int rank, String owner, Player captain,
			int totalMatches, int wins, int losses, Player[] players) {
		this.name = name;
		this.rank = rank;
		this.owner = owner;
		this.captain = captain;
		this.totalMatches = totalMatches;
		this.wins = wins;
		this.losses = losses;
		this.players = players;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public Player getCaptain() {
		return captain;
	}
	public void setCaptain(Player captain) {
		this.captain = captain;
	}
	public int getTotalMatches() {
		return totalMatches;
	}
	public void setTotalMatches(int totalMatches) {
		this.totalMatches = totalMatches;
	}
	public int getWins() {
		return wins;
	}
	public void setWins(int wins) {
		this.wins = wins;
	}
	public int getLosses() {
		return losses;
	}
	public void setLosses(int losses) {
		this.losses = losses;
	}
	public Player[] getPlayers() {
		return players;
	}
	public void setPlayers(Player[] players) {
		this.players = players;
	}
	
	
	
	

}

