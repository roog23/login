<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<%
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/hometraining?serverTimezone=UTC&useSSL=false","root","root");
        PreparedStatement statement = con.prepareStatement("select * from members where id=? and pwd=?");

        statement.setString(1, request.getParameter("userId"));
        statement.setString(2, request.getParameter("userPassword"));

        ResultSet rs = statement.executeQuery();
        if(rs.next()){
                response.getWriter().write(rs.getString(1)+","+rs.getString(2)+","+rs.getString(3)+","+rs.getString(4)+","+rs.getString(5)+","+rs.getString(6));
        } else{
                response.getWriter().write("error");
        }
        con.close();
%>
