package br.edu.fateczl.SpringCampeonato.model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@EqualsAndHashCode
public class Jogos 
{
	private String id;
	private String timeA;
	private String timeb;
	private String Rodada;
	private String dataRod;
}
