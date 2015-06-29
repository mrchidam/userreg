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
		<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.js"></script>		<!--Adding Angular JS Framework File-->	
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
    <body ng-app="validateApp">											<!--This body is the Owner of an ANGULAR JS Application "validateApp"-->
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
            <form name="ForgotPassword" id="ForgotPassword" action="ForgotPasswordValidate.jsp" method="POST"> 
			<!--Validation of fields using ANGULAR JS-->			
            Answer:<input type="text" id="securityAnswerTextBox" name="securityAnswerTextBox" ng-model="answer" ng-required="true"> 	<!--Modelling the text field to an Angular JS variable-->
			<span ng-show="ForgotPassword.securityAnswerTextBox.$error.required">Security Answer is required.</span>
            <input type="hidden" value="<%=request.getParameter("emailTextBox")%>" id="emailTextBox"/>
            New Password:</td><td><input type="password" id="newPasswordTextBox" name="newPasswordTextBox" ng-model="newPassword" ng-required="true"/>
			<span style="color:red;font-size:15px" ng-show="ForgotPassword.newPasswordTextBox.$error.required">New Password is required</span>
			<span style="color:red;font-size:15px" ng-show="!ForgotPassword.newPasswordTextBox.$error.required && passwordNotValid()">Password must be atleast 6 characters</span>
			
            Retype New Password:</td><td><input type="password" id="retypeNewPasswordTextBox" name="retypeNewPasswordTextBox" ng-model="retypeNewPassword" ng-required="true"/>
			<span style="color:red;font-size:15px" ng-show="passwordNotMatch()">Passwords does Not Match!</span>
			
            <br><input type="submit" value="SUBMIT" ng-disabled="!(!ForgotPassword.$error.required && !ForgotPassword.$invalid && !passwordNotValid() && !passwordNotMatch())" /> <!--Enables the Submit Button only if all the Validations succeed! Here we use "ng-disabled" directive for that!!-->
            </form>
            <%          
         } catch (ClassNotFoundException e) {
             e.printStackTrace();
         } catch (SQLException e) {
             e.printStackTrace();
         }
        %>
    </center>
	<script>
		var app = angular.module('validateApp', []);
		app.controller('validateCtrl', function($scope) {			
			$scope.newPassword="";
			$scope.retypeNewPassword="";
			$scope.passwordNotValid  = function() {return ($scope.newPassword.length < 6);};					<!--Validate Password Length-->
			$scope.passwordNotMatch  = function() {return ($scope.newPassword!=$scope.retypeNewPassword);};		<!--Check for NewPassword=RetypeNewPassword Match-->
		});		
	</script>
    </body>
</html>
