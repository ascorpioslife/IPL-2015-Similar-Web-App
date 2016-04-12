package org.ipl.main;
//import org.ipl.player;

public class Result {
	private Player MoM;
	private Match m;
	private Team winner;
	private String win_msg;
	public Player getMoM() {
		return MoM;
	}
	public void setMoM(Player moM) {
		MoM = moM;
	}
	public Match getM() {
		return m;
	}
	public void setM(Match m) {
		this.m = m;
	}
	public Team getWinner() {
		return winner;
	}
	public void setWinner(Team winner) {
		this.winner = winner;
	}
	public String getWin_msg() {
		return win_msg;
	}
	public void setWin_msg(String win_msg) {
		this.win_msg = win_msg;
	}
	
	
	

}
