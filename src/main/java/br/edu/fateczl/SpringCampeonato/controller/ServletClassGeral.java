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
public class ServletClassGeral 
{
	@Autowired
	ClassificacaoDAO cDao;
	
	@RequestMapping(name = "geral", value = "/geral", method = RequestMethod.GET)
	public ModelAndView init(ModelMap model) 
	{
		return new ModelAndView("classificacao");
	}
	
	@RequestMapping(name = "geral", value = "/geral", method = RequestMethod.POST)
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		ArrayList<Classificacao> tabela = new ArrayList<>();
		ArrayList<Classificacao> rebaixados = new ArrayList<>();
		ArrayList<Classificacao> promovidos = new ArrayList<>();
		
		try {
			ClassificacaoDAO cDao = new ClassificacaoDAO();	
			tabela = cDao.ClassGeral();
			rebaixados = cDao.rebaixados();
			promovidos = cDao.promovidos();
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} 
		
		request.setAttribute("tabela", tabela);
		request.setAttribute("rebaixados", rebaixados);
		request.setAttribute("promovidos", promovidos);
		request.getRequestDispatcher("/TabelaGeral.jsp").forward(request, response);
	}
	
	
	
}
