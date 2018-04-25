<%@ page import="org.myemail.domain.*,java.util.*" %>

<html>
<head>
	<title>Login</title>
	<link rel="stylesheet" href=".\bootstrap-3.3.7-dist\css\bootstrap.min.css">
	<style type="text/css">
	.subject{
		max-width: 100px;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
</style>
</style>
<script src="jquery-3.3.1.js"></script>
<script>
	$(document).on('click', '.getmsg', function () {
		var type=$(this).attr('msgtype');
		$.get("getmessage?box="+type,function(responseText) {   
			$("#msg-list").html(responseText); 
		});
	});

</script>
</head>
<body class="well"> 

	<!-- Nav Bar -->

	<nav class="navbar  navbar-inverse ">
		<div class="container-fluid">

			<ul class="nav navbar-nav  navbar-right">
				<%
					String userName=((MailUser)session.getAttribute("user")).userName;
				%>
				<li class="active"><a href="#">Hello <%= userName%>!</a></li>
				<li><a href="./logout"> Logout</a></li>
			</ul>
		</div>
	</nav>

	<!-- Main Content -->
	<div class="row">

		<!-- Menu Bar -->
		<div class="col-sm-2">
			
			<div style="margin-bottom: 20px;padding: 5px"><button type="button" class=" btn btn-info btn-lg btn-block" >Compose</button></div>

			<ul class="nav nav-pills nav-stacked">
				
				<li class="active"><a class="getmsg" msgtype="inbox"><strong>Inbox</strong></a></li>
				<li><a class="getmsg" msgtype="sentBox"><strong>Outbox</strong></a></li>

			</ul>
		</div>

		<!-- Messages -->
		<div class="col-sm-10" style="background-color:white;height:480px	;overflow-y: scroll;border-left: 2px solid grey;">
			<div id="msg-list">
				<jsp:include page="./getmessage?box=inbox"/>
			</div>

		</div>
	</div>

	<!-- Pager -->
	<div class="col-sm-offset-5 col-sm-3">
		<ul class="pager">
			<li><a href="#">Previous</a></li>
			<li><a href="#">Next</a></li>
		</ul>
	</div>	
</body>
</html>