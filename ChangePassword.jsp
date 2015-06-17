<%-- 
    Document   : ChangePassword
    Created on : Jun 17, 2015, 8:14:02 PM
    Author     : Chidambaram_M01
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
                font-size: 20;
            }
            body{
                color: red;
                background-color: cyan;
                font-family:monospace;
                font-size: 20;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GammaAnalytics User Registration System - Change Password</title>
    </head>
    <body>
    <center>
        <h1>GammaAnalytics User Registration System</h1>
        <%
        //STEP 1: JDBC driver name and database URL
        final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
        String DB_URL = "jdbc:mysql://localhost/userreg";
        final String USER = "root";
        final String PASS = "";
        Connection conn = null;
        Statement stmt = null;
        try{
            //STEP 2: Register JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            //STEP 3: Open a connection
            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection(DB_URL,USER,PASS);

            //STEP 4: Execute a query
            System.out.println("Creating statement...");
            stmt = conn.createStatement();            
            PreparedStatement prepstmt = conn.prepareStatement("SELECT password FROM user WHERE email IN(?)");
            prepstmt.setString(1,request.getParameter("emailTextBox"));
            ResultSet rs = prepstmt.executeQuery();
            rs.next();
            if(rs.getString("password").equals(request.getParameter("oldPasswordTextBox"))) {
               String SQL = "UPDATE user SET password = '" + request.getParameter("newPasswordTextBox") +"' WHERE email = '" + request.getParameter("emailTextBox") + "'";
               boolean flag = stmt.execute(SQL);
                if(flag==true) {
                    System.out.println("Successfully Changed!");
                    %>
                    <br><br><h2>Password Successfully Changed</h2>
                    <%
                }
                else {
                    System.out.println("Password Change failed!");
                    %>
                    <br><br><h2>Sorry! Password Change failed!</h2>
                    <%
                }
            }
            else {
                %>
                <h2>Wrong Old Password!</h2>
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

