<%@page language="java" pageEncoding="utf8"%>
<%@page
	import="java.util.List, fr.diginamic.model.Produit"%>

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
							Produits
							<div class="float-right">
								<!-- bouton de la modal -->
								<button type="button" class="btn btn-info" data-toggle="modal"
									data-target="#maModalAjoutProduit">Ajouter un produit</button>
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
										<th scope="col">Numero</th>
										<th scope="col">Libellé</th>

									</tr>
								</thead>
								<%
									List<Produit> listeDesProduits = (List<Produit>) request.getAttribute("maListeProduit");

									for (int i = 0; i < listeDesProduits.size(); i++) {
								%>
								<tbody>
									<tr class="table-info">
										<th scope="row"><%=listeDesProduits.get(i).getNumero()%></th>
										<td><%=listeDesProduits.get(i).getLibelle()%></td>

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

<!-- Modal d'ajout produit -->
	  <div class="modal fade" id="maModalAjoutProduit" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
		  <div class="modal-content">
			<div class="modal-header">
			  <h5 class="modal-title" id="exampleModalLongTitle">Ajouter un produit</h5>
			  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			  </button>
			</div>
			<div class="modal-body">
					<form method="POST" class="form-horizontal" action="/supermarche/produits">
						
						<div class="form-group">
								<label class="col-md-3" for="leLibelle">Libellé</label>
								<input class="col-md-5" type="text" id="libelle_produit" name="libelle_produit" required>
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