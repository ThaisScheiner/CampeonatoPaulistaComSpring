package br.edu.fateczl.SpringCampeonato.model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@EqualsAndHashCode
public class Classificacao 
{
	private String nomeTime;
	private String jogos;
	private String vitorias;
	private String empates;
	private String derrotas;
	private String golsMarcados;
	private String golsSofridos;
	private String saldoGols;
	private String ponto;
}
