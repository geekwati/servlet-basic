<%@ page import="org.myemail.domain.*,org.myemail.service.*,java.util.*" %>

<html>
<head>
	<title>DashBoard</title>
	<link rel="stylesheet" href=".\bootstrap-3.3.7-dist\css\bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="dashboard.js"></script>
	<script src="jquery-3.3.1.js"></script>
	<style type="text/css">
	.subject{
		max-width: 100px;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
	.labelborder{
		border-style: none;
	}
	.alert {
  		display:inline-block;
	}
	</style>
</head>
<body class="well"> 

	<!-- Nav Bar -->

	<nav class="navbar  navbar-inverse ">
		<div class="container-fluid">

			<ul class="nav navbar-nav  navbar-right">
				<%
					if(session.getAttribute("user")==null){
						out.println("out of user");
				%>
						<jsp:forward page="index.jsp" />
				<%	}
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
			
			<div style="margin-bottom: 20px;padding: 5px"><button type="button" class=" btn btn-info btn-lg btn-block" id="compose">Compose</button></div>

			<ul class="nav nav-pills nav-stacked">
				
				<li id="inbox" class="active"><a class="getmsg" msgtype="INBOX"><strong>Inbox</strong></a></li>
				<li id="outbox" class=""><a class="getmsg" msgtype="OUTBOX"><strong>Outbox</strong></a></li>

			</ul>
		</div>

		<!-- Messages -->
		<div class="col-sm-10" style="background-color:white;height:480px	;overflow-y: scroll;border-left: 2px solid grey;">
			<div id="msg-list">
				<% Object messageStatus=session.getAttribute("message-status");

				if(messageStatus!=null) {
			%>
					<strong><%= (String)messageStatus %></strong>
					
			<% 
				session.removeAttribute("message-status");
				} %>
				<jsp:include page="./getmessage?box=INBOX"/>
			</div>

		</div>
	</div>

	<!-- Pager -->
	<div class="col-sm-offset-5 col-sm-3" id="pagination">
		<ul class="pager">
			<li><a href="#">Previous</a></li>
			<li><a href="#">Next</a></li>
		</ul>
	</div>	
</body>
</html>