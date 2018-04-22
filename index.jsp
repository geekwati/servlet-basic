 
<html>
<head>
	<title>Login</title>
	<link rel="stylesheet" href=".\bootstrap-3.3.7-dist\css\bootstrap.min.css">
</head>

<body class="well">
	<!-- check whether authenticated user exist -->
	<% session=request.getSession();
	if(session.getAttribute("userName")!=null){
			response.sendRedirect("./dashboard");
	}%>
	<div style="margin-top:10%"></div>
	


	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-default ">
					<div class="panel-body">

						<h1 class="text-center"> <strong>Welcome to Email App</strong> </h1>

						<div style="margin-top:8%"></div>
						<!-- Form -->
						<form class="form-horizontal" action="./login" method="post">
							<!-- Error Handling -->
							<% Object error=request.getAttribute("error");

							if(error!=null) {
							%>
							<div class="form-group">
								<div class="col-sm-offset-3 text-danger">
								<strong><%= error %></strong>
								</div>
							</div>
							<% } %>
							
							<!-- Username -->
							<div class="form-group">
								<label  class="control-label col-sm-2 col-sm-offset-1"  for="name">Name:</label>
								<div class="col-sm-8"><input type="text" class="form-control" id="name" name="name" placeholder="Enter Name"></div>
							</div>

							<!-- Password -->
							<div class="form-group">
								<label  class="control-label col-sm-2 col-sm-offset-1"  for="pwd">Password:</label>
								<div class="col-sm-8"><input type="password" class="form-control" id="pwd" name="pwd" placeholder="Enter Password"></div>
							</div>

							<div class="form-group"> 
								<div class="col-sm-offset-3  col-sm-9">
									<div class="checkbox">
										<label><input type="checkbox" name="remember">Remember me</label>
									</div>
								</div>
							</div>
							<div class="form-group"> 
								<div class="col-sm-offset-3 col-sm-9">
									<button type="submit" class="btn btn-default">Submit</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
