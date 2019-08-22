<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="com.nagarro.restapp.models.Flights"%>
<%@ page import="com.nagarro.restapp.models.User"%>





<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Search Page</title>
</head>
<script type="text/javascript">
	var msg = '${sessionScope.authorized}';
	console.log(msg);
	if (msg === "false" || msg === "" || msg === null) {
		console.log(msg)
		window.location.href = "/RestApp";
<%session.removeAttribute("authorized");%>
	}
</script>
<body>
	<jsp:include page="header.jsp" />


	<div class="container-fluid" style="margin-top: 30px">

		<button type="button" class="btn btn-danger"
			onclick="$('#myModal').modal('show');$('#editIDdiv').hide();"
			style="float: right" data-dismiss="modal">Add New Employee</button>
		&nbsp;&nbsp;
		
  <button type="button" class="btn btn-info"
			style="float: right" onclick="download()"  data-dismiss="modal">Download  Employee Details Details</button>
		&nbsp;&nbsp;
		
		<button type="button" class="btn btn-success"
			onclick="$('#bulk').modal('show');$('#editIDdiv').hide();"
			style="float: right" data-dismiss="modal">Upload Employee
			Details</button>

		<div class="col">
			<div class="modal fade" id="bulk" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="padding: 35px 50px;">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4>
								<span class="glyphicon glyphicon-lock"></span> Bulk Upload
								Utility
							</h4>
						</div>
						<div class="modal-body" style="padding: 40px 50px;">
							<form role="form" onsubmit="bulkUpload()">
								<div class="form-group">
									<label for="psw"><span
										class="glyphicon glyphicon-eye-open"></span> Select File </label> <input
										type="file" accept=".csv"  class="form-control"
										id="bulkfile" required>
								</div>
								<span id="bulkalert"> </span>
								<div class="modal-footer container-fluid">
									<div class="row">
										<button type="submit" 
											class=" col-6 btn btn-success btn-block">
											<span class="glyphicon glyphicon-off"></span> Bulk Upload
										</button>
										<button type="button" class=" col-6 btn btn-danger btn-block "
											class="close" data-dismiss="modal">
											<span class="glyphicon glyphicon-off"></span> Cancel
										</button>
									</div>
								</div>


							</form>
						</div>

					</div>

				</div>
			</div>

			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="padding: 35px 50px;">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4>
								<span class="glyphicon glyphicon-lock"></span> User
							</h4>
						</div>
						<div class="modal-body" style="padding: 40px 50px;">
							<form role="form" onsubmit="save()">
								<div class="form-group" id="editIDdiv">
									<label for="psw"><span
										class="glyphicon glyphicon-eye-open"></span> ID </label> <input
										type="text" class="form-control" disabled id="editId"
										placeholder="Enter password">
								</div>
								<div class="form-group">
									<label for="usrname"><span
										class="glyphicon glyphicon-user"></span> Name</label> <input
										type="text" class="form-control" required id="editName" maxlength=100
										placeholder="Enter NAme">
								</div>
								<div class="form-group">
									<label for="psw"><span
										class="glyphicon glyphicon-eye-open"></span> Email</label> <input
										type="email" class="form-control" required id="editEmail" maxlength=100
										placeholder="Enter EMail">
								</div>
								<div class="form-group">
									<label for="psw"><span
										class="glyphicon glyphicon-eye-open"></span> Location</label> <input
										type="text" class="form-control" id="editLocation"
										maxlength=500 required placeholder="Enter Location">
								</div>
								<div class="form-group">
									<label for="psw"><span
										class="glyphicon glyphicon-eye-open"></span> DOB</label> <input
										type="date" class="form-control" id="editDOB"
										placeholder="Enter password" required>
								</div>
								<div class="modal-footer container-fluid">
									<div class="row">
										<button type="submit" 
											class=" col-6 btn btn-success btn-block">
												 Save
										</button>
										<button type="button" class=" col-6 btn btn-danger btn-block "
											class="close" data-dismiss="modal">
											<span class="glyphicon glyphicon-off"></span> Cancel
										</button>
									</div>
								</div>


							</form>
						</div>

					</div>

				</div>
			</div>
		</div>
		<table class="table" id="usertable">
			<thead class="thead-dark">
				<tr>
					<th scope="col">ID</th>

					<th scope="col">Name</th>
					<th scope="col">Email</th>
					<th scope="col">Location</th>

					<th scope="col">DOB</th>
					<th scope="col">Options</th>




				</tr>
			</thead>
			<tbody>

			</tbody>
		</table>


	</div>
	</div>
	<script>
		var baseurl = "http://localhost:3000/RestApp/rest/Users/";

		function loadall() {
			console.log("loadcallled");
			$
					.ajax({
						url : baseurl + 'getallusers',
						type : "GET",
						beforeSend : function() {
							//  $('#current_page').append("loading..");
						},
						success : function(data) {
							$('#usertable > tbody')[0].innerHTML = "";

							JSON
									.parse(data)
									.forEach(
											function(element) {
												$('#usertable > tbody')
														.append(
																'<tr><td>'
																		+ element['Id']
																		+ '</td><td>'
																		+ element['Name']
																		+ '</td><td>'
																		+ element['Email']
																		+ '</td><td>'
																		+ element['Location']
																		+ '</td><td>'
																		+ element['DOB']
																		+ '</td><td><button class="btn btn-success" onclick="edit('
																		+ element['Id']
																		+ ')" >Edit</button </td>&nbsp;<button class="btn btn-danger" onclick="delet('
																		+ element['Id']
																		+ ')" >Delete</button </td> </tr>');
											})
						}
					});

		}

		function edit(id) {
			console.log($('#myModal'));
			$('#myModal').modal('show');
			$.ajax({
				url : baseurl + 'getuser?id=' + id,
				type : "GET",
				beforeSend : function() {
					//  $('#current_page').append("loading..");
				},
				success : function(data) {

					var data = JSON.parse(data);
					console.log(data[0]['Id']);
					console.log($('#editId'))
					$('#editId').val(data[0]['Id']);
					$('#editName').val(data[0]['Name']);
					$('#editEmail').val(data[0]['Email']);
					$('#editLocation').val(data[0]['Location']);
					$('#editDOB').val(data[0]['DOB'])

				}
			});

		}

		function bulkUpload() {

			if ($('#bulkfile').val() === ""
					|| $('#bulkfile').val() === undefined) {
				$("#bulkalert").text("Please select a file to Upload");
				return;
			} else {
				var data = new FormData();
				data.append("file", $("#bulkfile").prop('files')[0]);
				$.ajax({
					url : baseurl + "upload",
					type : "POST",
					data : data,
					processData : false,
					contentType : false,
					success : function(result) {
						console.log(result);
						alert("User Added");
						$('#bulk').modal('hide');
						loadall();

					},
					error : function(result) {
						alert("Error: " + result)
					}

				});
			}
		}

		function delet(id) {
			$.ajax({
				url : baseurl + 'deleteuser?id=' + id,
				type : "DELETE",
				beforeSend : function() {
					//  $('#current_page').append("loading..");
				},
				success : function(data) {
					console.log(data)
					loadall();
				}
			});

		}

		function save() {
			let url = "";
			if ($('#editId').val() === "") {
				url = baseurl + 'createuser?Email=' + $('#editEmail').val()
						+ '&Name=' + $('#editName').val() + '&Location='
						+ $('#editLocation').val() + '&DOB='
						+ $('#editDOB').val();
				type = "GET"
			} else {
				url = baseurl + 'edituser?id=' + $('#editId').val() + '&Email='
						+ $('#editEmail').val() + '&Name='
						+ $('#editName').val() + '&Location='
						+ $('#editLocation').val() + '&DOB='
						+ $('#editDOB').val();
				type = "PUT"

			}
			$.ajax({
				url : url,
				type : type,
				beforeSend : function() {
					//  $('#current_page').append("loading..");
				},
				success : function(data) {
					console.log(data);
					$('#myModal').modal('hide');

					loadall();
				}
			});

		}
		
		function download() {
			window.open(baseurl+'downloadCSV', '_blank');
		}

		$(document).ready(function() {
			loadall();
			
			
		});
		$('#myModal').on('hidden.bs.modal', function(){
			$('#myModal input').val("");
		});
	</script>
		<jsp:include page="footer.jsp" />
	
</body>
</html>