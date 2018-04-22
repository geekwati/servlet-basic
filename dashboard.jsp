<html>
<head>
	<title>Login</title>
	<link rel="stylesheet" href=".\bootstrap-3.3.7-dist\css\bootstrap.min.css">
</head>
<body>
	<div class="row">
		<div class="col-sm-2 col-sm-offset-8">
			<div>
				<%
					String userName=""+session.getAttribute("userName");
					System.out.println("user in dashboard session  "+userName);
				%>
				<h4>Hello! <%= userName %></h4>
			</div>
		</div>
		<div class="col-sm-1">
			<div>
				<h4><a class="btn btn-primary" id="logout" href="./logout">Logout</a></h4>
			</div>
		</div>
	</div>
</body>
</html>