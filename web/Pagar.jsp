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

    <form>
    <!-- Contenido de la pagina-->
      <section class="content" id="Contenido">
        <section class="invoice">
              <!-- title row -->
              <div class="row">
                <div class="col-xs-12">
                  <h2 class="page-header">
                    <i class="fa fa-globe"></i> ElMerca, Inc.
                    <small class="pull-right">Date: 2/10/2018</small>
                  </h2>
                </div>
                <!-- /.col -->
              </div>
              <!-- info row -->
              <div class="row invoice-info">
                <div class="col-sm-4 invoice-col">
                  De
                  <address>
                    <strong>ElMerca, Inc.</strong><br>
                    #809 Tonala, La joya<br>
                    Guadalupe, NL CP 60160<br>
                    Telefono: (804) 123-5432<br>
                    Email: ElMerca@outlook.com
                  </address>
                </div>
                <!-- /.col -->
                <div class="col-sm-4 invoice-col">
                  Para
                  <address>
                    <strong>Nombre</strong>
                  </address>
                </div>
                <!-- /.col -->
                <div class="col-sm-4 invoice-col">
                  <b>ID del pedido:</b> 4F3S8J<br>
                  <b>Fecha:</b> 2/22/2014<br>
                  <b>Cuenta:</b> 968-34567
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->

              <!-- Table row -->
              <div class="row">
                <div class="col-xs-12 table-responsive">
                  <table class="table table-striped">
                    <thead>
                    <tr>
                      <th>Cantidad</th>
                      <th>Producto</th>
                      <th>Serial #</th>
                      <th>Descripcion</th>
                      <th>Subtotal</th>
                    </tr>
                    </thead>
                    <tbody>
                     <%
                    int total=0;
                    Temp=Conex.VerCarrito((String)session.getAttribute("ID"));
                    while(Temp.next())
                    {
                       out.println("<td>1</td>"
                                  +"<td>"+Temp.getString("Articulo_Nombre")+ "<a href='scrips/EliminarCarrito.jsp?IDU="+Temp.getString("Articulo_ID")+"&IDP="+session.getAttribute("ID")+"'>Eliminar</a></td>"
                                  +"<td>"+Temp.getString("Articulo_ID")+"</td>"
                                  +"<td>"+Temp.getString("Articulo_Descripcion")+"</td>"
                                  +"<td>"+Temp.getString("Articulo_Precio")+"</td>"
                                  +"</tr>");
                       total=total+Temp.getInt("Articulo_Precio");
                    }
                     %>

                    <tr>
                    
                    </tbody>
                  </table>
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->

              <div class="row">
                <!-- accepted payments column -->
                <div class="col-xs-6">
                  <p class="lead">Metodos de pago:</p>
                  <img src="dist/img/credit/visa.png" alt="Visa">
                  <img src="dist/img/credit/mastercard.png" alt="Mastercard">
                  <img src="dist/img/credit/american-express.png" alt="American Express">
                  <img src="dist/img/credit/paypal2.png" alt="Paypal">

                  <p class="text-muted well well-sm no-shadow" style="margin-top: 10px;">
                   ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                    proident, sunt in culpa qui officia deserunt mollit anim id est laborum..
                  </p>
                </div>
                <!-- /.col -->
                <div class="col-xs-6">
                  <div class="table-responsive">
                    <table class="table">
                      <tbody>
                      <tr>
                        <th>Iva (15%)</th>
                      </tr>
                      <tr>
                        <th>Total:</th>

                        <td>$ <%  out.println(total);%></td>
                      </tr>
                    </tbody></table>
                  </div>
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->
            <a href="scrips/Pagar.jsp" type="button" class="btn btn-success pull-right"><i class="fa fa-credit-card"></i> Pagar</a>
              <!-- this row will not appear when printing -->
            </section>
      </section>
    </form>
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





