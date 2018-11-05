
<%! 
  public class Conexion 
    {
      private String driver = "com.mysql.jdbc.Driver";       
      private String url = "jdbc:mysql://us-cdbr-iron-east-01.cleardb.net/heroku_38a1979085a7b59";
      private String usuario = "becdff0c984df4";
      private String clave = "2a67e3b23e75902";

      private Connection conn = null;
      private ResultSet result = null;
      private Statement stmt = null;
      private ArrayList Resultado=new ArrayList();
      public HttpSession session;  

      public Conexion() 
        {
         try
         {conn = DriverManager.getConnection(url,usuario,clave);}

         catch (Exception e) 
         {System.out.println("Error " + e);}
        }

      public ArrayList verCategorias()
       {
         try
         {
 	        stmt = conn.createStatement();
          result = stmt.executeQuery("CALL VerCategorias();");

          while(result.next()) 
            Resultado.add(result.getString("Categoria_Nombre"));
          
          result.close();
          stmt.close();
         }

        catch (Exception e) 
          {System.out.println("Error " + e);}

        return Resultado;
       }

      public void Cerrar()
        {
          try
          {conn.close();}

          catch (Exception e) 
          {System.out.println("Error " + e);}

        }

      public boolean Login(String Correo,String Contrasena)
        {
          try
          {
            String query="Call Login('"+Correo+"');";
            stmt = conn.createStatement();
            result = stmt.executeQuery(query);
            while(result.next()) 
            {
              if(result.getString("Usuario_Contrasena").equals(Contrasena))
                {
                  session.setAttribute("ID",result.getString("Usuario_ID"));
                  session.setAttribute("Perfil",result.getBlob("Usuario_Perfil"));
                  session.setAttribute("Portada",result.getString("Usuario_Portada")); 
                  session.setAttribute("Mote",result.getString("Usuario_Mote"));
                  result.close();
                  stmt.close();
                  return true;
                }

              else
                {
                  result.close();
                  stmt.close();
                  return false; 
                }
            }
          }

          catch (Exception e) 
          {System.out.println("Error " + e);}
             
          return false;
        }
    }
%>