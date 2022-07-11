<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="Clases.Socios"%>
<%@ page import="Clases.SociosDAO"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Socios</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
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
	
</style>
</head>
<body>
	<div class="container border rounded-3 mt-5">
		<h1 class="text-center display-4 mt-3 mb-3">Listado de socios</h1>
		
		<div class="container table-responsive-lg">
			<table class="table table-hover algin-middle">
				<thead class="bg-primary text-white">
					<tr>
						<th scope="col">Nombre</th>
						<th scope="col">Apellido</th>
						<th scope="col">DNI</th>
						<th scope="col">Mail</th>
						<th scope="col">Fecha Alta</th>
						<th scope="col" class="text-center">Estado</th>
						<th scope="col" class="text-center">Modificar</th>
						<th scope="col" class="text-center">Eliminar</th>
					</tr>
				</thead>
				<tbody class="table-primary">
				
					<%
				
					List<Socios> resultado = null;
					SociosDAO socio = new SociosDAO();
					resultado = socio.listarSocios();
					
	
					
					for(int i=0;i<resultado.size();i++) {
						String ruta="SociosController?accion=modificar&id="+resultado.get(i).getId();	
					%>			
					<tr>				
						<td class="fname"><%=resultado.get(i).getNombre() %></td>				
						<td class="lname"><%=resultado.get(i).getApellido() %></td>
						<td><%=resultado.get(i).getDni()%></td>
						<td><%=resultado.get(i).getEmail() %></td>
						<td ><%=resultado.get(i).getAlta() %></td>
						<td class="text-center"><%=resultado.get(i).getEstado() ? "<i class=\"fa-solid fa-circle-check text-success\"></i>" : "<i class=\"fa-solid fa-circle-xmark text-danger\"></i>"%></td>
						<td class="text-center"><a href=<%=ruta%>><i class="fa-solid fa-gears text-secondary"></i></a></td>
						<td class="text-center"><a href="#" data-toggle="modal" data-target="#modal_eliminar" data-privateid="<%=resultado.get(i).getId() %>"><i class="fa-solid fa-trash text-secondary"></i></a></td>
					</tr>
					
					<%
						}
					%>
				</tbody>
			</table>
		</div>
		<div class="container">
			<div class="row justify-content-center">
				<a class="btn btn-primary col-4 mb-3" href="SociosController?accion=nuevo">Agregar socio</a>
			</div>
			
			<div class="modal fade" id="modal_eliminar" role="dialog">
				<div class="modal-dialog" role="document">
				    <div class="modal-content">
				      	<div class="modal-header">
				        	<h5 class="modal-title">Atención</h5>
			       			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          			<span aria-hidden="true">&times;</span>
			        		</button>
				      	</div>
				      	<div class="modal-body">
				        	<p>Este procedimiento no puede deshacerse. Elimiar al socio: <span class="fw-bold"><span id="fname-placeholder"></span> <span id="lname-placeholder"></span></span></p>
				      	</div>
				      	<div class="modal-footer">
				        	<button class="btn btn-primary" data-dismiss="modal" data-href="" id="accept">Si</button>
				        	<button class="btn btn-danger" data-dismiss="modal" data-href="" id="cancel">No</button>
				      	</div>
				    </div>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	$("#modal_eliminar").on('show.bs.modal', function(e) {
		var trigger = $(e.relatedTarget);
		var uid = trigger.data('privateid');
		var parent = trigger.parents('tr');
		var fname = parent.find('.fname').text();
		var lname = parent.find('.lname').text();
		var modal = $(this);
		modal.find('div.modal-body span span#fname-placeholder').text(fname);
		modal.find('div.modal-body span span#lname-placeholder').text(lname);
		modal.find('div.modal-footer button#accept').on('click',{href:"SociosController?accion=eliminar&id="+uid}, function(e) {
			window.location.href = e.data.href;
		});
	});
</script>
</html>