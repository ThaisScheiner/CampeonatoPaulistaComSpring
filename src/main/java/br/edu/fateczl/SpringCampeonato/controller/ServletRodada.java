package br.edu.fateczl.SpringCampeonato.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.edu.fateczl.SpringCampeonato.model.Jogos;
import br.edu.fateczl.SpringCampeonato.persistnce.ResultadoDao;

@Controller
public class ServletRodada 
{
	@Autowired
	ResultadoDao rDao;
	
	@RequestMapping(name = "rodada", value = "/rodada", method = RequestMethod.GET)
	public ModelAndView init(ModelMap model) {
		return new ModelAndView("rodada");
	}
	
	@RequestMapping(name = "rodada", value = "/rodada", method = RequestMethod.POST)
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		ArrayList<Jogos> jogos = new ArrayList<>();
		
		
		Jogos jogosLista = new Jogos();
		
		try 
		{
			ResultadoDao rDao = new ResultadoDao();
			jogos = (ArrayList<Jogos>) rDao.mostraJogos();
			
		} 
		
		catch (ClassNotFoundException | SQLException e) 
		{
			 e.getMessage();
		} 
		
		finally 
		{
			RequestDispatcher rd = request.getRequestDispatcher("rodada.jsp");
			request.setAttribute("jogoLista", jogosLista);
			request.setAttribute("jogos", jogos);
			rd.forward(request, response);
		}
			
	
	
	}
}
