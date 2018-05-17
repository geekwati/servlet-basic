 
<html>
<head>
	<title>New User</title>
	<link rel="stylesheet" href=".\bootstrap-3.3.7-dist\css\bootstrap.min.css">
	<style type="text/css">
		.form-group.required .control-label:after {
			content:"*";
			color:red;
		}
	</style>
</head>

<body class="well">
	<!-- check whether authenticated user exist -->
	<% session=request.getSession();
	if(session.getAttribute("user")!=null){
	response.sendRedirect("./dashboard");
}%>
<div style="margin-top:10%"></div>



<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<div class="panel panel-default ">
				<div class="panel-body">

					<h1 class="text-center"> <strong>New User Form</strong> </h1>

					<div style="margin-top:8%"></div>
					<!-- Form -->
					<form class="form-horizontal" action="./create" method="post">
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
						<div class="form-group  required">
							<label  class="control-label col-sm-2 col-sm-offset-1"  for="name">Name:</label>
							<% String name=(error!=null)?request.getParameter("name"):"";
							String pwd=(error!=null)?request.getParameter("pwd"):"";
							String pno=(error!=null)?request.getParameter("pno"):"";
							String emailid=(error!=null)?request.getParameter("emailid"):"";
							request.removeAttribute("error");

							%> 
							<div class="col-sm-8"><input type="text" class="form-control" id="name" name="name"  required="required" placeholder="Enter Name" 
								value="<%= name %>">
							</div>
						</div>

						<!-- Password -->
						<div class="form-group required">
							<label  class="control-label col-sm-2 col-sm-offset-1"  for="pwd">Password:</label>
							<div class="col-sm-8"><input type="password" class="form-control" id="pwd" name="pwd"  required="required" placeholder="Enter Password" 
								value="<%= pwd %>"></div>
							</div>
						<!-- Phone No. -->
						<div class="form-group required">
							<label  class="control-label col-sm-2 col-sm-offset-1"  for="pno">Phone No.:</label>
							<div class="col-sm-8"><input type="text" class="form-control" id="pno" name="pno"  required="required" placeholder="Enter PhoneNo" 
								value="<%= pno %>"></div>
							</div>
						<!-- Email Id -->
						<div class="form-group required">
							<label  class="control-label col-sm-2 col-sm-offset-1"  for="emailid">Email Id</label>
							<div class="col-sm-8"><input type="email" class="form-control" id="emailid" name="emailid"  required="required" placeholder="Enter EmailId" 
								value="<%= emailid %>"></div>
							</div>

							
							<div class="form-group"> 
								<div class="col-sm-offset-3 col-sm-9">
									<button type="submit" class="btn btn-default">Create</button>
									<a href="index.jsp" class="btn btn-default">Login</a>
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
