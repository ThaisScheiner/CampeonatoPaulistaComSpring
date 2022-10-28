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
<title>Jogos</title>
</head>
<body>
	<div>
		<jsp:include page="menu.jsp" />
	</div>
	
	<br />
	<br />
	
	<center>
		<form action="Mostrajogos" method="post">
			<input type="date" name="data" id="data"> 
			<input type="submit" name="enviar" id="enviar" value="ver Jogos">
		</form>
		
		<br><br>
	
		<c:out value="${mensagem}"> </c:out>
	
		<div class="container-fluid">
			<div class="row">

				<div class="col-md-12">
					<table class="table table-bordered">
						<thead>
							<tr align="center">
								<th>Time A</th>
								<th>placar</th>
								<th> x </th>
								<th>placar</th>
								<th>Time B</th>
								<th>Rodada</th>
								
							</tr>
						</thead>
						<tbody>

						<form action="insereResultado" method="post">
						
						<c:set var ="contA" value="1" scope="page"> </c:set>
						<c:set var ="contB" value="9" scope="page"> </c:set>
						<c:set var ="contC" value="20" scope="page"> </c:set>
						
							<c:forEach var="jogoN" items="${jogo}">
								<tr align="center" class="table-active">
									<td>${jogoN.getTimeA()}</td>
									
									<input type ="hidden" name="${contC}" value="${jogoN.getId()}"/>
										
									<td><input type="number" name="${contA}" placeholder="0"></td>
																	
									<td> x </td>
									
									<td><input type="number" name="${contB}" placeholder="0"></td>
									
									<td>${jogoN.getTimeb()}</td>
									<td>${jogoN.getRodada()}</td>
									<td>${jogoN.getId()}</td>
								
	
								</tr>
								
							<c:set var="contA" value="${contA+1}" scope="page"/>
							<c:set var="contB" value="${contB+1}" scope="page"/>
							<c:set var="contC" value="${contC+1}" scope="page"/>							
							</c:forEach>
						
							<tr align="center"> 
								<td colspan="6"> <input type="submit" name="enviar" id="enviar" value="enviar"> </td>
							</tr>
						</form>

						</tbody>
					</table>
				</div>
			</div>
		</div>
		<center>
</body>
</html>


