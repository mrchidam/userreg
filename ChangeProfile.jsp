<%-- 
    Document   : ChangeProfile.jsp
    Created on : Jun 18, 2015, 4:05:42 PM
    Author     : Jeffin_Ben
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <h2>Change Profile: Provide your current Details</h2>
        <form action="ChangeProfileUpdate.jsp" method="POST">
            <table>
                <tr><td>First Name:</td> <td><input type="text" id="firstNameTextBox" name="firstNameTextBox" required/></td></tr>
                <tr><td>Last Name:</td> <td><input type="text" id="lastNameTextBox" name="lastNameTextBox"/></td></tr>
                <tr><td>Security Question:</td><td><select id="securityQuestionDropDown" name="securityQuestionDropDown">
                            <option>What is your first Teacher's Name?</option>
                            <option>What is your first School Name?</option>
                            <option>What is your first Pet's Name?</option>
                            <option>Who is your first Crush?</option>
                        </select></td></tr>
                <tr><td>Answer:</td><td><input type="text" id="securityAnswerTextBox" name="securityAnswerTextBox"></td></tr>
                <tr><td>Gender:</td><td><select id="genderDropDown" name="genderDropDown">
                    <option value="M">Male</option>
                    <option value="F">Female</option>
                </select></td></tr>
                <tr><td>Age:</td><td><input type="number" id="ageTextBox" name="ageTextBox" required></td></tr>
            </table>
            <input type="hidden" value="<%=request.getParameter("emailTextBox")%>" id="emailTextBox"/>
            <input type="submit" value="Update"/>
        </form>
    </center>    
    </body>
</html>
