<%@page import="java.sql.*, java.net.*"%>
<%@page import="java.util.ArrayList" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%  
      Conexion Conex = new Conexion();
      try 
      {
        if(Conex.Login(request.getParameter("Correo"),request.getParameter("Contrasena"))==true)
        {
        out.println("si");
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



