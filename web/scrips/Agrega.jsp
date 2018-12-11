<%@page import="java.sql.*, java.net.*"%>
<%@page import="java.util.ArrayList" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Base64"%>
<%@ include file='../Conexion.jsp' %>

<head>
  <meta charset="utf-8">
  <title>Mercado</title>
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Muchos iconos -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Estilo Principal -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- Skins varias  -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
  <!-- Estilo de productos  -->
  <link rel="stylesheet" href="dist/css/Productos.css">
</head>

<%  
      Conexion Conex = new Conexion();
      
      if(Conex.AgregarAlCarrito(request.getParameter("IDU"),request.getParameter("IDP"))==true)
        response.sendRedirect("http://localhost:8080/ElMerca/Articulo.jsp?ID="+request.getParameter("IDP"));
        

        else
          out.println("No hay producto disponible volver al <a href='../index.jsp' class='navbar-brand'> <p style='border-style: solid; border-width:2px;'> <b>El</b>Merca</p></a>");
        
%>
