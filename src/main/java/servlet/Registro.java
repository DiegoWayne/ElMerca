package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
 
@MultipartConfig(maxFileSize = 16177215) 

@WebServlet(
        name = "Registro", 
        urlPatterns = {"/Registro"}
    )
public class HelloServlet extends HttpServlet {
    private String dbURL = "jdbc:mysql://us-cdbr-iron-east-01.cleardb.net/heroku_38a1979085a7b59";
    private String dbUser = "becdff0c984df4";
    private String dbPass = "51e4aab00b5ef5b";
     
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
           String correo= request.getParameter("correo");
           String contra= request.getParameter("contrasena");
           String fecha= request.getParameter("fecha");
           String sexo =request.getParameter("sexo");
           String ciudad= request.getParameter("ciudad");
           String pais =request.getParameter("pais");
           String usero = request.getParameter("usuario");
         
        InputStream perfilF = null; // input stream of the upload file
        InputStream portadaF = null; // input stream of the upload file

        // obtains the upload file part in this multipart request
        Part perfil = request.getPart("perfil");
        Part portada = request.getPart("portada");

        if (perfil != null) {
            // prints out some information for debugging
            System.out.println(perfil.getName());
            System.out.println(perfil.getSize());
            System.out.println(perfil.getContentType());
             
            // obtains input stream of the upload file
            perfilF = perfil.getInputStream();
        }
        
        if (portada != null) {
            // prints out some information for debugging
            System.out.println(portada.getName());
            System.out.println(portada.getSize());
            System.out.println(portada.getContentType());
             
            // obtains input stream of the upload file
            portadaF = portada.getInputStream();
        }
         
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
 
            // constructs SQL statement
            String sql = "CALL insertar_usuario(?,?,?,?,?,?,?,?,?);";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, correo);
            statement.setString(2, contra);
            statement.setString(3, fecha);
            statement.setString(4, sexo);
            statement.setString(5, ciudad);
            statement.setString(6, pais);
            statement.setBlob(7, perfilF);
            statement.setBlob(8, portadaF);
            statement.setString(9, usero);

 
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "File uploaded and saved into database";
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
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
