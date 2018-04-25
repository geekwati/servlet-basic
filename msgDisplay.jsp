<%@ page import="org.myemail.domain.Message,java.util.*" %>

	<table class="table table-hover table-striped">
		<tbody>
			<%

			List<Message> msgList = (List<Message>)request.getAttribute("msgList");
			String userTypeToShow=null;
			if(request.getParameter("box").equals("in"))
				userTypeToShow="from";
			else
				userTypeToShow="to";
			for(Message msg : msgList) {
			%>
			<tr>
				<td class="col-sm-2"><%= msg.mSubject%></td>
				<td class="col-sm-8 subject"><%= msg.mBody%></td>
				<td><%= msg.dateTime%></td>
			</tr>
			<%}
			%>


		</tbody>
	</table>
