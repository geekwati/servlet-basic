with compose
	* build compose module that save a new message in database 
	* some work on GUI
		when we click on button like inbox, outbox and compose css class add-remove for highlighting
		pagination off for compose click
	* exception handling
		nullpointerexception : when we do multiple activities on dashboard to hit on database then connection was somehow lost. and without connection code try to hit on database that raise the nullpointerexception. for correction of this I made DBConnection class singleton to create connection
		classCastexception : when we recompile our code (servlet files) then this exception raise. because  session exists but session variable can't be cast into MailUser class
		to remove this two corrections  are done .
		1) I make a filter that run before some of servlets that invalidate session and redirect to root of app
		2) for each ajax call add a function for error that redirects the code to root of app