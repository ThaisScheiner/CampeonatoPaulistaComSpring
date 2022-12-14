<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
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
		<h1> Proje??o Quartas de Final</h1><br>
		
		<div class="btn-group">
			<form action="quartas" method="post">
				<input type="submit" name="enviar" id="inviar" value="Mostrar">
			</form>
		</div>
	</center>

	<br>
	<br>


	<div class="container-fluid mx-auto" >
		<div class="row">

			<div class="col-md-9 mx-auto">
				<table class="table table-bordered table-striped">
					<thead>
						<tr align="center">
							<th>Time A</th>
							<th>Time B</th>
						</tr>
					</thead>
					<tbody>
					
						<tr class="table-active" align="center">
							<c:forEach var="time" items="${quartasA}">
								<td>${time.getNomeTime()}</td>
							</c:forEach>
						</tr>
						
						
						<tr class="table-active" align="center">
							<c:forEach var="time" items="${quartasB}">
								<td>${time.getNomeTime()}</td>
							</c:forEach>
						</tr>
						
						
						<tr class="table-active" align="center">
							<c:forEach var="time" items="${quartasC}">
								<td>${time.getNomeTime()}</td>
							</c:forEach>
						</tr>
						
						
						<tr class="table-active" align="center">
							<c:forEach var="time" items="${quartasD}">
								<td>${time.getNomeTime()}</td>
							</c:forEach>
						</tr>
						
					</tbody>
				</table>
			</div>

		</div>
	</div>
	
</body>
</html>