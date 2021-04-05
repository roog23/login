<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
 
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql");
PreparedStatement statement = con.prepareStatement("select * from view where name='푸쉬업'");
System.out.println(statement);
ResultSet rs = statement.executeQuery();
System.out.println(rs);
    

if(rs.next()){
	System.out.println(rs.getString(1)+"\n"+rs.getString(2)+"\n"+rs.getString(3));
	response.getWriter().write(rs.getString(1)+"/"+rs.getString(2)+"/"+rs.getString(3));
  //운동 이름, 정보, url 전달
} else{
	response.getWriter().write("error");
}
con.close();
%>
