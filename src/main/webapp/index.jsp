<%@page import="java.sql.*, java.net.*"%>
<%@page import="java.util.ArrayList" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%  
      Connection conn = null;
      ResultSet result = null;
      Statement stmt = null;
      ArrayList Categorias=new ArrayList();

      try {

        URI dbUri = new URI(System.getenv("DATABASE_URL"));
        String username = dbUri.getUserInfo().split(":")[0];
        String password = dbUri.getUserInfo().split(":")[1];
        String dbUrl = "jdbc:mysql://" + dbUri.getHost() + dbUri.getPath();

        conn = DriverManager.getConnection(dbUrl, username, password);
        out.println(dbUrl + username + password);
        stmt = conn.createStatement();
        result = stmt.executeQuery("CALL VerCategorias();");

        while(result.next()) 
        {
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

