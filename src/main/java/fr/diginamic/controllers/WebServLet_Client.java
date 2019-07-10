package fr.diginamic.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.diginamic.dao.ConnexionUtils;
import fr.diginamic.model.Client;

@WebServlet(urlPatterns = "/clients/*")
public class WebServLet_Client extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String query = "select * from client";
		List<Client> maListeClient = new ArrayList<>();
		ConnexionUtils monConnecteur = new ConnexionUtils();
		
		maListeClient = monConnecteur.getClientsEnBase(query);
		
		req.setAttribute("maListeClient", maListeClient);

		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/clients.jsp");
		requestDispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<Client> maListeClient = new ArrayList<>();
		
		String query1 = null;
		String query2 = "select * from client";

		String nomClient = req.getParameter("le_nom_client");
		String prenomClient = req.getParameter("le_prenom_client");
		int ageClient = Integer.parseInt(req.getParameter("lage_client"));
		String adresseClient = req.getParameter("ladresse_client");
		
		ConnexionUtils monConnecteur = new ConnexionUtils();
		
		query1 = "INSERT INTO CLIENT(nom_client, prenom_client, age_client, adresse_client) VALUES (\"" + nomClient + "\",\"" + prenomClient + "\",\"" + ageClient +  "\",\"" + adresseClient + "\");";                                        
		monConnecteur.ajouterUneChoseEnBase(query1);
		
		/* Réafficher la page - meme partie que le doGet */
		maListeClient = monConnecteur.getClientsEnBase(query2);
		
		req.setAttribute("maListeClient", maListeClient);

		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/clients.jsp");
		requestDispatcher.forward(req, resp);
	}

}
