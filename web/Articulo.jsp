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
                       out.println("<li><a href='Categoria.php?ID="+Temp.getString("Categoria_ID")+"'>"+Temp.getString("Categoria_Nombre")+"</a></li>");
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
                  <li><!-- start message -->
                    <a href="#">
                      <div class="pull-left">
                        <img src="dist/img/photo1.png"  alt="User Image">
                      </div>
                      <h4>
                        Producto
                        <small><i class="fa fa-clock-o"></i> Precio</small>
                      </h4>
                      <p>Descripcion</p>
                    </a>
                  </li>
                  <!-- end message -->
                </ul>
              </li>
              <li class="footer"><a href="Pagar.php">Pagar</a></li>
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
            <section class="content" id="Contenido">
            <% 
             Temp=Conex.Valoracion(request.getParameter("ID"));
             int Valoracion=0;
             while(Temp.next())
             {
             Valoracion=Temp.getInt(1);
             }
             
             Temp=Conex.BuscarProducto(request.getParameter("ID"));
             while(Temp.next())
             {
            %>
            <div class="row">
            <div class="col-md-3">

          <!-- Profile Image -->
            <div class="box box-primary">
            <div class="box-body box-profile">

            <h3 class="profile-username text-center"><% out.println(Temp.getString("Articulo_Nombre")); %></h3>
            <p class="text-muted text-center"><%  out.println("<a href='Perfil.php?ID=$Row[Articulo_Usuario]'>"+"Perfil del vendedor"+"</a>"); %></p>
            
            <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>Precio</b> <a class="pull-right"><% out.println(Temp.getString("Articulo_Precio")); %></a>
                </li>
                <li class="list-group-item">
                  <b>Stock</b> <a class="pull-right"><% out.println(Temp.getString("Articulo_Unidades")); %></a>
                </li>
                
                <li class="list-group-item">
                  <b>Calificacion</b> <a class="pull-right">
                   <%
                   if (Valoracion==1) 
                       out.println( "&#9733;");
                   if (Valoracion==2) 
                       out.println( "&#9733; &#9733;");
                   if (Valoracion==3) 
                       out.println("&#9733; &#9733; &#9733;");
                   if (Valoracion==4) 
                       out.println("&#9733; &#9733; &#9733; &#9733; ");
                   if (Valoracion==5) 
                       out.println("&#9733; &#9733; &#9733; &#9733; &#9733;");
                   %>
                     
                   </a>

                </li>
                
                  <li class="list-group-item">
                  <form method="post" action="scrips/Califica.jsp">
                    <input  name="IDP" type="hidden" value='<% out.println(request.getParameter("ID")); %>' >
                    <input  name="IDU" type="hidden"  value='<% out.println(session.getAttribute("ID")); %>'>
                    <input type="submit" name="" value="Dar Calificacion" class="btn btn-primary ">
                    <select class="pull-right" name="Calificacion">
                    <option value="1"> &#9733;</option>
                    <option value="2"> &#9733; &#9733;</option>  
                    <option value="3"> &#9733; &#9733; &#9733;</option>  
                    <option value="4"> &#9733; &#9733; &#9733; &#9733;</option>  
                    <option value="5"> &#9733; &#9733; &#9733; &#9733; &#9733;</option>  
                    </select> 
                  </form>
                </li> 
              </ul>
              <form method="post" action="scrips/Agrega.jsp">
                    <input  name="IDP" type="hidden" <% out.println("value='"+request.getParameter("ID")+"'"); %> >
                    <input  name="IDU" type="hidden" <% out.println("value='"+session.getAttribute("ID")+"'"); %> >
                    <input type="submit" name="" value="Agregar al carrito" class="btn btn-primary btn-block">
              </form>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#activity" data-toggle="tab" aria-expanded="true">Informacion</a></li>
              <li class=""><a href="#timeline" data-toggle="tab" aria-expanded="false">Comentarios</a></li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="activity">
                  <div class="post">
                    <!-- /.user-block -->
                    <div class="row margin-bottom">
                      <div class="col-sm-6">
                        <video width="500" controls>
                          <source src= <% out.println(Temp.getString("Articulo_Video")); %> type="video/mp4">
                        </video>                      
                      </div>
                        
                      <!-- /.col -->
                      <div class="col-sm-6">
                        <div class="row">
                          <div class="col-sm-6">
                              <img class="img-responsive" <% out.println("src='data:image/jpeg;base64,"+Conex.Imagen(Temp.getBlob("Articulo_Imagen_1"))+"'"); %>  alt="Photo">
                            <br>
                              <img class="img-responsive" <% out.println("src='data:image/jpeg;base64,"+Conex.Imagen(Temp.getBlob("Articulo_Imagen_2"))+"'"); %>  alt="Photo">
                          </div>
                          <!-- /.col -->
                          <div class="col-sm-6">
                              <img class="img-responsive" <% out.println("src='data:image/jpeg;base64,"+Conex.Imagen(Temp.getBlob("Articulo_Imagen_3"))+"'"); %>  alt="Photo">
                            <br>
                              <img class="img-responsive" <% out.println("src='data:image/jpeg;base64,"+Conex.Imagen(Temp.getBlob("Articulo_Imagen_1"))+"'"); %>  alt="Photo">
                          </div>
                          <!-- /.col -->
                        </div>
                        <!-- /.row -->
                      </div>
                      <!-- /.col -->
                    </div>
                    <h3 class="profile-username text-center">Descripcion</h3>
                    <p><% out.println(Temp.getString("Articulo_Descripcion"));}%></p>
                    <!-- /.row -->
                  </div>

              </div>
                <div class="tab-pane" id="timeline">
                <div class="tab-pane active" id="activity">
                <div class="post">
                  <%
                   Temp=Conex.VerComentarios(request.getParameter("ID"));
                   while(Temp.next())
                   {
                    out.println("<div class='user-block'>"
                               +"<img class='img-circle img-bordered-sm' src='data:image/jpeg;base64,"+Conex.Imagen(Temp.getBlob("Usuario_Perfil"))+"' alt='user image'>"
                               +"<span class='username'>"
                               +"<a href='Perfil.php?ID="+Temp.getString("Usuario_ID")+"'>"+Temp.getString("Usuario_Mote")+"</a>"
                               +"<a href='#' class='pull-right btn-box-tool'><i class='fa fa-times'></i></a>"
                               +"</span>"
                               +"<span class='description'>Shared publicly -"+Temp.getString("Comenta_Fecha")+"</span>"
                               +"</div>"
                               +"<!-- /.user-block -->"
                               +"<p>"+Temp.getString("Comenta_Contenido")+"</p>"); 
                   }
                  %>  
                  
                      <form method="post" action="scrips/Comenta.jsp">
                      <input  name="ID" type="hidden" <% out.println("value='"+request.getParameter("ID")+"'"); %> >
                      <input class="form-control input-sm" type="text" placeholder="Type a comment" name='Contenido'>
                      <button type="submit" class="btn btn-primary btn-block btn-flat">enviar</button>
                    </form>
                  </div>
                </div>
              </div>
              <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div>
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




