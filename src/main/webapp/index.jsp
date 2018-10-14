<%@page import="java.sql.*, java.net.*"%>
<%@page import="java.util.ArrayList" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%  
      Connection conn = null;
      ResultSet result = null;
      Statement stmt = null;
      ArrayList Categorias=new ArrayList();

      try {
        /*parametros para la conexion*/
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://us-cdbr-iron-east-01.cleardb.net/heroku_38a1979085a7b59";
        String usuario = "becdff0c984df4";
        String clave = "51e4aab00b5ef5b";

        conn = DriverManager.getConnection(url,usuario,clave);


        stmt = conn.createStatement();
        result = stmt.executeQuery("CALL VerCategorias();");

        while(result.next()) {
        out.write("skdmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmajnjsdnfjsdnvjsdnvhdfvh dfhvbsdhfbshfbshbfhdsbshbdfhsbdfhsbfhsbdfhsbhfbs");
          Categorias.add(result.getString("Categoria_Nombre"));

        }
 
        result.close();
        stmt.close();
        conn.close();
      }
      catch (Exception e) {
         System.out.println("Error " + e);
      }
%>
