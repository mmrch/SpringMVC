<html>
<head>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">

<script
	src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<title><c:out value="${title}">ShopBridge</c:out></title>
</head>
<body style="background-color: #ccccff;">
	<div class="container mt-3">

		<div class="row">
			<div class="col-md-12">
				<h1 class="text-center">ShopBridge</h1>
				<br>
				<h3 class="text-center">Welcome to admin page</h3>
				<table class="table" id="myTable">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Product Id</th>
							<th scope="col">Product Name</th>
							<th scope="col">Description</th>
							<th scope="col">Stock</th>
							<th scope="col">Price</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${product}" var="p">
							<tr>
								<th scope="row">AXQ${p.id}</th>
								<td>${p.name}</td>
								<td>${p.description}</td>
								<td>${p.stock}</td>
								<td class="font-weight-bold">&#x20B9; ${p.price}</td>
								<td><a href="#" onclick="deleteProduct(${p.id})"><i
										class="fas fa-trash text-danger"></i></a> &nbsp;&nbsp; <a href="#"
									onclick="updateProduct(${p.id})"><i
										class="fas fa-edit text-primary"></i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="container text-center">
					<button type="button" class="btn btn-success" data-toggle="modal"
						data-target="#myModal">Add New Product</button>
				</div>
			</div>
		</div>
		<!-- Add Product Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog  modal-lg">
				<div class="modal-content">
					<div class="modal-header d-block">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h3 class="text-center-mb-3" style="text-align: center;">Add
						 product details</h3>
					</div>
					<div class="modal-body">
						<form action="adding-product" id="addForm" method="post" onsubmit="return validateAddProduct();">
							<div class="form-group">
								<label for="name">Product Name</label><span style="color: red;">*</span>
								<input type="text" class="form-control" id="name" name="name"
									placeholder="Enter the product name">
								<div class="text-danger hide" id="validateName">&nbsp;Product
									name is required</div>
							</div>

							<div class="form-group">
								<label for="name">Product Description (optional)</label>
								<textarea class="form-control" id="description"
									name="description" row="5"
									placeholder="Enter the product description"></textarea>

							</div>

							<div class="form-group">
								<label for="name">Number of stock</label><span
									style="color: red;">*</span> <input type="text"
									class="form-control" id="stock" name="stock"
									placeholder="Enter the number of stock available e.g: 14">
								<div class="text-danger hide" id="validateStock">&nbsp;Enter
									the valid number of stock available </div>
							</div>

							<div class="form-group">
								<label for="name">Price (INR)</label><span style="color: red;">*</span>
								<input type="text" class="form-control" id="price" name="price"
									placeholder="Enter the product price e.g: 599">
								<div class="text-danger hide" id="validatePrice">&nbsp;Enter
									the valid product price </div>
							</div>

							<div class="modal-footer form-group">
								<button type="button" class="btn btn-outline-danger"
									data-dismiss="modal">Back</button>
								<button type="submit" id="" class="btn btn-primary">Add
									product</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!-- Edit Product Modal -->
		<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog  modal-lg">
				<div class="modal-content">
					<div class="modal-header d-block">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h3 class="text-center-mb-3" style="text-align: center;">Modify
							the product details</h3>
					</div>
					<div class="modal-body">
						<form action="${pageContext.request.contextPath}/adding-product"
							method="post" onsubmit="return validateUpdateProduct();">

							<input type="hidden" id="id1" name="id"
								value="${updateProduct.id}">
							<div class="form-group">
								<label for="name">Product Name</label> <input type="text"
									class="form-control" id="name1" name="name"
									placeholder="Enter the product name" value="${updateProduct}">
									<div class="text-danger hide" id="validateName1">&nbsp;Product
									name is required</div>
							</div>

							<div class="form-group">
								<label for="name">Product Description</label>
								<textarea class="form-control" id="description1"
									name="description" row="5"
									placeholder="Enter the product description">${updateProduct}</textarea>

							</div>

							<div class="form-group">
								<label for="name">Number of stock</label> <input type="text"
									class="form-control" id="stock1" name="stock"
									placeholder="Enter the number of stock available"
									value="${updateProduct.stock}">
									<div class="text-danger hide" id="validateStock1">&nbsp;Enter
									the valid number of stock available </div>
							</div>

							<div class="form-group">
								<label for="name">Price</label> <input type="text"
									class="form-control" id="price1" name="price"
									placeholder="Enter the product price"
									value="${updateProduct.price}">
									<div class="text-danger hide" id="validatePrice1">&nbsp;Enter
									the valid product price </div>
							</div>

							<div class="modal-footer form-group">
								<button type="button" class="btn btn-outline-danger"
									data-dismiss="modal">Back</button>
								<button type="submit" class="btn btn-warning">Update
									product</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>

