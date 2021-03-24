<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
 
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost/user?serverTimezone=UTC&useSSL=false","root","비밀번호");
PreparedStatement statement = con.prepareStatement("select * from usertable where id=?");
statement.setString(1, request.getParameter("userId"));
ResultSet rs = statement.executeQuery();

if(rs.next()){
	response.getWriter().append("error");
} else {
	PreparedStatement statement1 = con.prepareStatement("insert into usertable(id,pw) values(?,?)");
	statement1.setString(1, request.getParameter("userId"));
	statement1.setString(2, request.getParameter("userPassword"));
	System.out.println(statement1);
	statement1.executeUpdate();
	response.getWriter().append("okay");
}
con.close();
%>
