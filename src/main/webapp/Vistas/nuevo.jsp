<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Agregar usuario</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
	<div class="mt-5 container p-0 border rounded-3">

		<div class="container mt-3 mb-5">
			<h1 class="display-4 text-center">Agregar usuario</h1>
		</div>
		
	
		<div class="container mb-3">
			<form action="SociosController?accion=insertar" method="post">
				<div class="row justify-content-center">
					<div class="col-lg-5 col-6">
						<div class="mb-3">
							<label for="nom" class="form-label">Nombre</label>
							<input type="text" class="form-control" id="nombre" name="nombre">
						</div>
					</div>
					<div class="col-lg-5 col-6">
						<div class="mb-3">
							<label for="ape" class="form-label">Apellido</label>
							<input type="text" class="form-control" id="apellido" name="apellido">
						</div>	
					</div>
				</div>
				<div class="row justify-content-center">
					<div class="col-lg-4 col-5">
						<div class="mb-3">
							<label for="mail" class="form-label">Email</label>
							<input type="text" class="form-control" id="email" name="email">
						</div>
					</div>
					<div class="col-3">
						<div class="mb-3">
							<label for="dni" class="form-label">DNI</label>
							<input type="number" min="0" max="99999999" maxlength="8" size="8" class="form-control" id="dni" name="dni">
						</div>
					</div>
					<div class="col-lg-3 col-4">
						<div class="mb-3">
							<label for="alta" class="form-label">Fecha Alta</label>
							<input type="date" class="form-control" id="alta" name="alta">
						</div>
					</div>
				</div>
				<div class="row justify-content-center">
					<div class="col-3">
						<button class="btn btn-primary w-100" type="submit">Cargar</button>
					</div>
				</div>
				
			</form>
	
		</div>
	</div>

</body>
</html>