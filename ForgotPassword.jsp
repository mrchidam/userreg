<%-- 
    Document   : ForgotPassword
    Created on : Jun 17, 2015, 8:35:05 PM
    Author     : Jeffin_Ben
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
       <style>
            h1{
                color: red;
                font-family: sans-serif;
            }
            body{
                color: red;
                background-color: wheat;
                font-family: sans-serif;
            }
        </style>          
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GammaAnalytics User Registration System - Forgot Password</title>
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
            PreparedStatement prepstmt = conn.prepareStatement("SELECT securityquestion FROM user WHERE email IN(?)");
            prepstmt.setString(1,request.getParameter("emailTextBox"));
            ResultSet rs = prepstmt.executeQuery();
            rs.next();            
            %>
            <br><br><h2>Security Question:<%rs.getString("securityquestion");%> </h2>
            <form action="ForgotPasswordValidate.jsp" method="POST">                
            Answer:<input type="text" id="securityAnswerTextBox" name="securityAnswerTextBox">
            <input type="hidden" value="<%=request.getParameter("emailTextBox")%>" id="emailTextBox"/>
            New Password:</td><td><input type="password" id="newPasswordTextBox" name="newPasswordTextBox" required/>
            Retype New Password:</td><td><input type="password" id="retypeNewPasswordTextBox" name="retypeNewPasswordTextBox" required/>
            <input type="submit" value="SUBMIT"/>
            </form>
            <%          
         } catch (ClassNotFoundException e) {
             e.printStackTrace();
         } catch (SQLException e) {
             e.printStackTrace();
         }
        %>
    </center>
    </body>
</html>

