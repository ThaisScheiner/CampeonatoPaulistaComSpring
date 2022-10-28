package br.edu.fateczl.SpringCampeonato.controller;

import java.io.IOException;
import java.sql.SQLException;

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

import br.edu.fateczl.SpringCampeonato.persistnce.GrupoDao;

@Controller
public class ServletGeraGrupo 
{
	@Autowired
	GrupoDao gDao;
	
	@RequestMapping(name = "divideGrupo", value = "/divideGrupo", method = RequestMethod.GET)
	public ModelAndView init(ModelMap model) {
		return new ModelAndView("divideGrupo");
	}
	
	@RequestMapping(name = "divideGrupo", value = "/divideGrupo", method = RequestMethod.POST)
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String saida="";
		
		try
		{
			GrupoDao gDao = new GrupoDao();
			saida = gDao.divideTimes();
		} 
		
		catch (ClassNotFoundException | SQLException e) 
		{
			saida = e.getMessage();
		} 
		
		finally 
		{
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			request.setAttribute("saidagrupo", saida);
			rd.forward(request, response);
		}
		
		
	
	}
}
