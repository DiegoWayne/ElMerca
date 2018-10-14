function Buscar() 
{
    var str=document.getElementById('navbar-search-input').value;

    if (str == "")  
        return;
    
    else 
    {
        if (window.XMLHttpRequest) 
            xmlhttp = new XMLHttpRequest();// code for IE7+, Firefox, Chrome, Opera, Safari
        else 
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");// code for IE6, IE5

        xmlhttp.onreadystatechange = function() 
        {
            if (this.readyState == 4 && this.status == 200)
                document.getElementById("Contenido").innerHTML = this.responseText;
        };
        xmlhttp.open("GET","scrips/Buscar.php?q="+str,true);
        xmlhttp.send();
    }
}