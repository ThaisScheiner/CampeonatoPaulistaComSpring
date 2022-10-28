package br.edu.fateczl.SpringCampeonato.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.edu.fateczl.SpringCampeonato.model.Classificacao;
import br.edu.fateczl.SpringCampeonato.persistnce.ClassificacaoDAO;

@Controller
public class ServletQuartas 
{
	@Autowired
	ClassificacaoDAO cDao;
	
	@RequestMapping(name = "quartas", value = "/quartas", method = RequestMethod.GET)
	public ModelAndView init(ModelMap model) {
		return new ModelAndView("quartas");
	}
	
	@RequestMapping(name = "quartas", value = "/quartas", method = RequestMethod.POST)
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		ArrayList<Classificacao> quartasA = new ArrayList<>();
		ArrayList<Classificacao> quartasB= new ArrayList<>();
		ArrayList<Classificacao> quartasC = new ArrayList<>();
		ArrayList<Classificacao> quartasD = new ArrayList<>();
		
		try 
		{
			ClassificacaoDAO cDao = new ClassificacaoDAO();	
			quartasA = cDao.QuartasDeFinal("A");
			quartasB = cDao.QuartasDeFinal("B");
			quartasC = cDao.QuartasDeFinal("C");
			quartasD = cDao.QuartasDeFinal("D");

		}
		
		catch (ClassNotFoundException | SQLException e) 
		{
			e.printStackTrace();
		} 
		
		request.setAttribute("quartasA", quartasA);
		request.setAttribute("quartasB", quartasB);
		request.setAttribute("quartasC", quartasC);
		request.setAttribute("quartasD", quartasD);
		request.getRequestDispatcher("/Quartas.jsp").forward(request, response);
	}

}
