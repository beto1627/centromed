function floro(nombre,mensaje){
    alert(nombre + " has pulsado el boton ingresar..." + mensaje);
}
function datos(){
    var usuario = document.getElementById("usuario").value;
}
/// jquery
function validar(){
    var usuario = $("#usuario").val();
    var clave = $("#clave").val();

    if(usuario.length>5){
        if(clave.length>5){
            var randomnumber=Math.random()*11;
            $.post("validar",{
                txtusuario:usuario,
                txtclave:clave,
                randomnumber:randomnumber
            },function(data){
                $("#mensaje").html(data);
            });
        }else{
            document.getElementById("mensaje").innerHTML="clave al menos 6 caracteres";
        }
    }else{
        document.getElementById("mensaje").innerHTML="usuario al menos 6 caracteres";
    }
}
function admin(){
    location.href="admin.jsp";
}
function menu(){
    var randomnumber=Math.random()*11;
    document.getElementById("menu2campus").innerHTML = "<img src='images/preload1.gif' width='16' height='16'> Espere un momento...";
    $.post("menu.jsp",{
        randomnumber:randomnumber
    },function(data){
        $("#menu2campus").html(data);
    });
}

function verurl(url){
    var randomnumber=Math.random()*11;
    document.getElementById("contenidotable").innerHTML = "<img src='images/preload1.gif' width='16' height='16'> Espere un momento...";
    $.post(url,{
        randomnumber:randomnumber
    },function(data){
        $("#contenidotable").html(data);
    });
}

function buscarpersona(){
    var randomnumber=Math.random()*11;
    document.getElementById("buscarpersona").innerHTML = "<img src='images/preload1.gif' width='16' height='16'> Espere un momento...";
    $.post("buscarpersona.jsp",{
        randomnumber:randomnumber
    },function(data){
        $("#buscarpersona").html(data);
    });
}

function searchpersona(){
    var randomnumber=Math.random()*11;
    var apellido=$("#txtapellido").val();
 
    if (apellido.length>4){
        document.getElementById("resultados").innerHTML = "<img src='images/preload1.gif' width='16' height='16'> Espere un momento...";
        $.post("searchpersona.jsp",{
            apellido:apellido,
            randomnumber:randomnumber
        },function(data){
            $("#resultados").html(data);
        });
    }
}

function nuevapersona(){
    var randomnumber=Math.random()*11;
 
    document.getElementById("buscarpersona").innerHTML = "<img src='images/preload1.gif' width='16' height='16'> Espere un momento...";
    $.post("nuevapersona.jsp",{
        randomnumber:randomnumber
    },function(data){
        $("#buscarpersona").html(data);
    });

}

function provincia(){
    var randomnumber=Math.random()*11;
    var depa=$("#cbodepa").val();
    document.getElementById("provincia").innerHTML = "<img src='images/preload1.gif' width='16' height='16'> Espere un momento...";
    $.post("provincia.jsp",{
        depa:depa,
        randomnumber:randomnumber
    },function(data){
        $("#provincia").html(data);
    });
}

function distritos(depa){
    var randomnumber=Math.random()*11;
    var cboprovincia=$("#cboprovincia").val();
    document.getElementById("distrito").innerHTML = "<img src='images/preload1.gif' width='16' height='16'> Espere un momento...";
    $.post("distritos.jsp",{
        cboprovincia:cboprovincia,
        depa:depa,
        randomnumber:randomnumber
    },function(data){
        $("#distrito").html(data);
    });
}

    function insertarper(){
    var randomnumber=Math.random()*11;
    var txtnombre=$("#txtnombre").val();
    var txtapellidos=$("#txtapellidos").val();
    var txtfecha=$("#txtfecha").val();
    var cbodepa=$("#txtnombre").val();
    var cboprovincia=$("#cboprovincia").val();
    var cbodistrito=$("#cbodistrito").val();
    var txtdireccion=$("#txtdireccion").val();
    var cbotipodoc=$("#cbotipodoc").val();
    var txtdocumento=$("#txtdocumento").val();
    var cbotipotel=$("#cbotipotel").val();
    var txttelefono=$("#txtelefono").val();
    var accion="INS";
    document.getElementById("buscarpersona").innerHTML = "<img src='images/preload1.gif' width='16' height='16'> Espere un momento...";
    $.post("insertaper.jsp",{
        txtnombre:txtnombre,
        cborpovincia:cboprovincia,
        txtapellidos:txtapellidos,
        txtfecha:txtfecha,
        cbodepa:cbodepa,
        cboprovincia:cboprovincia,
        cbodistrito:cbodistrito,
        txtdireccion:txtdireccion,
        cbotipodoc:cbotipodoc,
        txtdocumento:txtdocumento,
        cbotipotel:cbotipotel,
        txttelefono: txttelefono,
        accion:accion,
        randomnumber:randomnumber
    },function(data){
        $("#buscarpersona").html(data);
    });
}

function paginar(){
    var randomnumber=Math.random()*11;
   
    document.getElementById("buscarpersona").innerHTML = "<img src='images/preload1.gif' width='16' height='16'> Espere un momento...";
    $.post("listar.jsp",{        
        randomnumber:randomnumber
    },function(data){
        $("#buscarpersona").html(data);
    });
}
