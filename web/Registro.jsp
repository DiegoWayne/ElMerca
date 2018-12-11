<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>ElMerca</title>
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Muchos iconos -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Estilo Principal -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- Skins varias  -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
    <a href="Index.php" style="border-style: solid; border-width: 5px;"><b>El</b>Merca</a>
  </div>

  <div class="register-box-body">
    <p class="login-box-msg">Registro de nuevo usuario</p>

    <form action="Producto" method="post" enctype="multipart/form-data">
      <!-- Nombre Completo -->
      <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="Nombre Completo" name="Nombre" required="">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>

      <!-- Nickname -->
      <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="Nickname" name="Nickname" required="">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>

      <!-- Correo -->
      <div class="form-group has-feedback">
        <input type="email" class="form-control" placeholder="Email" name="Correo" required="">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>

      <!-- Contraseña -->
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="Password" name="Contrasena" required="">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>

      <!-- Repite Contraseña -->
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="Repite password" name="ReContrasena" required="">
        <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
      </div>

      <!-- Foto de Perfil -->
      <div class="form-group has-feedback">
        <span>Foto de Perfil</span>
        <input type="file" class="form-control" name="Perfil" required="" id="Imagen_1">
        <img id="Img_1" src="http://placehold.it/150x100" width="50%" height="50%">
      </div>

      <!-- Foto de Portada -->
      <div class="form-group has-feedback">
        <span>Foto de Portada</span>
        <input type="file" class="form-control" name="Portada" required="" id="Imagen_2">
        <img id="Img_2" src="http://placehold.it/150x100"  width="50%" height="50%">
      </div>

      <p class="login-box-msg">Datos de envio</p>

      <!-- Telefono -->
      <div class="form-group has-feedback">
        <input type="number" class="form-control" placeholder="Telefono" name="Telefono" required="">
        <span class="glyphicon glyphicon-phone-alt form-control-feedback"></span>
      </div>

      <!-- Calle -->
      <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="Calle" name="Calle" required="">
        <span class="glyphicon glyphicon-pencil form-control-feedback"></span>
      </div>

      <!-- Numero -->
      <div class="form-group has-feedback">
        <input type="number" class="form-control" placeholder="Numero" name="Numero" required="">
        <span class="glyphicon glyphicon-pencil form-control-feedback"></span>
      </div>

      <!-- Codigo Postal -->
      <div class="form-group has-feedback">
        <input type="number" class="form-control" placeholder="Codigo postal" name="Postal" required="">
        <span class="glyphicon glyphicon-pencil form-control-feedback"></span>
      </div>

      <!-- Estados -->
      <div class="form-group has-feedback">
        <select class="form-control" name="Estados" required="">
            <option value="Todo México">Estado</option>
            <option value="Aguascalientes">Aguascalientes</option>
            <option value="Baja California">Baja California</option>
            <option value="Baja California Sur">Baja California Sur</option>
            <option value="Campeche">Campeche</option>
            <option value="Coahuila de Zaragoza">Coahuila de Zaragoza</option>
            <option value="Colima">Colima</option>
            <option value="Chiapas">Chiapas</option>
            <option value="Chihuahua">Chihuahua</option>
            <option value="Distrito Federal">Distrito Federal</option>
            <option value="Durango">Durango</option>
            <option value="Guanajuato">Guanajuato</option>
            <option value="Guerrero">Guerrero</option>
            <option value="Hidalgo">Hidalgo</option>
            <option value="Jalisco">Jalisco</option>
            <option value="México">México</option>
            <option value="Michoacán de Ocampo">Michoacán de Ocampo</option>
            <option value="Morelos">Morelos</option>
            <option value="Nayarit">Nayarit</option>
            <option value="Nuevo León">Nuevo León</option>
            <option value="Oaxaca">Oaxaca</option>
            <option value="Puebla">Puebla</option>
            <option value="Querétaro">Querétaro</option>
            <option value="Quintana Roo">Quintana Roo</option>
            <option value="San Luis Potosí">San Luis Potosí</option>
            <option value="Sinaloa">Sinaloa</option>
            <option value="Sonora">Sonora</option>
            <option value="Tabasco">Tabasco</option>
            <option value="Tamaulipas">Tamaulipas</option>
            <option value="Tlaxcala">Tlaxcala</option>
            <option value="Veracruz de Ignacio de la Llave">Veracruz de Ignacio de la Llave</option>
            <option value="Yucatán">Yucatán</option>
            <option value="Zacatecas">Zacatecas</option>
        </select>
      </div>

      <!-- Boton -->
      <button type="submit" class="btn btn-primary btn-block btn-flat">Register</button>
    </form>

    <a href="Login.php" class="text-center">Ya tengo cuenta</a>
  </div>

</div>

<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="plugins/iCheck/icheck.min.js"></script>
<!--Scrip para previzualisar las imagenes-->
 <script src="js/CargarImagen.js"></script>

</body>
</html>
