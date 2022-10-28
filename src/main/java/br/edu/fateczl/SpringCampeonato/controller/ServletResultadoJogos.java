package br.edu.fateczl.SpringCampeonato.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.edu.fateczl.SpringCampeonato.model.JogosResultado;
import br.edu.fateczl.SpringCampeonato.persistnce.TimesDao;

@Controller
public class ServletResultadoJogos
{
	
	@RequestMapping(name = "insereResultado", value = "/insereResultado", method = RequestMethod.GET)
	public ModelAndView init(ModelMap model) {
		return new ModelAndView("insereResultado");
	}
	
	@RequestMapping(name = "insereResultado", value = "/insereResultado", method = RequestMethod.POST)
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		ArrayList<JogosResultado> resultJogo = new ArrayList<>();
		
		int j = 9;
		int k = 20;
		for(int i=1; i<=8; i++) 
		{
			JogosResultado jog = new JogosResultado();
			String golA = request.getParameter(Integer.toString(i));
			String golB = request.getParameter(Integer.toString(j));
			String rodada = request.getParameter(Integer.toString(k));
			
			if ((golA == "") || (golB == ""))
			{
				System.out.println("nao faz nada pq o jogo nao e valido");;
			}
			
			else 
			{
				System.out.println(golA + " X " + golB +  "= " + rodada);
				jog.setGolsA(golA);
				jog.setGolsB(golB);
				jog.setIdRodada(rodada);
				resultJogo.add(jog);
			}
			
			j = j + 1;
			k = k + 1;
		}
		
		
		for(JogosResultado ler : resultJogo) 
		{
			System.out.println(ler.getGolsA() + " - " + ler.getGolsB() + " -> " + ler.getIdRodada());
		}
				
		try 
		{
			TimesDao cDao = new TimesDao();
			cDao.insereResultado(resultJogo);
		} 
		
		catch (SQLException | ClassNotFoundException e) 
		{
			e.printStackTrace();
		}
		
		RequestDispatcher r = request.getRequestDispatcher("jogos.jsp" ); 
		r.forward( request, response );

	}
}
