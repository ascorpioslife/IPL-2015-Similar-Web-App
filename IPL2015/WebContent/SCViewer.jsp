<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ScoreCard</title>
</head>
<body>

						<% 
						
						Class.forName("com.ibm.db2.jcc.DB2Driver");
						Connection c = DriverManager.getConnection("jdbc:db2://localhost:50000/IPL15","Student","cookies888");
						String query1 = "select team1 , team2 from ipl.schedule where matchno="+request.getParameter("mno");
						System.out.println(request.getParameter("mno"));
						PreparedStatement stmt1;
						PreparedStatement stmt2;
						PreparedStatement stmt3,stmt4,stmt5;
						String t1,t2;
						stmt1 = c.prepareStatement(query1);
						
						ResultSet rs1,rs2,rs3,rs4,rs5;
						rs1 = stmt1.executeQuery();
						rs1.next();
						t1=rs1.getString(1);
						t2=rs1.getString(2);
						
						%>
   
   										<h3>1st Inning-Batting : <%=t1 %></h3>
   										<table border="2">
                                            <thead>
                                                <tr>
                                                    <th>Player ID</th>
                                                    <th>Balls Played</th>
                                                    <th>Runs</th>
                                                    <th>Sixes</th>		
                                                    <th>Fours</th>	
                                                    <th>Out By</th>	
                                                    <th>Type of Out</th>	
                                                    <th>Caught By</th>	
                                            
                                                    
                                                </tr>
                                            </thead>
                                            <%  
        					
							System.out.println(t1);
							System.out.println(t2);
							String query2 = "select a.p_id,balls_played,a.runs,a.sixs,a.fours,OUTBY,TYPE_OF_OUT,CAUGHTBY from ipl.batsc a,ipl.player b where a.p_id=b.p_id and matchno="+ request.getParameter("mno")+ " and team_name="+"'"+t1+"'";
							String query3 = "select a.p_id,balls_played,a.runs,a.sixs,a.fours,OUTBY,TYPE_OF_OUT,CAUGHTBY from ipl.batsc a,ipl.player b where a.p_id=b.p_id and matchno="+ request.getParameter("mno")+ " and team_name="+"'"+t2+"'";
							System.out.println(query1);
							System.out.println(query2);
							
							stmt2 = c.prepareStatement(query2);
							stmt3 = c.prepareStatement(query3);
							rs2 = stmt2.executeQuery();
							rs3 = stmt3.executeQuery();
							
							%>
                                            <tbody>
                                                
                                                <%
                                
           									 while(rs2.next()){ 
       													 %>
            
               <tr>
                                                    <td>
                                                         <%= rs2.getInt(1) %>
                                                    </td>
                                                    <td>
                                                       <%= rs2.getInt(2)%>
                                                    </td>
                                                    <td>
                                                       <%= rs2.getInt(3)%>
                                                    </td>
                                                    <td>
                                                       <%= rs2.getInt(4)%>
                                                    </td>
                                                    <td>
                                                        <%= rs2.getInt(5) %>
                                                    </td>
                                                    <td>
                                                   		<%= rs2.getString(6) %>
                                                    </td>
                                                    <td>
                                                   		<%= rs2.getString(7) %>
                                                    </td>
                                                    <td>
                                                   		<%= rs2.getString(8) %>
                                                    </td>
                                                    
                                                    
                                                </tr>
       						 <% 
           						 } 
       						 %>      	      
                                           
                                            </tbody>
                                        </table>
                                        
                                        
                                    <h3>2nd Inning-Batting: <%=t2 %></h3>
   										<table border="2">
                                            <thead>
                                                <tr>
                                                    <th>Player ID</th>
                                                    <th>Balls Played</th>
                                                    <th>Runs</th>
                                                    <th>Sixes</th>		
                                                    <th>Fours</th>	
                                                    <th>Out By</th>	
                                                    <th>Type of Out</th>	
                                                    <th>Caught By</th>	
                                            
                                                    
                                                </tr>
                                            </thead>
                                            
                                            
                                            <tbody>
                                                
                                                <%
                                
           									 while(rs3.next()){ 
       													 %>
            
               <tr>
                                                    <td>
                                                         <%= rs3.getInt(1) %>
                                                    </td>
                                                    <td>
                                                       <%= rs3.getInt(2)%>
                                                    </td>
                                                    <td>
                                                       <%= rs3.getInt(3)%>
                                                    </td>
                                                    <td>
                                                       <%= rs3.getInt(4)%>
                                                    </td>
                                                    <td>
                                                        <%= rs3.getInt(5) %>
                                                    </td>
                                                    <td>
                                                   		<%= rs3.getString(6) %>
                                                    </td>
                                                    <td>
                                                   		<%= rs3.getString(7) %>
                                                    </td>
                                                    <td>
                                                   		<%= rs3.getString(8) %>
                                                    </td>
                                                    
                                                    
                                                </tr>
       						 <% 
           						 } 
       						 %>      	      
                                           
                                            </tbody>
                                            </table>
                                  
   										<h3>1st Inning-Bowling: <%=t1 %></h3>
   										<table border="2">
                                            <thead>
                                                <tr>
                                                    <th>Player ID</th>
                                                    <th>Wickets</th>
                                                    <th>Overs</th>
                                                    <th>Runs Conceded</th>		
                                                   	
                                            
                                                    
                                                </tr>
                                            </thead>
                                            <%  
        					
							System.out.println(t1);
							System.out.println(t2);
							String query4 =" SELECT A.P_ID,A.WTAKEN,TOVER,RUNCN FROM IPL.baLLsc a,ipl.player b where a.p_id=b.p_id and matchno="+ request.getParameter("mno")+" and team_name="+"'"+t1+"'";
							String query5 = "SELECT A.P_ID,A.WTAKEN,TOVER,RUNCN FROM IPL.baLLsc a,ipl.player b where a.p_id=b.p_id and matchno="+ request.getParameter("mno")+" and team_name="+ "'"+t2+"'";
							System.out.println(query4);
							System.out.println(query5);
							
							stmt4 = c.prepareStatement(query4);
							stmt4 = c.prepareStatement(query4);
							rs4 = stmt2.executeQuery();
							rs5 = stmt3.executeQuery();
							
							%>
                                            <tbody>
                                                
                                                <%
                                
           									 while(rs4.next()){ 
       													 %>
            
               <tr>
                                                    <td>
                                                         <%= rs4.getInt(1) %>
                                                    </td>
                                                    <td>
                                                       <%= rs4.getInt(2)%>
                                                    </td>
                                                    <td>
                                                       <%= rs4.getFloat(3)%>
                                                    </td>
                                                    <td>
                                                       <%= rs4.getInt(4)%>
                                                    </td>
                                                    
                                                       
                                                    
                                                </tr>
       						 <% 
           						 } 
       						 %>      	      
                                           
                                            </tbody>
                                        </table>
                                        
                                        
                                    <h3>2nd Inning-Bowling: <%=t2 %></h3>
   										<table border="2">
                                            <thead>
                                                <tr>
                                                    <th>Player ID</th>
                                                    <th>Wickets</th>
                                                    <th>Overs</th>
                                                    <th>Runs Conceded</th>		
                                                   	
                                            
                                                    
                                                </tr>
                                            </thead>
                                            
                                            
                                            <tbody>
                                                
                                                <%
                                
                                                while(rs5.next()){ 
  													 %>
       
          <tr>
                                               <td>
                                                    <%= rs5.getInt(1) %>
                                               </td>
                                               <td>
                                                  <%= rs5.getInt(2)%>
                                               </td>
                                               <td>
                                                  <%= rs5.getFloat(3)%>
                                               </td>
                                               <td>
                                                  <%= rs5.getInt(4)%>
                                               </td>
                                               </tr>
       						 <% 
           						 } 
       						 %>      	      
                                           
                                            </tbody>
                                            </table>
                                            <a href="index.jsp">Home Page </a>
                                  
</body>
</html>