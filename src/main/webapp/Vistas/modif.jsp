<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="Clases.SociosDAO"  %>
<%@page import="Clases.Socios"%>
<%@page import="java.util.List"%>  


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modificar Socio</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<style>
	html {
		/*background: rgb(0,1,25);
		background: linear-gradient(135deg, rgba(0,1,25,1) 0%, rgba(9,12,121,1) 35%, rgba(0,164,255,1) 100%);*/
		background: rgb(253,29,29);
		background: linear-gradient(135deg, rgba(253,29,29,1) 0%, rgba(255,169,21,1) 62%, rgba(255,215,35,1) 100%);
		background-repeat: no-repeat;
		background-size: cover;
		background-attached: fixed;
		height: 100%;
		overflow: hidden;
	}
	body {
		background-color: transparent !important;
	}
	body div.container {
		background-color: white;
	}
	.form-switch.form-switch-md {
	  	margin-bottom: 1rem;
	}
	
	.form-switch.form-switch-md .form-check-input {
		height: 1.5rem;
	 	width: calc(2rem + 0.75rem);
	 	border-radius: 3rem;
	}
	
</style>
</head>
<body>
	<div class="container border rounded-3 mt-5">
		<h1 class="text-center display-4" >Modificar Socio</h1>

		<form class="p-3" action="SociosController?accion=actualizar" method="post">
				
				<%
				String id=request.getParameter("id");
				int mid;
				mid=Integer.parseInt(id);				
				Socios resultado=null;
				SociosDAO  socio=new SociosDAO();
				resultado=socio.mostrarSocio(mid);				
				%>
			
			<input type="number" class="hidden" id="id_socio" name="id_socio" hidden="true" readonly value="<%=resultado.getId() %>">
			
			<div class="row justify-content-center">
				<div class="col-lg-5 col-6">
					<div class="mb-3">
						<label for="nom" class="form-label">Nombre</label>
						<input type="text" class="form-control" id="nombre" name="nombre" value="<%=resultado.getNombre()%>" >
					</div>
				</div>
				<div class="col-lg-5 col-6">
					<div class="mb-3">
						<label for="ape" class="form-label">Apellido</label>
						<input type="text" class="form-control" id="apellido" name="apellido" value="<%=resultado.getApellido()%>" >
					</div>
				</div>
			</div>
			
			<div class="row justify-content-center">
				<div class="col-lg-4 col-6">
					<div class="mb-3">
						<label for="mail" class="form-label">Email</label>
						<input type="text" class="form-control" id="email" name="email" value="<%=resultado.getEmail()%>">
					</div>
				</div>
				<div class="col-3">
					<div class="mb-3">
						<label for="dni" class="form-label">DNI</label>
						<input type="number" max="99999999" size="8" class="form-control" id="dni" name="dni" value="<%=resultado.getDni()%>" >
					</div>
				</div>
				<div class="col-lg-3 col-3">
					<div class="mb-3">
						<label for="alta" class="form-label">Fecha Alta</label>
						<input type="date" class="form-control" id="alta" name="alta" value="<%=resultado.getAlta()%>" >
					</div>
				</div>
			</div>
			
			<div class="row justify-content-center">
				<div class="col-6 col-lg-6 ">
					<div class="mb-3">
						<div class="form-check form-switch form-switch-md">
							<input class="form-check-input mt-0" type="checkbox" role="switch" value="1" id="estado" name="estado" <%=resultado.getEstado() ? "checked" : "" %>>
							<label class="form-check-label ms-2" for="estado">Estado</label>						
						</div>
					</div>
				</div>
				<div class="col-3 col-lg-2"></div>
				<div class="col-3 col-lg-2">
					<button type="submit" class="btn btn-primary w-100">Aceptar</button>
				</div>
			</div>
		</form>
	</div>	
</body>
</html>