<%@ page import="org.myemail.domain.Message,java.util.*" %>

	<table id="msgtable" class="table table-hover table-striped">
		<tbody>
			<%
				List<Message> msgList = (List<Message>)request.getAttribute("msgList");
							
				for(Message msg : msgList) {
				String msgType= request.getParameter("box").equals("INBOX")? "INBOX":"OUTBOX";
				String mid=""+msg.mId;	
			%>
					<tr class= "show-msg" mid="<%= mid %>" msgtype="<%= msgType%>"> 
						
						<td class="col-sm-2"><%= msgType.equals("INBOX")? msg.fromUserName:"To: "+msg.toUserName%></td>
						<td class="col-sm-7 subject"><strong><%= msg.mSubject%></strong> - <%= msg.mBody %></a></td>
						<td class="col-sm-3"><%= msg.dateTime%></td>
					</tr>
			<% 
				}	
			%>
		</tbody>
	</table>