<script>
	$(document).ready(function() {
		$('#myTable').DataTable();
		$('#name').on("blur",function(){
		    if(this.value==""){
		    	$('#validateName').removeClass('hide');
		    	$('#name').addClass('is-invalid');
		    }else{
		    	$('#validateName').addClass('hide');
		    	$('#name').removeClass('is-invalid');
		    	$('#name').addClass('is-valid');
		    }
		});
		
		$('#stock').on("blur",function(){
		    if(this.value==""){
		    	$('#validateStock').removeClass('hide');
		    	$('#stock').addClass('is-invalid');
		    }else{
		    	$('#validateStock').addClass('hide');
		    	$('#stock').removeClass('is-invalid');
		    	$('#stock').addClass('is-valid');
		    }
		});
		
		$('#price').on("blur",function(){
			
		    if(this.value==""){
		    	$('#validatePrice').removeClass('hide');
		    	$('#price').addClass('is-invalid');
		    }else{
		    	$('#validatePrice').addClass('hide');
		    	$('#price').removeClass('is-invalid');
		    	$('#price').addClass('is-valid');
		    }
	});
		
		
		$('#name1').on("blur",function(){
		    if(this.value==""){
		    	$('#validateName1').removeClass('hide');
		    	$('#name1').addClass('is-invalid');
		    }else{
		    	$('#validateName1').addClass('hide');
		    	$('#name1').removeClass('is-invalid');
		    	$('#name1').addClass('is-valid');
		    }
		});
		
		$('#stock1').on("blur",function(){
		    if(this.value==""){
		    	$('#validateStock1').removeClass('hide');
		    	$('#stock1').addClass('is-invalid');
		    }else{
		    	$('#validateStock1').addClass('hide');
		    	$('#stock1').removeClass('is-invalid');
		    	$('#stock1').addClass('is-valid');
		    }
		});
		
		$('#price1').on("blur",function(){
		    if(this.value==""){
		    	$('#validatePrice1').removeClass('hide');
		    	$('#price1').addClass('is-invalid');
		    }else{
		    	$('#validatePrice1').addClass('hide');
		    	$('#price1').removeClass('is-invalid');
		    	$('#price1').addClass('is-valid');
		    }
	});
	});
	
	function deleteProduct(id){
		var table = $('#myTable').DataTable();
		if(confirm("Are you sure, want to delete this product with id --> AXQ"+id)){
			$.ajax({
				  url: "delete/"+id,
				}).done(function() {
					table.row($.this).remove().draw();
					location.reload();
				});
		}
	}
	
	function updateProduct(id){
		var table = $('#myTable').DataTable();
		$('#myModal1').modal('show');
		setTimeout(function(){
		$.ajax({
				  url: "update/"+id,
				}).done(function(response) {
					var obj= JSON.parse(response);
					console.log(obj);
					$('#id1').val(obj.id);
					$('#name1').val(obj.name);
					$('#description1').val(obj.description);
					$('#price1').val(obj.price);
					$('#stock1').val(obj.stock);
					
				});
		},200);
	}
	
	function validateAddProduct()
	  {
	    var name=document.getElementById('name');
	    var price=document.getElementById('price');
	    var stock=document.getElementById('stock');
	    if(name.value==""){
	    	alert('Product name cannot be kept empty');
	    	name.focus();
	    	return false;
	    }else if(stock.value==""){
	    	alert('Stock of product cannot be kept empty');
	    	stock.focus();
	    	return false;
	    }else if(stock.value%1!=0){
	    	alert('Invalid input ,stock of product must be a number');
	    	price.focus();
	    	return false;
	    }else if(price.value==""){
	    	alert('Price of product cannot be kept empty');
	    	price.focus();
	    	return false;
	    }else if(price.value%1!=0){
	    	alert('Invalid input ,price of product must be a number');
	    	price.focus();
	    	return false;
	    }
	    return true;
	  }
	
	function validateUpdateProduct()
	  {
	    var name=document.getElementById('name1');
	    var price=document.getElementById('price1');
	    var stock=document.getElementById('stock1');
	    if(name.value==""){
	    	alert('Product name cannot be kept empty');
	    	name.focus();
	    	return false;
	    }else if(stock.value==""){
	    	alert('Stock of product cannot be kept empty');
	    	stock.focus();
	    	return false;
	    }else if(stock.value%1!=0){
	    	alert('Invalid input ,stock of product must be a number');
	    	price.focus();
	    	return false;
	    }else if(price.value==""){
	    	alert('Price of product cannot be kept empty');
	    	price.focus();
	    	return false;
	    }else if(price.value%1!=0){
	    	alert('Invalid input ,price of product must be a number');
	    	price.focus();
	    	return false;
	    }
	    return true;
	  }

	
</script>
</html>
