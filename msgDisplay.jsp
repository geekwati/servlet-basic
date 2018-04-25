<%@ page import="org.myemail.domain.Message,java.util.*" %>

	<table class="table table-hover table-striped">
		<tbody>
			<%
				List<Message> msgList = (List<Message>)request.getAttribute("msgList");
			%>
			
			<%				
				for(Message msg : msgList) {	
			%>
					<tr>

						<td class="col-sm-2"><%= request.getParameter("box").equals("INBOX")? msg.fromUserName:"To: "+msg.toUserName%></td>
						<td class="col-sm-7 subject"><strong><%= msg.mSubject%></strong> - <%= msg.mBody %></td>
						<td class="col-sm-3"><%= msg.dateTime%></td>
					</tr>
			<% 
				}	
			%>
		</tbody>
	</table>
