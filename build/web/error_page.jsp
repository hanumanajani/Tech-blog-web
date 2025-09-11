<%-- 
    Document   : error_page
    Created on : 4 Feb 2025, 11:38:38 am
    Author     : HANUMANA RAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry! somthing went wrong</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">  
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 95%, 66% 100%, 32% 95%, 0 100%, 0 0);
            }
            html, body {
            overflow-x: hidden;    /* stop horizontal scroll */
            scroll-behavior: smooth;
        }
        </style>
    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>
        <div class="container text-center">
            <img src="img/error.png" class="img-fluid p-4" />
            <h3>Sorry! Somthing went wrong...</h3>
             
            
            
            <a href="index.jsp" class="btn primary-background text-white btn-lg mt-3">Home</a>
            
        </div>
        
        
    </body>
</html>
