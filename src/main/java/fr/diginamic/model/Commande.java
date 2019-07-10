package fr.diginamic.model;

public class Commande {
	
	protected int id = 0;
	protected String reference = null;
	
	public Commande() {

	}
	
	public Commande(int id, String reference) {
		super();
		this.id = id;
		this.reference = reference;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getReference() {
		return reference;
	}

	public void setReference(String reference) {
		this.reference = reference;
	}

}
