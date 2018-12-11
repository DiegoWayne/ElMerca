<%@page import="java.sql.*, java.net.*"%>
<%@page import="java.util.ArrayList" %>
<%@ include file='../Conexion.jsp' %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%  
      Conexion Conex = new Conexion();
      Conex.session=request.getSession();
      try 
      {
        if(Conex.Login(request.getParameter("Correo"),request.getParameter("Contrasena"))==true)
        {
        Conex.Cerrar();
        response.sendRedirect("http://localhost:8080/ElMerca/index.jsp");
        }

        else
        {
        Conex.Cerrar();
        response.sendRedirect("http://localhost:8080/ElMerca/Login.jsp?Mensaje=1");
        }

      }
      catch (Exception e) {
         System.out.println("Error " + e);
      }
%>



