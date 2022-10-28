package br.edu.fateczl.SpringCampeonato.persistnce;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import br.edu.fateczl.SpringCampeonato.model.Grupo;

@Repository
public class GrupoDao 
{	
private Connection c;
	
	public GrupoDao() throws ClassNotFoundException, SQLException 
	{
		GenericDao gDao = new GenericDao();
		c = gDao.getConnection();
	}
	
	public String divideTimes() throws SQLException
	{
		String sql = "{CALL SP_DivideTime_INS}";
		CallableStatement cs = c.prepareCall(sql);
		cs.execute();
		String saida = "grupos gerados, as partidas foram apagadas será necessario gerar novos jogos";
		return saida;
	}
	
	public ArrayList<Grupo> mostraGrupo() throws SQLException, ClassNotFoundException
	{
		
		GenericDao gDao = new GenericDao();
		c = gDao.getConnection();
		
		ArrayList<Grupo> grupoLista = new ArrayList<Grupo>();
		
		String selectStatement = "select gp.grupo, tm.NomeTime from grupos as gp INNER JOIN times as tm ON gp.codigoTime = tm.codigoTime";
		PreparedStatement prepStmt = c.prepareStatement(selectStatement);
	    ResultSet rs = prepStmt.executeQuery();

	    while (rs.next()) 
	    {	
	    	Grupo grupo = new Grupo();
	    	grupo.setGrupo(rs.getString("grupo"));
	    	grupo.setCodigoTime(rs.getString("NomeTime"));
	    	grupoLista.add(grupo);
	     }
	   
	     rs.close();
	     prepStmt.close();
		 c.close();
		return grupoLista;
		
	}
}
