package br.edu.fateczl.SpringCampeonato.persistnce;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import br.edu.fateczl.SpringCampeonato.model.Jogos;

@Repository
public class ResultadoDao 
{
	private Connection c;

	public String geraJogos() throws SQLException 
	{
		String sql = "{CALL SP_FormarJogo}";
		CallableStatement cs = c.prepareCall(sql);
		cs.execute();

		String saida = "As rodadas foram definidas";
		return saida;
	}

	public List<Jogos> mostraJogos() throws SQLException, ClassNotFoundException
	{
		
		List<Jogos> jogos = new ArrayList<>();
		GenericDao gDao = new GenericDao();
		c = gDao.getConnection();
		
		
		Connection c = gDao.getConnection();
		String sql = " SELECT * FROM jogos";
		PreparedStatement ps = c.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next())
		{
			Jogos jogo = new Jogos();
	    	jogo.setId(rs.getString(1));
	    	jogo.setTimeA(rs.getString(2));
	    	jogo.setTimeb(rs.getString(3));
	    	jogo.setRodada(rs.getString(4));
	    	jogo.setDataRod(rs.getString(5));
			
	    	System.out.println("entrou dao");
	    	System.out.println(" jogo no dao " + jogo);
	    	
	    	jogos.add(jogo);
		}
		ps.close();
		rs.close();
		c.close();
		return jogos; 
	
	}
}
