<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">HR Management Portal </a>
		</div>
		
		<ul class="nav navbar-nav navbar-right">
			<li style="color: white"><a> Welcome ${sessionScope.user}</a></li>
			<li><a style="cursor: pointer"
				onclick="<%session.removeAttribute("authorized");session.removeAttribute("user");%>;window.location.href='/RestApp';
			"><span
					class="glyphicon glyphicon-log-in"></span> Logout</a></li>
		</ul>
	</div>
	</nav>