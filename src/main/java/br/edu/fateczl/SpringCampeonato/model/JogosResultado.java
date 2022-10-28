package br.edu.fateczl.SpringCampeonato.model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@EqualsAndHashCode
public class JogosResultado 
{
	private String golsA;
	private String golsB;
	private String idRodada;
}
