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
import fr.diginamic.model.Produit;

@WebServlet(urlPatterns = "/produits/*")
public class WebServLet_Produit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String query = "select * from produit";
		List<Produit> maListeProduit = new ArrayList<>();
		ConnexionUtils monConnecteur = new ConnexionUtils();

		maListeProduit = monConnecteur.getProduitsEnBase(query);

		req.setAttribute("maListeProduit", maListeProduit);

		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/produits.jsp");
		requestDispatcher.forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		List<Produit> maListeProduit = new ArrayList<>();
		ConnexionUtils monConnecteur = new ConnexionUtils();
		
		String query1 = null;
		String nouveauLibelle = req.getParameter("libelle_produit");

		query1 = "INSERT INTO PRODUIT(libelle) VALUES (\"" + nouveauLibelle + "\");";
		monConnecteur.ajouterUneChoseEnBase(query1);

		/* Réafficher la page - meme partie que le doGet */
		String query = "select * from produit";
		maListeProduit = monConnecteur.getProduitsEnBase(query);

		req.setAttribute("maListeProduit", maListeProduit);

		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/produits.jsp");
		requestDispatcher.forward(req, resp);
	}

}
