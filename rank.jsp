<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
 
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql");
PreparedStatement statement = con.prepareStatement("select id,first_name,age,gender, rank() over(order by age desc) 'rank' from person where id ='1'");
//PreparedStatement statement = con.prepareStatement("select id,first_name,age,gender, rank() over(partition by 소속 order by age desc) 'rank' from person where id ='1'");
// 소속 랭킹 확인

System.out.println(statement);
ResultSet rs = statement.executeQuery();
if(rs.next()){
	response.getWriter().write(rs.getString(1)+","+rs.getString(5));
  //id, 랭킹 전달(랭킹만 전달해도 상관없을거 같음)
} else{
	response.getWriter().write("error");
}
con.close();
%>
