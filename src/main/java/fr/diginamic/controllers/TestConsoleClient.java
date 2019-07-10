package fr.diginamic.controllers;

import java.util.ArrayList;
import java.util.List;

import fr.diginamic.dao.ConnexionUtils;
import fr.diginamic.model.Client;

public class TestConsoleClient {

	public static void main(String[] args) {
		String query = "select * from client";
		List<Client> maListeClient = new ArrayList<>();
		ConnexionUtils monConnecteur = new ConnexionUtils();
		
		maListeClient = monConnecteur.getClientsEnBase(query);
		
		for (Client list : maListeClient) {
			System.out.println("id: " + list.getId() + " Nom: " + list.getNom() + " Prenom: " + list.getPrenom() + " Age: " + list.getAge() + " Adresse: " + list.getAdresse());
		}

	}

}
