
<%! public class Conexion {

      private String driver = "com.mysql.jdbc.Driver";       
      private String url = "jdbc:mysql://us-cdbr-iron-east-01.cleardb.net/heroku_38a1979085a7b59";
      private String usuario = "becdff0c984df4";
      private String clave = "2a67e3b23e75902";

     private Connection conn = null;
     private ResultSet result = null;
     private Statement stmt = null;
      ArrayList Categorias=new ArrayList();

    public Conexion() 
    {
     try {
        conn = DriverManager.getConnection(url,usuario,clave);
         }
      catch (Exception e) {
         System.out.println("Error " + e);
      }
    }

 public ArrayList verCategorias()
 {

 	        stmt = conn.createStatement();
        result = stmt.executeQuery("CALL VerCategorias();");

        while(result.next()) 
        {
          Categorias.add(result.getString("Categoria_Nombre"));
        }
 
        result.close();
        stmt.close();

        return Categorias;
 }

}
%>