<%@page import="java.sql.*, java.net.*"%>
<%@page import="java.util.ArrayList" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Base64"%>
<%@ include file='Conexion.jsp' %>


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
<div class="wrapper">

  <header class="main-header">
  <nav class="navbar navbar-static-top">
  <div class="container">

        <div class="navbar-header">
          <a href="index.jsp" class="navbar-brand"> <p style="border-style: solid; border-width:2px;"><b>El</b>Merca</p></a>
        </div>

        <!-- Menu Principal -->
        <div class="collapse navbar-collapse pull-left" id="navbar-collapse">
          <ul class="nav navbar-nav">
             <li class="dropdown">
             <a href="#" class="dropdown-toggle" data-toggle="dropdown">Categorias<span class="caret"></span></a>
             <ul class="dropdown-menu" role="menu">
                <%
                    ResultSet Temp;
                    Temp=Conex.verCategorias();
                    while(Temp.next())
                    {
                       out.println("<li><a href='Categoria.jsp?ID="+Temp.getString("Categoria_ID")+"'>"+Temp.getString("Categoria_Nombre")+"</a></li>");
                    }
                     
                %>
             </ul>
             </li>
          </ul>
         <!-- Buscador -->
          <form class="navbar-form navbar-left" role="search">
            <!--Buscar input-->
            <div class="form-group">
            <input type="text" class="form-control" id="navbar-search-input" placeholder="Search" >
            </div>
            <!--Buscar boton-->
            <div class="form-group">
            <button onclick="Buscar()" type="button" class="btn btn-default"><i class="glyphicon glyphicon-search"></i></button>
            </div>
          </form>

         </div>

         <div class='navbar-custom-menu'>
         <ul class='nav navbar-nav'>
         <li class="dropdown messages-menu open">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
              <i class="glyphicon">&#xe116;</i>
            </a>
            <ul class="dropdown-menu">
              <li class="header">Carrito de compras</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                                  <%
                    Temp=Conex.VerCarrito((String)session.getAttribute("ID"));
                    while(Temp.next())
                    {
                       out.println("<li>"
                                  +"<a href='Articulo.jsp?ID="+Temp.getString("Articulo_ID")+"'>"
                                  +" <div class='pull-left'>"
                                  +"<img src='data:image/jpeg;base64,"+Conex.Imagen(Temp.getBlob("Articulo_Imagen_1"))+"'  alt='User Image'>"
                                  +"</div>"
                                  +"<h4>"+Temp.getString("Articulo_ID")+"<small><i class='fa fa-clock-o'></i>$ "+Temp.getString("Articulo_Precio")+"</small></h4>"
                                  +"<p>Borrar</p>"
                                  +"</a>"
                                  +"</li>");
                    }
              %>

                  <!-- end message -->
                </ul>
              </li>
              <li class="footer"><a href="Pagar.jsp">Pagar</a></li>
            </ul>
          </li>
        </ul>
      </div>
         
         <%
         if(session.getAttribute("ID") != null)
          {

          out.println("<div class='navbar-custom-menu'>"+
                      "<ul class='nav navbar-nav'>"+
                      "<li class='user user-menu'>"+
                      "<a href='Perfil.jsp'>"+
                      "<img src='data:image/jpeg;base64,"+ Conex.Imagen((Blob)session.getAttribute("Perfil"))+
                      "' class='user-image' alt='User Image'>"+
                      "<span class='hidden-xs'>"+session.getAttribute("Mote")+"</span>"+
                      "</a>"+
                      "</li>"+
                      "</ul>"+
                      "</div>");
          }
          else
          {
            out.println("<div class='navbar-custom-menu'>"+
                         "<ul class='nav navbar-nav'>"+
                         "<li class='user user-menu'>"+
                         "<a href='Login.jsp' >" +
                         "<span class='hidden-xs'>Login</span>"+
                         "</a>"+
                         "</li>"+
                         "</ul>"+
                         "</div>");
            out.println("<div class='navbar-custom-menu'>"+
                         "<ul class='nav navbar-nav'>"+
                         "<li class='user user-menu'>"+
                         "<a href='Registro.jsp' >" +
                         "<span class='hidden-xs'>Registro</span>"+
                         "</a>"+
                         "</li>"+
                         "</ul>"+
                         "</div>");                         
          }
         %>
  </div>
  </nav>
  </header>

  <div class="content-wrapper">
    <!-- Contenido de la pagina-->
      <section class="content" id="Contenido">
         <ul class="timeline">
          
          <!-- Lista de con mas visitas -->
            <li>
              <i class="fa fa-camera bg-purple"></i>
              <div class="timeline-item">
                <h3 class="timeline-header"> <strong>Lo mas visto</strong> </h3>
                  <div class="timeline-body">
                  <div class="row">
                 <%
                   Temp=Conex.Vermasvistos();
                      while(Temp.next())
                            {
                            out.println("<div class='column'>"
                                       +"<div class='card'>"
                                       +"<img src='data:image/jpeg;base64,"+Conex.Imagen(Temp.getBlob("Articulo_Imagen_1"))+"' alt='...' class='margin' style='width:150px;height:100px;'>"
                                       +"<div class='container'>"
                                       +"<a href='Articulo.jsp?ID="+Temp.getString("Articulo_ID") +"'><h3>"+Temp.getString("Articulo_Nombre") +"</h3></a>"
                                       +"</div>"
                                       +"</div>"
                                       +"</div>");
                            }
                 %>

               </div>
               </div>
              </div>
            </li>

           <!-- Lista de con mas Busquedas -->
            <li>
              <i class="fa fa-camera bg-purple"></i>
              <div class="timeline-item">
                <h3 class="timeline-header"> <strong> Lo mas buscado</strong> </h3>
                  <div class="timeline-body">
                  <div class="row">



               </div>
               </div>
              </div>
            </li>

          </ul>
      </section>
  </div>

  <footer class="main-footer">
    <div class="container">
    </div>
  </footer>
</div>

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




