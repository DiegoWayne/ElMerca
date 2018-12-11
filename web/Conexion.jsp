
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.*, java.net.*"%>

<%! 
  public class Conexion 
    {
      private String driver = "com.mysql.jdbc.Driver";       
      private String url = "jdbc:mysql://localhost/Mercado";
      private String usuario = "root";
      private String clave = "";

      private Connection conn = null;
      private ResultSet result = null;
      private Statement stmt = null;
      private ArrayList Resultado=new ArrayList();
      public HttpSession session;  

      public Conexion() 
        {
         try
         {Class.forName("com.mysql.jdbc.Driver");
          conn = DriverManager.getConnection(url,usuario,clave);}

         catch (Exception e) 
         {System.out.println("Error " + e);}
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
                  session.setAttribute("Portada",result.getBlob("Usuario_Portada")); 
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



       public String Imagen (Blob image)
       {
        try
        {        Blob bl = image;
        byte[] encodeBase64 = Base64.getEncoder().encode(bl.getBytes(1,(int)bl.length()));
        String base64DataString = new String(encodeBase64 , "UTF-8");
        
        return base64DataString;}



                  catch (Exception e) 
          {return "";}

       }
       
       
        public ResultSet VerProductosUsuario(String ID)
        {
            try
            {
                result.close();
                stmt.close();
                ResultSet Temp;
                stmt = conn.createStatement();
                result = stmt.executeQuery("CALL VerVideosUser("+ID+");");
                return result;
            }
            catch (Exception e)
              {System.out.println("Error "+ e);}
        
            return null;
        }
        
        public ResultSet Valoracion(String ID)
        {
            try
            {
                result.close();
                stmt.close();
                ResultSet Temp;
                stmt = conn.createStatement();
                result = stmt.executeQuery("select Valoracion("+ID+");");
                return result;
            }
            catch (Exception e)
              {System.out.println("Error "+ e);}
        
            return null;
        } 
        
        public ResultSet BuscarProducto(String ID)
        {
            try
            {
                result.close();
                stmt.close();
                ResultSet Temp;
                stmt = conn.createStatement();
                result = stmt.executeQuery("CALL BuscarProducto("+ID+");");
                return result;
            }
            catch (Exception e)
              {System.out.println("Error "+ e);}
        
            return null;
        } 
        public ResultSet VerComentarios(String ID)
        {
            try
            {
                result.close();
                stmt.close();
                ResultSet Temp;
                stmt = conn.createStatement();
                result = stmt.executeQuery("CALL VerComentarios("+ID+");");
                return result;
            }
            catch (Exception e)
              {System.out.println("Error "+ e);}
        
            return null;
        } 
             
      public ResultSet verCategorias()
       {
            try
            {

                stmt = conn.createStatement();
                result = stmt.executeQuery("CALL VerCategorias()");
                return result;
            }
            catch (Exception e)
              {System.out.println("Error "+ e);}
        
            return null;
       }
              
       public boolean Elimina(String ID)
        {
          try
          {
            String query="Call EliminarArticulo('"+ID+"');";
            stmt = conn.createStatement();
            result = stmt.executeQuery(query);
             
            return true;
          }

          catch (Exception e) 
          {return false;}
             
        }
       
        public boolean Califica(String IDU,String IDA,String Cal)
        {
          try
          {
            String query="Call Califica("+IDU+","+IDA+","+Cal+");";
            stmt = conn.createStatement();
            result = stmt.executeQuery(query);
             
            return true;
          }

          catch (Exception e) 
          {return false;}
             
        }
        
        public boolean Comentario(String IDU,String IDA,String Cal)
        {
          try
          {
            String query="Call Comentario("+IDU+","+IDA+",'"+Cal+"');";
            stmt = conn.createStatement();
            result = stmt.executeQuery(query);
             
            return true;
          }

          catch (Exception e) 
          {return false;}
             
        }
        
        public ResultSet Buscar(String Cal)
        {
          try
          {
            String query="Call Buscar('"+Cal+"');";
            stmt = conn.createStatement();
            result = stmt.executeQuery(query);
             
            return result;
          }

          catch (Exception e) 
          {return null;}
             
        }
        
        public ResultSet Historial(String Cal)
        {
          try
          {
            String query="Call Historial('"+Cal+"');";
            stmt = conn.createStatement();
            result = stmt.executeQuery(query);
             
            return result;
          }

          catch (Exception e) 
          {return null;}
             
        }
        
        public ResultSet Vermasvistos()
        {
          try
          {
            String query="Call Vermasvistos();";
            stmt = conn.createStatement();
            result = stmt.executeQuery(query);
             
            return result;
          }

          catch (Exception e) 
          {return null;}
             
        } 
        public ResultSet VerCategoria(String ID)
        {
          try
          {
            String query="Call VerCategoria("+ID+");";
            stmt = conn.createStatement();
            result = stmt.executeQuery(query);
             
            return result;
          }

          catch (Exception e) 
          {return null;}
             
        }         
        
        
       public ResultSet VerCarrito(String ID)
        {
          try
          {
            String query="Call VerCarrito("+ID+");";
            stmt = conn.createStatement();
            result = stmt.executeQuery(query);
            return result;
          }

          catch (Exception e) 
          {return null;}
        
          }
       public void Aliminar(String ID,String ID2)
        {
          try
          {
            String query="Call Aliminar("+ID+","+ID2+");";
            stmt = conn.createStatement();
            result = stmt.executeQuery(query);
          }

          catch (Exception e) 
          {}
        
          }
       
        public void Comprar(String ID)
        {
          try
          {
             Connection conn2 = null;
             ResultSet result2 = null;
             Statement stmt2 = null;
             Class.forName("com.mysql.jdbc.Driver");
             conn2 = DriverManager.getConnection(url,usuario,clave);
             String query="call VerCarrito("+ID+");";

            
            stmt = conn.createStatement();
            result = stmt.executeQuery(query);
            while(result.next())
                    {
                    String quer2="select Comprar("+ID+","+result.getString("Articulo_ID")+");";
                    stmt2 = conn2.createStatement();
                    result2 = stmt2.executeQuery(quer2);
                    }
          }

          catch (Exception e) 
          {
              
          }
        
          }

      public boolean AgregarAlCarrito(String IDU,String IDP)
        {
          try
          {
            String query="select AgregarAlCarrito("+IDU+","+IDP+");";
            stmt = conn.createStatement();
            result = stmt.executeQuery(query);
            while(result.next())
                    {
                       if(result.getInt(1)==1)return true;
                       else return false;
                    }
      
          }

          catch (Exception e) 
          {return false;}
             return false;
        }
    
  }  
%>






