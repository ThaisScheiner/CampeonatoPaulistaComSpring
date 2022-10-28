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
import br.edu.fateczl.SpringCampeonato.persistnce.TimesDao;

@Controller
public class ServletMostraJogos 
{
	@Autowired
	TimesDao tDao;
	
	//@RequestMapping(name = "MostraJogos", value = "/MostraJogos", method = RequestMethod.GET)
	//public ModelAndView init(ModelMap model) {
	//	return new ModelAndView("MostraJogos");
	//}
	
	@RequestMapping(name = "Mostrajogos", value = "/Mostrajogos", method = RequestMethod.POST)
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		String data  = request.getParameter("data");

		ArrayList<Jogos> jogosLista = new ArrayList<>();
		
		try 
		{
			TimesDao tDao = new TimesDao();
			jogosLista= tDao.mostraJogo(data);
		} 
		
		catch (ClassNotFoundException | SQLException e) 
		{
			 e.getMessage();
		} 
		
		finally 
		{
			RequestDispatcher rd = request.getRequestDispatcher("jogos.jsp");
			
			if(jogosLista.isEmpty()) 
			{
				request.setAttribute("mensagem", "nao ha jogos nesse dia");
				rd.forward(request, response);
			}
			
			else 
			{
				request.setAttribute("jogo", jogosLista);
				rd.forward(request, response);
			}
			
		}
	
	}
}
