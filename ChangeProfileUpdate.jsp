<%-- 
    Document   : ChangeProfileUpdate
    Created on : Jun 18, 2015, 4:20:46 PM
    Author     : Jeffin_Ben
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <style>
            h1{
                color: green;
                font-family: sans-serif;
            }
            body{
                color: red;
                background-color: wheat;
                font-family:cursive;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GammaAnalytics User Registration System - Change Profile</title>
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
            String sql;            
            sql = "INSERT INTO user VALUES("
                    + "'" + request.getParameter("firstNameTextBox") + "',"
                    + "'" + request.getParameter("lastNameTextBox") + "',"
                    + "'" + request.getParameter("securityQuestionDropDown") + "',"
                    + "'" + request.getParameter("securityAnswerTextBox") + "',"
                    + "'" + request.getParameter("genderDropDown") + "',"
                    + request.getParameter("ageTextBox") + ")";
            boolean flag = stmt.execute(sql);
            if(flag==true) {
                System.out.println("Successfully Updated");
                %>
                <br><br><h2>Your Profile has been Successfully Updated!</h2>
                <%
            }
            else {
                System.out.println("Registration Unsuccessful");
                %>
                <br><br><h2>Profile Updation Failed!</h2>
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
