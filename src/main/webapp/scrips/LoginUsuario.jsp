<%@page import="java.sql.*, java.net.*"%>
<%@page import="java.util.ArrayList" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%  
      Connection conn = null;
      ResultSet result = null;
      Statement stmt = null;

      String Contrasena;

      try 
      {
        /*parametros para la conexion*/
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://us-cdbr-iron-east-01.cleardb.net/heroku_38a1979085a7b59";
        String usuario = "becdff0c984df4";
        String clave = "51e4aab00b5ef5b";

        conn = DriverManager.getConnection(url,usuario,clave);

        String query="Call Login('"+request.getParameter("Correo")+"');";
        out.println(query);  
        stmt = conn.createStatement();
        result = stmt.executeQuery(query);

        if(result.getString("Usuario_Contrasena").equals(request.getParameter("Contrasena")))
        {
          session.setAttribute("ID",result.getString("Usuario_ID"));
          session.setAttribute("Perfil",result.getString("Usuario_Perfil"));
          session.setAttribute("Portada",result.getString("Usuario_Portada")); 
          session.setAttribute("Mote",result.getString("Usuario_Mote"));
          response.sendRedirect("https://elmerca.herokuapp.com/");
          out.println("<a href='Login.jsp'>SiFunciono</a>");  
        }
        else
        out.println("<a href='Login.jsp'>Voler a Intentarlo</a>"); 
         
        result.close();
        stmt.close();
        conn.close();
      }
      catch (Exception e) {
         System.out.println("Error " + e);
      }
%>