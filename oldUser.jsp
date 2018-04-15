
<html>
<head>
	<title>New</title>
	<!-- <link rel="stylesheet" href="mystyle.css"> -->
</head>
<body>
	<%
		
		String name=(String)session.getAttribute("name");
		out.println("Welcome!"+name);
	%>
	<form action="./usercolor.do">
  		Favorite color: <input type="text" name="color"><br>
  		<input type="submit" value="Submit">
	</form>
</body>
</html>