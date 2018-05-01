<%@ page import="org.myemail.domain.*,java.util.*" %>
<form class="form-horizontal">
	<%
	Message msg= (Message)request.getAttribute("msg");
	String msgType= request.getParameter("msgtype");
	%>
	<!-- From user Name -->
	<div class="form-group">
		<label  class="control-label col-sm-2 col-sm-offset-1"  for="to">From:</label>
		<div class="col-sm-8"><label class="form-control labelborder" id="toUserName" name="toUserName">
			<%= msg.fromUserName%></label>
		</div>
	</div>

	<!-- To user Name -->
	<div class="form-group">
		<label  class="control-label col-sm-2 col-sm-offset-1"  for="to">To:</label>
		<div class="col-sm-8"><label class="form-control labelborder" id="toUserName" name="toUserName">
			<%= msg.toUserName%></label>
		</div>
	</div>

	<!-- Subject of Message -->
	<div class="form-group">
		<label  class="control-label col-sm-2 col-sm-offset-1"  for="subject">Subject:</label>
		<div class="col-sm-8"><label class="form-control labelborder" id="subject" name="subject" placeholder="Subject">
			<%= msg.mSubject%></label>
		</div>
	</div>
	<!-- Body of Message -->
	<div class="form-group">
		<label  class="control-label col-sm-2 col-sm-offset-1"  for="body">Body:</label>
		<div class="col-sm-8"><label class="form-control labelborder" rows="5" id="body" name="body">
			<%= msg.mBody%></label>
		</div>
	</div>
	
</form>