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
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/iCheck/square/blue.css">

</head>
<body class="hold-transition login-page">
<div class="login-box">

  <!-- Logo -->
  <div class="login-logo">
    <a href="Index.php" style="border-style: solid; border-width: 5px;"><b>El</b>Merca</a>
  </div>

  <div class="login-box-body">
    <p class="login-box-msg">Iniciar sesion</p>

    <form action="scrips/LoginUsuario.jsp" method="post">
      <!-- Correo-->
      <div class="form-group has-feedback">
        <input type="email" class="form-control" placeholder="Email" name="Correo">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>

      <!-- Contraseña -->
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="Password" name="Contrasena">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>

      <!-- Recordar-->
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox"> Remember Me
            </label>
          </div>
        </div>

      <!-- Boton -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
        </div>

      </div>
    </form>
    <%= try {if(request.getParameter("Mensaje") !=  null)out.println("Usia");} %>
    <a href="Registro.jsp" class="text-center">Register a new membership</a>
  </div>

</div>

<script src="plugins/jQuery/jquery-3.1.1.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="plugins/iCheck/icheck.min.js"></script>

<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
</script>

</body>
</html>
