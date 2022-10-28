<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Rodadas</title>
</head>
<body>
	<div>
		<jsp:include page="menu.jsp" />
	</div>

	<br />
	<br />
	<center>
		<form action="rodada" method="post">
			<input type="submit" name="enviar" id="enviar" value="Rodadas">
		</form>

		<br>
		<br>

		<c:out value="${mensagem}">
		</c:out>


		<div class="col-md-12">
			<table class="table table-bordered">
				<thead>
					<tr align="center">
						<th>ID</th>
						<th>Time A</th>

						<th>x</th>
						<br />
						<th>Time B</th>
						<br />
						<th>Rodada</th>
						<br />
						<th>Data</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${jogos }"  var="jogosLista" >
						<tr align="center" class="table-active">
							<td><c:out value="${jogosLista.id }" /></td>
							<td><c:out value="${jogosLista.timeA }" /></td>
							

							<td>x</td>

							<td><c:out value="${jogosLista.timeb } " /></td>
							

							<td><c:out value="${jogosLista.rodada }" /></td>
							<td><c:out value="${jogosLista.dataRod }" /></td>
						</tr>

					</c:forEach>


				</tbody>
			</table>

		</div>

		<center>
</body>
</html>