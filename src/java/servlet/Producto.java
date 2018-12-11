/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

@MultipartConfig(maxFileSize = 16177215) 
/**
 *
 * @author Diego
 */
public class Producto extends HttpServlet {

      // database connection settings
    private PrintWriter out ;
    private String dbURL = "jdbc:mysql://127.0.0.1/mercado";
    private String dbUser = "root";
    private String dbPass = "";

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
           Part Perfil = request.getPart("Perfil");
           Part Portada = request.getPart("Portada");

           if (Perfil != null) 
              FotoPerfil = Perfil.getInputStream();

           if (Portada != null) 
            FotoPortada = Portada.getInputStream();
                
            Connection conn = null; // connection to the database
            String message = null;  // message will be sent back to client


            //aqui encriptamos la  contraseña
         
           try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // constructs SQL statement
            String query = "Call GuardarUsuario(?,?,?,?,?,?,?,?,?,?,?);";
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
               response.sendRedirect("http://localhost:8080/ElMerca/index.jsp");
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
