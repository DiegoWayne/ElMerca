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

@WebServlet(
        name = "MyServlet", 
        urlPatterns = {"/hello"}
    )
public class HelloServlet extends HttpServlet {

    private String dbURL = "jdbc:mysql://us-cdbr-iron-east-01.cleardb.net/heroku_38a1979085a7b59";
    private String dbUser = "becdff0c984df4";
    private String dbPass = "51e4aab00b5ef5b";
     
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        ServletOutputStream out = resp.getOutputStream();
        out.write("hello heroku".getBytes());
        out.flush();
        out.close();
    }
    
        protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
           String Titulo= request.getParameter("Titulo");
           String Descripcion= request.getParameter("descripcion");
           String Privacidad= request.getParameter("privacidad");
           String Categoria =request.getParameter("categorias");
           String id_usuario=request.getParameter("Id_usuario") ;

         
        InputStream VideoF = null; // input stream of the upload file

        // obtains the upload file part in this multipart request
        Part Video = request.getPart("Video");

        if (Video != null) {
            // prints out some information for debugging
            System.out.println(Video.getName());
            System.out.println(Video.getSize());
            System.out.println(Video.getContentType());
             
            // obtains input stream of the upload file
            VideoF = Video.getInputStream();
        }
        

         
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
 
            // constructs SQL statement
            String sql = "CALL Subir_Video(?,"+Privacidad+ ","+id_usuario+",?,"+Categoria+",?);";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, Titulo);
            statement.setString(2, Descripcion);
            statement.setBlob(3, VideoF);


 
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
