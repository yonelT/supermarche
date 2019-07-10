package fr.diginamic.controllers;

import java.util.ArrayList;
import java.util.List;

import fr.diginamic.dao.ConnexionUtils;
import fr.diginamic.model.Commande;

public class TestConsoleCommande {

	public static void main(String[] args) {
		String query = "select * from commande";
		List<Commande> maListeCommande = new ArrayList<>();
		ConnexionUtils monConnecteur = new ConnexionUtils();
		
		maListeCommande = monConnecteur.getCommandesEnBase(query);
		
		for (Commande list : maListeCommande) {
			System.out.println("id: " + list.getId() + " Reference: " + list.getReference());
		}

	}

}
