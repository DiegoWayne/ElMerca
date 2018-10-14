//Funcion para cambiar la imagen 1
$(window).load(function()
{
 $(function() 
 {
  $('#Imagen_1').change(function(e){addImage(e);});

     function addImage(e)
     {
      var file = e.target.files[0],
      imageType = /image.*/;
    
      if (!file.type.match(imageType))
       return;
  
      var reader = new FileReader();
      reader.onload = fileOnload;
      reader.readAsDataURL(file);
     }
  
     function fileOnload(e) 
     {
      var result=e.target.result;
      $('#Img_1').attr("src",result);
     }
    });
  });

//Funcion para cambiar la imagen 2
$(window).load(function()
{
 $(function() 
 {
  $('#Imagen_2').change(function(e){addImage(e);});

     function addImage(e)
     {
      var file = e.target.files[0],
      imageType = /image.*/;
    
      if (!file.type.match(imageType))
       return;
  
      var reader = new FileReader();
      reader.onload = fileOnload;
      reader.readAsDataURL(file);
     }
  
     function fileOnload(e) 
     {
      var result=e.target.result;
      $('#Img_2').attr("src",result);
     }
    });
  });

//Funcion para cambiar la imagen 3
$(window).load(function()
{
 $(function() 
 {
  $('#Imagen_3').change(function(e){addImage(e);});

     function addImage(e)
     {
      var file = e.target.files[0],
      imageType = /image.*/;
    
      if (!file.type.match(imageType))
       return;
  
      var reader = new FileReader();
      reader.onload = fileOnload;
      reader.readAsDataURL(file);
     }
  
     function fileOnload(e) 
     {
      var result=e.target.result;
      $('#Img_3').attr("src",result);
     }
    });
  });

$(window).load(function()
{
 $(function() 
 {
  $('#Video').change(function(e){addImage(e);});

     function addImage(e)
     {
      var file = e.target.files[0];
  
      var reader = new FileReader();
      reader.onload = fileOnload;
      reader.readAsDataURL(file);
     }
  
     function fileOnload(e) 
     {
      var result=e.target.result;
      document.getElementById("VideoPre").innerHTML = "<source src='"+result+"' type='video/mp4'>";
     }
    });
  });