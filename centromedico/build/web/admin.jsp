<%
String codigo = (String)session.getAttribute("codigo"); // recoge valor de la session
if (codigo==null){
    response.sendRedirect("index.jsp");
}
String nombre = (String)session.getAttribute("nombre");
String apellido = (String)session.getAttribute("apellido");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Centro M&eacute;dico</title>
<link rel="stylesheet" type="text/css" href="css/admin.css"/>
<script type="text/javascript" src="jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="funciones.js"></script>

<script src="date/date.js" type="text/javascript"></script>
<script src="date/jquery.bgiframe.min.js" type="text/javascript"></script>
<script src="date/jquery.datePicker.js" type="text/javascript"></script>
<link href="date/datePicker.css" media="all"  rel="stylesheet" type="text/css"/>
<link href="date/demo.css" media="all" rel="stylesheet" type="text/css"/>

</head>
<body>
<div id="general">
  <div id="campus">
    <div id="cabeceracampus"><div id="logo"></div><div id="datosp"><br /><br /><b>BIENVENIDO:</b> <%=nombre%><br /><b>APELLIDO:</b> <%=apellido%><br /><a href="cerrar.php" id="opcabecera">CERRAR SESI&Oacute;N</a></div></div>
    <div id="menucampus"></div>
    <div id="cuerpocampus">
        <div id="menu2campus"></div><script>menu();</script>
      <div id="contenidocampus">
      <table id="tablecont"><tr><td><div id="contenidotable"></div></td></tr></table>
      </div>
    </div>
  </div>
  <div id="publicidad"></div>
</div>
<div id="abajo"><br />2010 Todos los derechos reservados</div>
</body>
</html>
