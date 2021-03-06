<%-- 
    Document   : ChangeProfile.jsp
    Created on : Jun 18, 2015, 4:05:42 PM
    Author     : Jeffin_Ben
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
		<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.js"></script>		<!--Adding Angular JS Framework File-->	
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
    <body ng-app="validateApp">											<!--This body is the Owner of an ANGULAR JS Application "validateApp"-->
        <a href="index.jsp"><input type="submit" value="HOME"/></a>
    <center>
        <h1>GammaAnalytics User Registration System</h1>
        <h2>Change Profile: Provide your current Details</h2>
        <form name="ChangeProfile" id="ChangeProfile" action="ChangeProfileUpdate.jsp" method="POST">
            <table>
				<tr><td>--------------------------</td><td>------------------------------------</td><td>-------------------------------------------------</td></tr>
				<!--Validation of fields using ANGULAR JS Properties-->
                <tr><td>First Name:</td> <td><input type="text" id="firstNameTextBox" name="firstNameTextBox" ng-model="firstName" ng-required="true"/></td><!--Modelling the text field to an Angular JS variable-->
				<td>			
				<span ng-show="ChangeProfile.firstNameTextBox.$error.required">First Name is required.</span>
				</td></tr>
                <tr><td>Last Name:</td> <td><input type="text" id="lastNameTextBox" name="lastNameTextBox" ng-model="lastName"/></td></tr>
                <tr><td>Security Question:</td><td><select id="securityQuestionDropDown" name="securityQuestionDropDown">
                            <option>What is your first Teacher's Name?</option>
                            <option>What is your first School Name?</option>
                            <option>What is your first Pet's Name?</option>
                            <option>Who is your first Crush?</option>
                        </select></td></tr>
                <tr><td>Answer:</td><td><input type="text" id="securityAnswerTextBox" name="securityAnswerTextBox" ng-model="answer" ng-required="true"></td>
				<td>			
				<span ng-show="ChangeProfile.securityAnswerTextBox.$error.required">Security Answer is required.</span>
				</td></tr>
                <tr><td>Gender:</td><td><select id="genderDropDown" name="genderDropDown">
                    <option value="M">Male</option>
                    <option value="F">Female</option>
                </select></td></tr>
                <tr><td>Age:</td><td><input type="number" id="ageTextBox" name="ageTextBox" ng-model="age" ng-required="true"></td>
				<td>			
				<span ng-show="ChangeProfile.ageTextBox.$error.required">Age is required.</span>
				</td></tr>
				<tr><td>--------------------------</td><td>------------------------------------</td><td>-------------------------------------------------</td></tr>
            </table>
            <input type="hidden" value="<%=request.getParameter("emailTextBox")%>" id="emailTextBox"/>
            <input type="submit" value="Update" ng-disabled="!(!ChangeProfile.$error.required && !ChangeProfile.$invalid)"/> <!--Enables the Submit Button only if all the Validations succeed! Here we use "ng-disabled" directive for that!!-->
        </form>
    </center>
	<script>
		var app = angular.module('validateApp', []);
	</script>	
    </body>
</html>
