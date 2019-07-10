package fr.diginamic.controllers;

import java.util.ArrayList;
import java.util.List;

import fr.diginamic.dao.ConnexionUtils;
import fr.diginamic.model.Produit;

public class TestConsoleProduit {

	public static void main(String[] args) {
		String query = "select * from produit";
		List<Produit> maListeProduit = new ArrayList<>();
		ConnexionUtils monConnecteur = new ConnexionUtils();
		
		maListeProduit = monConnecteur.getProduitsEnBase(query);
		
		for (Produit list : maListeProduit) {
			System.out.println("Numero: " + list.getNumero() + " Libellé: " + list.getLibelle());
		}

	}

}
