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

import br.edu.fateczl.SpringCampeonato.model.Grupo;
import br.edu.fateczl.SpringCampeonato.persistnce.GrupoDao;

@Controller
public class ServletMostraGrupo 
{
	@Autowired
	GrupoDao gDao;
	
	@RequestMapping(name = "MostraGrupos", value = "/MostraGrupos", method = RequestMethod.GET)
	public ModelAndView init(ModelMap model) 
	{
		return new ModelAndView("MostraGrupos");
	}
	
	@RequestMapping(name = "MostraGrupos", value = "/MostraGrupos", method = RequestMethod.POST)
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

		ArrayList<Grupo> grupoLista = new ArrayList<>();
		
		try 
		{
			GrupoDao gDao = new GrupoDao();	
			grupoLista = gDao.mostraGrupo();
		} 
		
		catch (ClassNotFoundException | SQLException e) 
		{
			e.printStackTrace();
		} 

		@SuppressWarnings("unchecked")
        ArrayList<Grupo> agrupamentos[] = new ArrayList[4];
        
        for(int i = 0; i<agrupamentos.length; i++) 
        {
            agrupamentos[i] = new ArrayList<Grupo>();
        }
        
        for(Grupo g : grupoLista) 
        {
            String grupo = g.getGrupo();
            if(grupo.equalsIgnoreCase("a")) 
            {
                agrupamentos[0].add(g);
            }
            
            else if(grupo.equalsIgnoreCase("b")) 
            {
                agrupamentos[1].add(g);
            }
            
            else if(grupo.equalsIgnoreCase("c")) 
            {
                agrupamentos[2].add(g);
            }
            
            else 
            {
                agrupamentos[3].add(g);
            }
        }
        
        for(ArrayList<Grupo> listagens : agrupamentos) 
        {
            request.setAttribute("Grupo_"+listagens.get(0).getGrupo(), listagens);
        }
        
        request.getRequestDispatcher("/grupos.jsp").forward(request, response);
    }
}
