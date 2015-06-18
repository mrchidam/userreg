<%-- 
    Document   : index
    Created on : Jun 17, 2015, 6:45:30 PM
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
         <title>Welcome to User Registration System</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
    <center>
        <%
            //STEP 1: JDBC driver name and database URL
            final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
            String DB_URL = "jdbc:mysql://localhost";
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
                stmt.execute("CREATE DATABASE IF NOT EXISTS userreg");
                stmt.close();
                conn.close();
                DB_URL = "jdbc:mysql://localhost/userreg";
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(DB_URL,USER,PASS);
                stmt = conn.createStatement();
                sql = "CREATE TABLE IF NOT EXISTS user("
                        + "id int AUTO_INCREMENT,"
                        + "firstname varchar(40),"
                        + "lastName varchar(40),"
                        + "email varchar(60),"
                        + "password varchar(20),"
                        + "securityquestion varchar(30),"
                        + "securityanswer varchar(30),"
                        + "gender enum('M','F'),"
                        + "age int"
                        + ")";
                stmt.execute(sql);

            } catch (ClassNotFoundException e) {
                 e.printStackTrace();
            } catch (SQLException e) {
                 e.printStackTrace();
            }
        %>

        <h1>GammaAnalytics User Registration System</h1>
        <h2>Welcome user, Here is your menu:</h2>
        <form action="RegistrationForm.html">
            <input type="submit" value="Register as a new User">
        </form>
        <br>
        <br>
        <form action="LoginForm.html">
            <input type="submit" value="Login as an existing User">
        </form>
    </center>
    </body>
</html>
