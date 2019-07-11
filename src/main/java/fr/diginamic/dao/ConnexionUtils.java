package fr.diginamic.dao;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

import fr.diginamic.model.Client;
import fr.diginamic.model.Commande;
import fr.diginamic.model.Produit;

public class ConnexionUtils {

	List<Client> listeClient = new ArrayList<>();
	List<Commande> listeCommande = new ArrayList<>();
	List<Produit> listeProduit = new ArrayList<>();

	/* Chargement du fichier resources */
	ResourceBundle fichierConf = ResourceBundle.getBundle("connectionDB");

	/* Connexion grace au fichier resource */
	String driver = fichierConf.getString("connectionDB.driver");
	String url = fichierConf.getString("connectionDB.url");
	String user = fichierConf.getString("connectionDB.user");
	String password = fichierConf.getString("connectionDB.password");

	Connection maConnection = null;
	Statement monStatement = null;
	ResultSet monResultSet = null;

	public List<Client> getClientsEnBase(String query) {
		/* Connexion grace au fichier resource */
		String driver = fichierConf.getString("connectionDB.driver");
		String url = fichierConf.getString("connectionDB.url");
		String user = fichierConf.getString("connectionDB.user");
		String password = fichierConf.getString("connectionDB.password");

		int idClientCourant = 0;
		String nomClientCourant = null;
		String prenomClientCourant = null;
		int ageClientCourant = 0;
		String adresseClientCourant = null;

		try {

			/* Chargement du driver */
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());

			/* Connexion à la base */
			maConnection = DriverManager.getConnection(url, user, password);

			/* Création du statement */
			monStatement = maConnection.createStatement();

			/* Création du ResultSet pour "fouiller" dans la base */
			monResultSet = monStatement.executeQuery(query);

			/* Pour chaque ligne du ResultSet crée un Client */
			while (monResultSet.next()) {
				idClientCourant = monResultSet.getInt("id");
				nomClientCourant = monResultSet.getString("nom_client");
				prenomClientCourant = monResultSet.getString("prenom_client");
				ageClientCourant = monResultSet.getInt("age_client");
				adresseClientCourant = monResultSet.getString("adresse_client");
				listeClient.add(new Client(idClientCourant, nomClientCourant, prenomClientCourant, ageClientCourant,
						adresseClientCourant));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				monResultSet.close();
				monStatement.close();
				maConnection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return listeClient;
		}
	}

	public List<Commande> getCommandesEnBase(String query) {

		int idCommandeCourante = 0;
		String referenceCommandeCourante = null;
		String dateCommandeCourante = null;

		try {

			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());

			maConnection = DriverManager.getConnection(url, user, password);

			monStatement = maConnection.createStatement();

			monResultSet = monStatement.executeQuery(query);

			while (monResultSet.next()) {
				idCommandeCourante = monResultSet.getInt("id");
				referenceCommandeCourante = monResultSet.getString("reference");

				listeCommande.add(new Commande(idCommandeCourante, referenceCommandeCourante));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				monResultSet.close();
				monStatement.close();
				maConnection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return listeCommande;
		}
	}

	public List<Produit> getProduitsEnBase(String query) {

		int numeroProduitCourant = 0;
		String libelleProduitCourant = null;

		try {

			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());

			maConnection = DriverManager.getConnection(url, user, password);

			monStatement = maConnection.createStatement();

			monResultSet = monStatement.executeQuery(query);

			while (monResultSet.next()) {
				numeroProduitCourant = monResultSet.getInt("numero");
				libelleProduitCourant = monResultSet.getString("libelle");

				listeProduit.add(new Produit(numeroProduitCourant, libelleProduitCourant));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			try {
				monResultSet.close();
				monStatement.close();
				maConnection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return listeProduit;
		}
	}

	public void modifierUneChoseEnBase(String query) {

		try {

			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());

			maConnection = DriverManager.getConnection(url, user, password);
			maConnection.setAutoCommit(false);

			monStatement = maConnection.createStatement();

			monStatement.executeUpdate(query);

			maConnection.commit();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				monStatement.close();
				maConnection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
