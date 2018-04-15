In this application, 
when a user first enters,application creates its session using 
HttpSession session=request.getSession();
then application asks for user name and remember user in session attribute
then asks for favorite color, after this print a message 
then provide two option to user for:
back : ask color for login user and again print msg 
logout: means app invalidate the user session.
If user does not click on logout its session remains in cookies(server and browser both). if he enters into webapp again then it will print its name and color msg.