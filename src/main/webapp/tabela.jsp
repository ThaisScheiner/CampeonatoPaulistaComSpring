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
<title>Tabela</title>
</head>
<body>

	<div>
		<jsp:include page="menu.jsp" />
	</div>

	<br />
	<br />

	<center>
		<h1>Classificação Por grupo</h1><br>
		
		<form action="ClassificacaoG" method="post">
			<input type="submit" name="enviar" id="inviar" value="Mostrar">
		</form>
			

	</center>

	<br>
	<br>


	<div class="container-fluid">
		<div>

			<div>	
				<table class="table table-bordered">
				<thead>
						<tr align="center">
							<th colspan="9"> Grupo A </th>
						<tr>					
						
						<tr>
							<th>time</th>
							<th>Jogo</th>
							<th>Vitorias</th>
							<th>Empate</th>
							<th>Derrotas</th>
							<th>Gols Marcados</th>
							<th>Gols Sofridos</th>
							<th>Saldo de Gols</th>
							<th>Pontos</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="Grupo" items="${GrupoA}">
						
							<c:set var ="cond" value="0" scope="page"> </c:set>
							
							<c:forEach var="rebaixado" items="${rebaixados}">							
								<c:if test="${Grupo.getNomeTime() == rebaixado.getNomeTime()}">
									<c:set var ="cond" value="2" scope="page"> </c:set>
									<tr style="background-color:#B22222" align="center">			
										<td>${Grupo.getNomeTime()}</td>
										<td>${Grupo.getJogos()}</td>
										<td>${Grupo.getVitorias()}</td>
										<td>${Grupo.getEmpates()}</td>
										<td>${Grupo.getDerrotas()}</td>
										<td>${Grupo.getGolsMarcados()}</td>
										<td>${Grupo.getGolsSofridos()}</td>
										<td>${Grupo.getSaldoGols()}</td>
										<td>${Grupo.getPonto()}</td>
									</tr>
								</c:if>
							</c:forEach>
							
							<c:if test="${cond == 0}">
								<tr class="table-active" align="center">
									<td>${Grupo.getNomeTime()}</td>
									<td>${Grupo.getJogos()}</td>
									<td>${Grupo.getVitorias()}</td>
									<td>${Grupo.getEmpates()}</td>
									<td>${Grupo.getDerrotas()}</td>
									<td>${Grupo.getGolsMarcados()}</td>
									<td>${Grupo.getGolsSofridos()}</td>
									<td>${Grupo.getSaldoGols()}</td>
									<td>${Grupo.getPonto()}</td>
								</tr>
							</c:if>

						</c:forEach>

					</tbody>
				</table>
			</div>
			<br><br>
			<div>	
				<table class="table table-bordered">
				<thead>
						<tr align="center">
							<th colspan="9"> Grupo B </th>
						<tr>					
						
						<tr>
							<th>time</th>
							<th>Jogo</th>
							<th>Vitorias</th>
							<th>Empate</th>
							<th>Derrotas</th>
							<th>Gols Marcados</th>
							<th>Gols Sofridos</th>
							<th>Saldo de Gols</th>
							<th>Pontos</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="Grupo" items="${GrupoB}">
						
							<c:set var ="cond" value="0" scope="page"> </c:set>
							
							<c:forEach var="rebaixado" items="${rebaixados}">							
								<c:if test="${Grupo.getNomeTime() == rebaixado.getNomeTime()}">
									<c:set var ="cond" value="2" scope="page"> </c:set>
									<tr style="background-color:#B22222" align="center">			
										<td>${Grupo.getNomeTime()}</td>
										<td>${Grupo.getJogos()}</td>
										<td>${Grupo.getVitorias()}</td>
										<td>${Grupo.getEmpates()}</td>
										<td>${Grupo.getDerrotas()}</td>
										<td>${Grupo.getGolsMarcados()}</td>
										<td>${Grupo.getGolsSofridos()}</td>
										<td>${Grupo.getSaldoGols()}</td>
										<td>${Grupo.getPonto()}</td>
									</tr>
								</c:if>
							</c:forEach>
							
							<c:if test="${cond == 0}">
								<tr class="table-active" align="center">
									<td>${Grupo.getNomeTime()}</td>
									<td>${Grupo.getJogos()}</td>
									<td>${Grupo.getVitorias()}</td>
									<td>${Grupo.getEmpates()}</td>
									<td>${Grupo.getDerrotas()}</td>
									<td>${Grupo.getGolsMarcados()}</td>
									<td>${Grupo.getGolsSofridos()}</td>
									<td>${Grupo.getSaldoGols()}</td>
									<td>${Grupo.getPonto()}</td>
								</tr>
							</c:if>

						</c:forEach>

					</tbody>
				</table>
			</div>
			
			<br><br>
			
			<div>	
				<table class="table table-bordered">
				<thead>
						<tr align="center">
							<th colspan="9"> Grupo C </th>
						<tr>					
						
						<tr>
							<th>time</th>
							<th>Jogo</th>
							<th>Vitorias</th>
							<th>Empate</th>
							<th>Derrotas</th>
							<th>Gols Marcados</th>
							<th>Gols Sofridos</th>
							<th>Saldo de Gols</th>
							<th>Pontos</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="Grupo" items="${GrupoC}">
						
							<c:set var ="cond" value="0" scope="page"> </c:set>
							
							<c:forEach var="rebaixado" items="${rebaixados}">							
								<c:if test="${Grupo.getNomeTime() == rebaixado.getNomeTime()}">
									<c:set var ="cond" value="2" scope="page"> </c:set>
									<tr style="background-color:#B22222" align="center">			
										<td>${Grupo.getNomeTime()}</td>
										<td>${Grupo.getJogos()}</td>
										<td>${Grupo.getVitorias()}</td>
										<td>${Grupo.getEmpates()}</td>
										<td>${Grupo.getDerrotas()}</td>
										<td>${Grupo.getGolsMarcados()}</td>
										<td>${Grupo.getGolsSofridos()}</td>
										<td>${Grupo.getSaldoGols()}</td>
										<td>${Grupo.getPonto()}</td>
									</tr>
								</c:if>
							</c:forEach>
							
							<c:if test="${cond == 0}">
								<tr class="table-active" align="center">
									<td>${Grupo.getNomeTime()}</td>
									<td>${Grupo.getJogos()}</td>
									<td>${Grupo.getVitorias()}</td>
									<td>${Grupo.getEmpates()}</td>
									<td>${Grupo.getDerrotas()}</td>
									<td>${Grupo.getGolsMarcados()}</td>
									<td>${Grupo.getGolsSofridos()}</td>
									<td>${Grupo.getSaldoGols()}</td>
									<td>${Grupo.getPonto()}</td>
								</tr>
							</c:if>

						</c:forEach>

					</tbody>
				</table>
			</div>

			<br><br>
			
						<div>	
				<table class="table table-bordered">
				<thead>
						<tr align="center">
							<th colspan="9"> Grupo D </th>
						<tr>					
						
						<tr>
							<th>time</th>
							<th>Jogo</th>
							<th>Vitorias</th>
							<th>Empate</th>
							<th>Derrotas</th>
							<th>Gols Marcados</th>
							<th>Gols Sofridos</th>
							<th>Saldo de Gols</th>
							<th>Pontos</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="Grupo" items="${GrupoD}">
						
							<c:set var ="cond" value="0" scope="page"> </c:set>
							
							<c:forEach var="rebaixado" items="${rebaixados}">							
								<c:if test="${Grupo.getNomeTime() == rebaixado.getNomeTime()}">
									<c:set var ="cond" value="2" scope="page"> </c:set>
									<tr style="background-color:#B22222" align="center">			
										<td>${Grupo.getNomeTime()}</td>
										<td>${Grupo.getJogos()}</td>
										<td>${Grupo.getVitorias()}</td>
										<td>${Grupo.getEmpates()}</td>
										<td>${Grupo.getDerrotas()}</td>
										<td>${Grupo.getGolsMarcados()}</td>
										<td>${Grupo.getGolsSofridos()}</td>
										<td>${Grupo.getSaldoGols()}</td>
										<td>${Grupo.getPonto()}</td>
									</tr>
								</c:if>
							</c:forEach>
							
							<c:if test="${cond == 0}">
								<tr class="table-active" align="center">
									<td>${Grupo.getNomeTime()}</td>
									<td>${Grupo.getJogos()}</td>
									<td>${Grupo.getVitorias()}</td>
									<td>${Grupo.getEmpates()}</td>
									<td>${Grupo.getDerrotas()}</td>
									<td>${Grupo.getGolsMarcados()}</td>
									<td>${Grupo.getGolsSofridos()}</td>
									<td>${Grupo.getSaldoGols()}</td>
									<td>${Grupo.getPonto()}</td>
								</tr>
							</c:if>

						</c:forEach>

					</tbody>
				</table>
			</div>
	</body>
</html>