<%@page import="java.sql.*, java.net.*"%>
<%@page import="java.util.ArrayList" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Base64"%>
<%@ include file='../Conexion.jsp' %>

<%  
      Conexion Conex = new Conexion();
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Mercado</title>
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Muchos iconos -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Estilo Principal -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- Skins varias  -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
  <!-- Estilo de productos  -->
  <link rel="stylesheet" href="dist/css/Productos.css">
</head>

<!-- Tipo de de menu -->
<body class="skin-black-light fixed layout-top-nav">
    <!-- Contenido de la pagina-->
   <section class="content" id="Contenido">
      <!--Titulo de la busqueda-->
      <div class="box box-primary">
           <div class="box-header with-border">
             <h3 class="box-title">Resultado de la busqueda</h3>
      </div>

      <!--Contenedor de los Productos-->
      <div class="box-body">
        <ul class="products-list product-list-in-box">
          <!--Lista de productos-->
             <%
                ResultSet Temp;
                Temp=Conex.Buscar(request.getParameter("q"));
                while(Temp.next())
                            {
                                out.println("<li class='item'>"
                                           +"<div class='product-img'>"
                                           +"<img src='data:image/jpeg;base64,"+ Conex.Imagen(Temp.getBlob("Articulo_Imagen_1"))+"' style='width: 150px ; height: 100px;'>"
                                           +"</div>"
                                           +"<div class='product-info'>"
                                           + "<a  href='Articulo.jsp?ID="+Temp.getString("Articulo_ID")+"' class='product-title'>"+Temp.getString("Articulo_Nombre")+"</a>");
                                out.println("<span class='label label-warning pull-right'>"+Temp.getString("Articulo_Precio")+"</span>"
                                           +"<span class='product-description'>"+Temp.getString("Articulo_Descripcion")+"</span>"
                                           +"</div>"
                                           +"</li>");
                            }
             %>
        </ul>
      </div>
      </div>
      
    </section>


<!-- jQuery 3.1.1 -->
<script src="plugins/jQuery/jquery-3.1.1.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!--Scrip para buscar-->
<script src="js/Buscar.js"></script>

</body>
</html>
