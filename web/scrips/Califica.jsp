<%@page import="java.sql.*, java.net.*"%>
<%@page import="java.util.ArrayList" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Base64"%>
<%@ include file='../Conexion.jsp' %>


<%  
      Conexion Conex = new Conexion();
      
      if(Conex.Califica(request.getParameter("IDU"),request.getParameter("IDP"),request.getParameter("Calificacion"))==true)
        response.sendRedirect("http://localhost:8080/ElMerca/Articulo.jsp?ID="+request.getParameter("IDP"));
        

        else
        response.sendRedirect("http://localhost:8080/ElMerca/Articulo.jsp?ID="+request.getParameter("IDP"));
        
%>