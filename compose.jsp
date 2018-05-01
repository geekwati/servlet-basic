<%@ page import="org.myemail.domain.*,java.util.*" %>
<form class="form-horizontal">
	<% Object messageStatus=session.getAttribute("message-status");
		Integer toUserId=0;
		String subject="";
		String body="";
		if(messageStatus!=null) {
			toUserId=Integer.parseInt(request.getParameter("toUserId"));
			subject=request.getParameter("subject");
			body=request.getParameter("body");
		}
		session.removeAttribute("message-status");
		/*request.removeAttribute("subject");
		request.removeAttribute("body");
		request.removeAttribute("toUserId");*/
	%>
	

	<!-- To user Name -->
	<div class="form-group">
		<label  class="control-label col-sm-2 col-sm-offset-1"  for="to">To:</label>
		<div class="col-sm-8"><select class="form-control" id="toUserName" name="toUserName">
        
        	<%
				List<MailUser> recipientList = (List<MailUser>)request.getAttribute("recipientList");

			%>
			<%	
				for(MailUser recipientUser : recipientList) {	
			%>
					<option id="<%= recipientUser.userId%>" <%= (recipientUser.userId==toUserId)?"selected":""%>><%= recipientUser.userName%></option>
			<%
				}
			%>
			</select>
		</div>
	</div>

		<!-- Subject of Message -->
	<div class="form-group">
		<label  class="control-label col-sm-2 col-sm-offset-1"  for="subject">Subject:</label>
		<div class="col-sm-8"><input type="text" class="form-control" id="subject" name="subject" placeholder="Subject" value="<%= subject%>">
			
		</div>
	</div>
		<!-- Body of Message -->
	<div class="form-group">
		<label  class="control-label col-sm-2 col-sm-offset-1"  for="body">Body:</label>
		<div class="col-sm-8">
			<textarea class="form-control" rows="5" id="body" name="body" value="<%= body%>"></textarea>
			
		</div>
	</div>
	<div class="form-group"> 
		<div class="col-sm-offset-3 col-sm-9">
			<button type="button" class="btn btn-default" id="send-email">Submit</button>
		</div>
	</div>
</form>