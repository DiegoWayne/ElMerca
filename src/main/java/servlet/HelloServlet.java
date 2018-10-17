package servlet;

import java.io.IOException;

import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(
        name = "MyServlet",
        urlPatterns = {"/MyServlet"}
    )
@MultipartConfig(maxFileSize = 16177215) 

public class HelloServlet extends HttpServlet {

       // database connection settings
    private PrintWriter out ;
    private String dbURL = "jdbc:mysql://us-cdbr-iron-east-01.cleardb.net/heroku_38a1979085a7b59";
    private String dbUser = "becdff0c984df4";
    private String dbPass = "51e4aab00b5ef5b";

    @Override

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
           // Infromacion de usuario
           out = response.getWriter();
           String Nombre= request.getParameter("Nombre");
           String Nickname= request.getParameter("Nickname");
           String Correo= request.getParameter("Correo");
           String Contrasena =request.getParameter("Contrasena");

           InputStream FotoPerfil= null; // Foto de perfil
           InputStream FotoPortada = null; // Foto de portada

           //Datos de envio
           String Telefono= request.getParameter("Telefono");
           String Calle= request.getParameter("Calle");
           String Numero= request.getParameter("Numero");
           String Postal= request.getParameter("Postal");
           String Estados= request.getParameter("Estados");
           
           //obteneido las imagenes de los inputs
           Part Perfil = request.getPart("Imagen_1");
           Part Portada = request.getPart("Imagen_2");

           if (Perfil != null) 
            FotoPerfil = Perfil.getInputStream();

           if (Portada != null) 
            FotoPortada = Portada.getInputStream();
                
            Connection conn = null; // connection to the database
            String message = null;  // message will be sent back to client
         
           try {
            // connects to the database
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // constructs SQL statement
            String query = "GuardarUsuario(?,?,?,?,?,?,?,?,?,?,?);";
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setString(1, Nombre);
            statement.setString(2, Nickname);
            statement.setString(3, Contrasena);
            statement.setString(4, Telefono);
            statement.setString(5, Calle);
            statement.setString(6, Numero);
            statement.setString(7, Postal);
            statement.setString(8, Estados);
            statement.setBlob(9, FotoPerfil);
            statement.setBlob(10, FotoPortada);
            statement.setString(11, Correo);
 
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {

                message = "File uploaded and saved into database";
                out.println("<h1>" + message + "</h1>");
            }
        } 
        catch (SQLException ex) 
        {
            message = "ERROR: " + ex.getMessage();
          out.println("<h1>" + message + "</h1>");
        }
        finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            // sets the message in request scope
             
        }
    }
    
}
