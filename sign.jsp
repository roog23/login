<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<%
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql");
        PreparedStatement statement = con.prepareStatement("select * from members where id=?);

        statement.setString(1, request.getParameter("userId"));

        ResultSet rs = statement.executeQuery();
        if(rs.next()){
                respons.getWriter().write("error");
                response.getWriter().write(rs.getString(1)+","+rs.getString(2));
        } else{
                PreparedStatement statement1 = con.prepareStatement("insert into members(name,id,pwd,team,age,gender) values(?,?,?,?,?,?)");
                        statement1.setString(1, request.getParameter("userName"));
                        statement1.setString(2, request.getParameter("userId"));
                        statement1.setString(3, request.getParameter("userPwd"));
                        statement1.setString(4, request.getParameter("userTeam"));
                        statement1.setString(5, request.getParameter("userAge"));
                        statement1.setString(6, request.getParameter("userGender"));
                        statement1.executeUpdate();
                response.getWriter(0.write(rs.getSring(1)+","+rs.getString(2)+","+rs.getString(3)+","+rs.getString(4)+","+rs.getString(5)+","+rs.getString(6));
        }
        con.close();
%>
