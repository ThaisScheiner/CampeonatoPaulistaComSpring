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
public class ServletClassGrupo 
{
	
	@Autowired
	ClassificacaoDAO cDao;
	
	@RequestMapping(name = "ClassificacaoG", value = "/ClassificacaoG", method = RequestMethod.GET)
	public ModelAndView init(ModelMap model) {
		return new ModelAndView("ClassificacaoG");
	}
	
	@RequestMapping(name = "ClassificacaoG", value = "/ClassificacaoG", method = RequestMethod.POST)
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Classificacao> grupoA = new ArrayList<>();
		ArrayList<Classificacao> grupoB = new ArrayList<>();
		ArrayList<Classificacao> grupoC = new ArrayList<>();
		ArrayList<Classificacao> grupoD = new ArrayList<>();
		ArrayList<Classificacao> rebaixados = new ArrayList<>();
		
		try {
			ClassificacaoDAO cDao = new ClassificacaoDAO();	
			grupoA = cDao.ClassGrupo("A");
			grupoB = cDao.ClassGrupo("B");
			grupoC = cDao.ClassGrupo("C");
			grupoD = cDao.ClassGrupo("D");
			rebaixados = cDao.rebaixados();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} 
		
		request.setAttribute("GrupoA", grupoA);
		request.setAttribute("GrupoB", grupoB);
		request.setAttribute("GrupoC", grupoC);
		request.setAttribute("GrupoD", grupoD);
		request.setAttribute("rebaixados", rebaixados);
		request.getRequestDispatcher("/tabela.jsp").forward(request, response);
	}
}
