<%@page import="java.sql.*, java.net.*"%>
<%@page import="java.util.ArrayList" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Base64"%>
<%@ include file='../Conexion.jsp' %>


<%  
      Conexion Conex = new Conexion();
      
      if(Conex.Elimina(request.getParameter("ID"))==true)
        response.sendRedirect("http://localhost:8080/ElMerca/index.jsp");
        

        else
        response.sendRedirect("http://localhost:8080/ElMerca/index.jsp");
        
%>