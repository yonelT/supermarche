<%@page language="java" pageEncoding="utf8"%>
<%@page import="java.util.List, fr.diginamic.model.Client"%>

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
		<button id="monButtonClient" type="submit" class="btn btn-outline-success">Clients</button>
		<button id="monButtonCommande" type="submit" class="btn btn-outline-warning">Commandes</button>
		<button button id="monButtonProduit" type="submit" class="btn btn-outline-info">Produits</button>
	</div>
	<div class="container mt-3">

		<div class="row">
			<div class="card col-12 col-md-12 text-center">

				<div class="card-header">
					<form action="POST">
						<h3>
							Clients
							<div class="float-right">
								<!-- bouton de la modal ajout -->
								<button type="button" class="btn btn-success" data-toggle="modal"
									data-target="#maModalAjoutClient">Ajouter un client</button>
									<!-- bouton de la modal supprimer -->
								<button type="button" class="btn btn-danger" data-toggle="modal"
									data-target="#maModalSupprimerClient">Supprimer un client</button>
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
										<th scope="col">Nom</th>
										<th scope="col">Prénom</th>
										<th scope="col">Age</th>
										<th scope="col">Adresse</th>
									</tr>
								</thead>
								<%
									List<Client> listeDesClients = (List<Client>) request.getAttribute("maListeClient");

									for (int i = 0; i < listeDesClients.size(); i++) {
								%>
								<tbody>
									<tr class="table-success">
										<th scope="row"><%=listeDesClients.get(i).getId()%></th>
										<td><%=listeDesClients.get(i).getNom()%></td>
										<td><%=listeDesClients.get(i).getPrenom()%></td>
										<td><%=listeDesClients.get(i).getAge()%></td>
										<td><%=listeDesClients.get(i).getAdresse()%></td>
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
		<div class="modal fade" id="maModalAjoutClient" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle">Ajouter un
							client</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form method="POST" class="form-horizontal" action="/supermarche/clients">

							<div class="form-group">
								<label class="col-md-3" for="leNom">Nom</label> <input
									class="col-md-5" type="text" id="le_nom_client" name="le_nom_client" required>
							</div>
							<div class="form-group">
								<label class="col-md-3" for="lePrenom">Prénom</label> <input
									class="col-md-5" type="text" id="le_prenom_client" name="le_prenom_client" required>
							</div>
							<div class="form-group">
								<label class="col-md-3" for="lAge">Age</label> <input
									class="col-md-5" type="text" id="lage_client" name="lage_client" required>
							</div>
							<div class="form-group">
								<label class="col-md-3" for="lAdresse">Adresse</label> <input
									class="col-md-5" type="text" id="ladresse_client" name="ladresse_client" required>
							</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-info">Valider</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>

						</form>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Modal de suppression client -->
		<div class="modal fade" id="maModalSupprimerClient" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitleSupprimer"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle">Supprimer un
							client</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form method="POST" class="form-horizontal" action="/supermarche/clients">

							<div class="form-group">
								<label class="col-md-3" for="leNom">Identifiant à supprimer</label> <input
									class="col-md-5" type="text" id="id_client_suppr" name="id_client_suppr" required>
							</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-danger">Valider</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Fermer</button>

						</form>
					</div>
				</div>
			</div>
		</div>

	</div>

<script type="text/javascript">
    document.getElementById("monButtonClient").onclick = function () {
        location.href = "clients";
    };
    
    document.getElementById("monButtonCommande").onclick = function () {
        location.href = "commandes";
    };
    
    document.getElementById("monButtonProduit").onclick = function () {
        location.href = "produits";
    };
</script>

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