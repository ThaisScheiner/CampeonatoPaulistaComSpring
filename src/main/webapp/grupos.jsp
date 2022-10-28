<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css"
	rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Campeonato Paulista</title>
</head>
<body>

	<div>
		<jsp:include page="menu.jsp" />
	</div>
	<br />
	<br />

	<center>
		<h1>Tabelas dos Grupos</h1>
		<form action="MostraGrupos" method="post">
			<input type="submit" name="enviar" id="enviar" value="Mostrar os grupos">
		</form>
	</center>

	<br>
	<br>


	<div class="container-fluid">
		<div class="row">

			<div class="col-md-3">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Grupo A</th>

						</tr>
					</thead>
					<tbody>

						<c:forEach var="Grupo" items="${Grupo_A}">
							<tr class="table-active">
								<td>${Grupo.getCodigoTime()}</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>

			<div class="col-md-3">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Grupo B</th>

						</tr>
					</thead>
					<tbody>

						<c:forEach var="Grupo" items="${Grupo_B}">
							<tr class="table-active">
								<td>${Grupo.getCodigoTime()}</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>

			<div class="col-md-3">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Grupo C</th>

						</tr>
					</thead>
					<tbody>

						<c:forEach var="Grupo" items="${Grupo_C}">
							<tr class="table-active">
								<td>${Grupo.getCodigoTime()}</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>

			<div class="col-md-3">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Grupo D</th>

						</tr>
					</thead>
					<tbody>

						<c:forEach var="Grupo" items="${Grupo_D}">
							<tr class="table-active">
								<td>${Grupo.getCodigoTime()}</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>
</body>
</html>