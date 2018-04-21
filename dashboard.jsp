<html>
	<body>
		<%
		
			String userName=""+session.getAttribute("userName");
			
			out.print("Hello !  "+userName);
			%>
	</body>
</html>