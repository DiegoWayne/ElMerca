/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;
import java.io.FileOutputStream;
import java.io.IOException;

import java.io.InputStream;
import java.io.OutputStream;
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
public class Usuario extends HttpServlet {
      // database connection settings
    private PrintWriter out ;
    private String dbURL = "jdbc:mysql://127.0.0.1/mercado";
    private String dbUser = "root";
    private String dbPass = "";
    String query;

    @Override

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
           // Infromacion de usuario
           out = response.getWriter();
           String ID= request.getParameter("ID");
           String Nombre= request.getParameter("Nombre");
           String Descripcion= request.getParameter("Descripcion");
           String Precio= request.getParameter("Precio");
           String Unidades= request.getParameter("Unidades");
           String Categoria= request.getParameter("Categoria");

           
           InputStream Foto_1= null; // Foto de perfil
           InputStream Foto_2 = null; // Foto de portada
           InputStream Foto_3 = null; // Foto de portada
           InputStream Video = null; // Foto de portada
           
           int IDV= (int) (Math.random() * 100) + 1;
           String RutaV="C:\\ElMerca\\web\\Videos\\"+Nombre+Precio+Integer.toString(IDV)+".mp4";
           String RutaB="Videos\\"+Nombre+Precio+Integer.toString(IDV)+".mp4";

           
           //obteneido las imagenes de los inputs
           Part PartFoto_1 = request.getPart("Imagen_1");
           Part PartFoto_2 = request.getPart("Imagen_2");
           Part PartFoto_3 = request.getPart("Imagen_3");
           Part PartVideo = request.getPart("Video");
           
           if (PartFoto_1 != null) 
              Foto_1 = PartFoto_1.getInputStream();

           if (PartFoto_2 != null) 
              Foto_2 = PartFoto_2.getInputStream();
           
           if (PartFoto_3 != null) 
              Foto_3 = PartFoto_3.getInputStream();

           if (PartVideo != null) 
              Video = PartVideo.getInputStream();

                
            Connection conn = null; // connection to the database
            String message = null;  // message will be sent back to client


            //aqui encriptamos la  contraseña
         
           try {
               
            OutputStream out = new FileOutputStream(RutaV);
            byte[] buf = new byte[1024];
            int len;

            while ((len = Video.read(buf)) > 0)
            {out.write(buf, 0, len);}
            
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // constructs SQL statement
            query = "Call GuardarArticulo(?,"+Categoria+","+ID+","+Precio+","+Unidades+",?,?,?,?,?);";
            PreparedStatement statement = conn.prepareStatement(query);

            statement.setString(1, Nombre);
            statement.setBlob(2, Foto_1);
            statement.setBlob(3, Foto_2);
            statement.setBlob(4, Foto_3);
            statement.setString(5, RutaB);
            statement.setString(6, Descripcion);

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
