<%@page import="java.sql.*, java.net.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%  
      Connection conn = null;
      ResultSet result = null;
      Statement stmt = null;

      try {
        /*parametros para la conexion*/
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://us-cdbr-iron-east-01.cleardb.net/heroku_38a1979085a7b59";
        String usuario = "becdff0c984df4";
        String clave = "51e4aab00b5ef5b";
        Class.forName("com.mysql.jdbc.Driver");

        conn = DriverManager.getConnection(url,usuario,clave);


        stmt = conn.createStatement();
        result = stmt.executeQuery("CALL VerCategorias();");


      }
      catch (Exception e) {
         System.out.println("Error " + e);
      }
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
          <a href="Index.php" class="navbar-brand"> <p style="border-style: solid; border-width:2px;"><b>El</b>Merca</p></a>
        </div>

        <!-- Menu Principal -->
        <div class="collapse navbar-collapse pull-left" id="navbar-collapse">
          <ul class="nav navbar-nav">
             <li class="dropdown">
             <a href="#" class="dropdown-toggle" data-toggle="dropdown">Categorias<span class="caret"></span></a>
             <ul class="dropdown-menu" role="menu">
                <%
        while(result.next()) {
           out.println("<li> <a href='Categoria.jsp?ID="+result.getString("Categoria_Nombre")+"'></a>"+result.getString("Categoria_Nombre")+"</li>");
        }
 
        result.close();
        stmt.close();
        conn.close();
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
         
         <div class='navbar-custom-menu'>
                    <ul class='nav navbar-nav'>
                    <li class='user user-menu'>
                    <a href='Login.php' > 
                    <span class='hidden-xs'>Login</span>
                    </a>
                    </li>
                    </ul>
              </div>
         <!-- Usuario -->
              <div class='navbar-custom-menu'>
                    <ul class='nav navbar-nav'>
                    <li class='user user-menu'>
                    <a href='Registro.php' > 
                    <span class='hidden-xs'>Registro</span>
                    </a>
                    </li>
                    </ul>
              </div>

  </div>
  </nav>
  </header>

  <div class="content-wrapper">
    <!-- Contenido de la pagina-->
      <section class="content" id="Contenido">
         <ul class="timeline">
          
            <!-- Promociones -->
            <li>
              <i class="fa fa-fw bg-purple"></i>
              <div class="timeline-item">
                <h3 class="timeline-header"><strong> Promociones</strong></h3>
                  <div class="timeline-body">
                  <div class="row">

                    <div class="column">
                    <div class="card">
                    <img src="http://placehold.it/150x100" alt="..." class="margin">
                    <div class="container">
                    <a href="Articulo.php"><h3>Producto</h3></a>
                    </div>
                   </div>
                   </div>

               </div>
               </div>
              </div>
            </li>

          <!-- Lista de con mas visitas -->
            <li>
              <i class="fa fa-camera bg-purple"></i>
              <div class="timeline-item">
                <h3 class="timeline-header"> <strong>Lo mas visto</strong> </h3>
                  <div class="timeline-body">
                  <div class="row">

                    <div class="column">
                    <div class="card">
                    <img src="http://placehold.it/150x100" alt="..." class="margin">
                    <div class="container">
                    <h3>Producto</h3>
                    </div>
                   </div>
                   </div>

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

                    <div class="column">
                    <div class="card">
                    <img src="http://placehold.it/150x100" alt="..." class="margin">
                    <div class="container">
                    <h3>Producto</h3>
                    </div>
                   </div>
                   </div>

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