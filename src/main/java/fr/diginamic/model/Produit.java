package fr.diginamic.model;

public class Produit {
	
	protected int numero = 0;
	protected String libelle = null;
		
	public Produit() {
	
	}
	
	public Produit(int numero, String libelle) {
		super();
		this.numero = numero;
		this.libelle = libelle;
	}

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}

	public String getLibelle() {
		return libelle;
	}

	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}
	
}
