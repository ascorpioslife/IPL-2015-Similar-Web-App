package org.ipl.controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ipl.main.Match;

/**
 * Servlet implementation class ScheduleHandler
 */
@WebServlet("/ScheduleHandler")
public class ScheduleHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       static ResutSet rs1;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScheduleHandler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		/*Class.forName("com.ibm.db2.jcc.DB2Driver");
		Connection c = DriverManager.getConnection("jdbc:db2://localhost:50000/IPL15","Student","cookies888");
		String query1 = "SELECT * FROM SCHEDULE order by matchno";
		
		PreparedStatement stmt1 = null;
		
		stmt1 = c.prepareStatement(query1);
		
		
		ResultSet rs2,rs3;
		rArrayList<E>1.executeQuery();*/
		ArrayList<Match> matches = new ArrayList<Match>();
		System.out.print("asd");
		Match m;
		Match.createQuery();
		while(m=Match.loadNext()!=null)
		{
			matches.add(m);
		}
		
		 request.setAttribute("matches", matches);
		 
		 
		
	}

}
