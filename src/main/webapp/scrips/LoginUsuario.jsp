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
        out.println("si");
        out.println(session.getAttribute("ID"));
        }
        else
        {
        out.println("no");          
        }
        Conex.Cerrar();

      }
      catch (Exception e) {
         System.out.println("Error " + e);
      }
%>



