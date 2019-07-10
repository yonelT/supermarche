<%@page language="java" pageEncoding="utf8"%>
<%@page
	import="java.util.List, fr.diginamic.model.Commande"%>

<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<!-- Inclure le fichier CSS du répertoire Webapp -->
<link rel="stylesheet" type="text/css" href="styles.css">


<title>Gestion supermarché</title>
</head>
<h1 class="container rounded text-center mt-4 bg-primary">Gestion
	du magasin</h1>
<body class="bg-light">
	<div class="container mt-3">
		<button type="button" class="btn btn-outline-success">
			<a href="http://localhost:8080/supermarche/clients">Clients</a>
		</button>
		<button type="button" class="btn btn-outline-warning">
			<a href="http://localhost:8080/supermarche/commandes">Commandes</a>
		</button>
		<button type="button" class="btn btn-outline-info">
			<a href="http://localhost:8080/supermarche/produits">Produits</a>
		</button>
	</div>
	<div class="container mt-3">
		<div class="row">

			<div class="card col-12 col-md-12 text-center">
				<div class="card-header">
					<form method="POST" action="/supermarche/commandes">
						<h3>
							Commandes
							<div class="float-right">
								<!-- bouton de la modal -->
								<button type="button" class="btn btn-warning" data-toggle="modal"
									data-target="#maModalAjoutCommande">Ajouter une commande</button>
							</div>
						</h3>
				</div>
				<div class="card-body">
					<blockquote class="blockquote mb-0">
						<div class="table-wrapper-scroll-y my-custom-scrollbar">
							<table
								class="h6 table table-sm table-hover table-bordered table-striped mb-0">
								<thead class="thead-dark">
									<tr>
										<th scope="col">id.</th>
										<th scope="col">Référence</th>
									</tr>
								</thead>
								<%
									List<Commande> listeDesCommandes = (List<Commande>) request.getAttribute("maListeCommande");

									for (int i = 0; i < listeDesCommandes.size(); i++) {
								%>
								<tbody>
									<tr class="table-warning">
										<th scope="row"><%=listeDesCommandes.get(i).getId()%></th>
										<td><%=listeDesCommandes.get(i).getReference()%></td>
									</tr>
									<%
										}
									%>
								
							</table>

							</form>
						</div>
					</blockquote>
				</div>
			</div>
		</div>

<!-- Modal d'ajout client -->
	  <div class="modal fade" id="maModalAjoutCommande" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
		  <div class="modal-content">
			<div class="modal-header">
			  <h5 class="modal-title" id="exampleModalLongTitle">Ajouter une commande</h5>
			  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			  </button>
			</div>
			<div class="modal-body">
					<form method="POST" class="form-horizontal" action="/supermarche/commandes">
						
						<div class="form-group">
								<label class="col-md-3" for="laReference">Référence</label>
								
<!-- 								Attention c'est vraiment l'attribut 'name="...."' qui compte ET NON 'id="..."' -->
								<input class="col-md-5" type="text" id="reference_commande" name="reference_commande" required>
						</div>
					
			</div>
			<div class="modal-footer">
					<button type="submit" class="btn btn-info">Valider</button>
			  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			  
			</form>
			</div>
		  </div>
		</div>
	  </div>


	</div>


	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>