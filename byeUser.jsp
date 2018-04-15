
<html>
<head>
	<title>Bye</title>
	<!-- <link rel="stylesheet" href="mystyle.css"> -->
</head>
<body>
	<%
	
	String color=(String)session.getAttribute("color");
	String name=(String)session.getAttribute("name");
	out.println("Hello "+name);
	out.println("you like "+color+" !");
	
	%>
	<input type="button" value="LogOut" onclick="window.location.href='./logout.do'">
	<input type="button" value="Back" onclick="window.location.href='oldUser.jsp'">
	
</body>
</html>