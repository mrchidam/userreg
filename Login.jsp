<%-- 
    Document   : Login
    Created on : Jun 17, 2015, 8:00:30 PM
    Author     : Jeffin_Ben
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <style>
            h1{
                color: blueviolet;
                font-family: sans-serif;
            }
            body{
                color: red;
                background-color: cyan;
                font-family:monospace;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GammaAnalytics User Registration System - Login</title>
    </head>
    <body>
        <a href="index.jsp"><input type="submit" value="HOME"/></a>
    <center>
        <h1>GammaAnalytics User Registration System</h1>
        <%
        //STEP 1: JDBC driver name and database URL
        final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
        String DB_URL = "jdbc:mysql://localhost/userreg";
        final String USER = "root";
        final String PASS = "";
        Connection conn = null;
        try{
            //STEP 2: Register JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            //STEP 3: Open a connection
            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection(DB_URL,USER,PASS);

            //STEP 4: Execute a query
            System.out.println("Creating Prepared statement...");
            PreparedStatement prepstmt = conn.prepareStatement("SELECT password FROM user WHERE email IN(?)");
            prepstmt.setString(1,request.getParameter("emailTextBox"));
            ResultSet rs = prepstmt.executeQuery();
            rs.next();
            if(rs.getString("password").equals(request.getParameter("passwordTextBox"))) {
                %>
                <br><br><h2>Login Successful!</h2>
                <form action="ChangeProfile.jsp" method="POST">
                    <input type="hidden" value="<%=request.getParameter("emailTextBox")%>" id="emailTextBox"/>
                    <input type="submit" value="Change Profile"/>
                </form>
                <form action="ChangePasswordForm.html">
                    <input type="submit" value="Change Password">
                </form>
                <%
            }
            else {
                 %>
                <br><br><h2>Login Unsuccessful!</h2>
                <%
            }
         } catch (ClassNotFoundException e) {
             e.printStackTrace();
         } catch (SQLException e) {
             e.printStackTrace();
         }
        %>
    </center>
    </body>
</html>

