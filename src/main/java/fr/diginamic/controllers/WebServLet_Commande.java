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
import fr.diginamic.model.Commande;

@WebServlet(urlPatterns = "/commandes/*")
public class WebServLet_Commande extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String query = "select * from commande";
		List<Commande> maListeCommande = new ArrayList<>();
		ConnexionUtils monConnecteur = new ConnexionUtils();

		maListeCommande = monConnecteur.getCommandesEnBase(query);

		req.setAttribute("maListeCommande", maListeCommande);

		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/commandes.jsp");
		requestDispatcher.forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		List<Commande> maListeCommande = new ArrayList<>();
		ConnexionUtils monConnecteur = new ConnexionUtils();

		String query1 = null;
		if (req.getParameter("reference_commande") == null) {
		int idSuppr = Integer.parseInt(req.getParameter("id_commande_suppr"));
		String query2 = null;
		query2 = "delete from commande where commande.id=" + idSuppr + ";";
		monConnecteur.modifierUneChoseEnBase(query2);	
		} else {
		String referenceCommande = req.getParameter("reference_commande");

		query1 = "INSERT INTO COMMANDE(reference) VALUES (\"" + referenceCommande + "\");";
		monConnecteur.modifierUneChoseEnBase(query1);
		}
		/* Réafficher la page - meme partie que le doGet */
		String query = "select * from commande";
		maListeCommande = monConnecteur.getCommandesEnBase(query);

		req.setAttribute("maListeCommande", maListeCommande);

		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/commandes.jsp");
		requestDispatcher.forward(req, resp);
	}

}
