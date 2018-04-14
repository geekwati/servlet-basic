Lifecycle of Servlet
Generally we inherit Class HttpServlet in our servlet class. So that it can communicate with browser(client) through container(sever). HttpServlet class is inherited from 

java.lang.Object
  javax.servlet.GenericServlet
      javax.servlet.http.HttpServlet


And Implements Interfaces:
java.io.Serializable, Servlet, ServletConfig

Servlet interface has methods
void init(ServletConfig)
void destroy()
ServletConfig getServletConfig()
String getServletInfo()
 void service(ServletRequest, ServletResponse) 
GenericServlet class has methods
		
 void
destroy() 
          Called by the servlet container to indicate to a servlet that the servlet is being taken out of service.
 java.lang.String
getInitParameter(java.lang.String name) 
          Returns a String containing the value of the named initialization parameter, or null if the parameter does not exist.
 java.util.Enumeration
getInitParameterNames() 
          Returns the names of the servlet's initialization parameters as an Enumeration of String objects, or an empty Enumeration if the servlet has no initialization parameters.
 ServletConfig
getServletConfig() 
          Returns this servlet's ServletConfig object.
 ServletContext
getServletContext() 
          Returns a reference to the ServletContext in which this servlet is running.
 java.lang.String
getServletInfo() 
          Returns information about the servlet, such as author, version, and copyright.
 java.lang.String
getServletName() 
          Returns the name of this servlet instance.
 void
init() 
          A convenience method which can be overridden so that there's no need to call super.init(config).
 void
init(ServletConfig config) 
          Called by the servlet container to indicate to a servlet that the servlet is being placed into service.
 void
log(java.lang.String msg) 
          Writes the specified message to a servlet log file, prepended by the servlet's name.
 void
log(java.lang.String message, java.lang.Throwable t) 
          Writes an explanatory message and a stack trace for a given Throwable exception to the servlet log file, prepended by the servlet's name.
abstract  void
service(ServletRequest req, ServletResponse res) 
          Called by the servlet container to allow the servlet to respond to a request.
 HttpServlet class has methods
	
protected  void
doDelete(HttpServletRequest req, HttpServletResponse resp) 
          Called by the server (via the service method) to allow a servlet to handle a DELETE request.
protected  void
doGet(HttpServletRequest req, HttpServletResponse resp) 
          Called by the server (via the service method) to allow a servlet to handle a GET request.
protected  void
doHead(HttpServletRequest req, HttpServletResponse resp) 
          Receives an HTTP HEAD request from the protected service method and handles the request.
protected  void
doOptions(HttpServletRequest req, HttpServletResponse resp) 
          Called by the server (via the service method) to allow a servlet to handle a OPTIONS request.
protected  void
doPost(HttpServletRequest req, HttpServletResponse resp) 
          Called by the server (via the service method) to allow a servlet to handle a POST request.
protected  void
doPut(HttpServletRequest req, HttpServletResponse resp) 
          Called by the server (via the service method) to allow a servlet to handle a PUT request.
protected  void
doTrace(HttpServletRequest req, HttpServletResponse resp) 
          Called by the server (via the service method) to allow a servlet to handle a TRACE request.
protected  long
getLastModified(HttpServletRequest req) 
          Returns the time the HttpServletRequest object was last modified, in milliseconds since midnight January 1, 1970 GMT.
protected  void
service(HttpServletRequest req, HttpServletResponse resp) 
          Receives standard HTTP requests from the public service method and dispatches them to the doXXX methods defined in this class.
 void
service(ServletRequest req, ServletResponse res) 
          Dispatches client requests to the protected service method.
 

When we want to override init() of Genericservlet, it has two version of init()
	init(ServletConfig) and init() .
 if we override init(ServletConfig sconfig) then we have to call super.init(sconfig) otherwise we don’t get the servletconfig object that it bydefault recieved from the container(when containr calls this).
init()-A convenience method  is init(). Because when we override this we don’t need to call super.init(sconfig). We can get sconfig object using getServletConfig().
These methods are called one time in life of webApplication. But webcontainer call init() version calls before init(sconfig) version.
These methods called only once in the life of Servlet
Void service(req,res) and protected void service(req,res)
WebContainer uses service() to match the request with either of service doGet() or doPost().
Void service(req,res) is implementation of GenericServlet class service method and protected void service(req,res) is Http version of service method. WebContainer calls void service(req,res) when a request comes and then void service(req,res) internally calls protected version of service().
I.e. protected void service(req,res) receives standard HTTP requests from the public service method and dispatches them to the doXXX methods defined in this class. 
Generally no need to override any of service method. But if we override any of service() then its default behaviour lost and only code that is write in service() calls means request doesn’t goes to any of service doGet or doPost.
So if we override public service or protected service then we have to explicitly call its super version also (provided by HttpServlet class) by super.service(req,res).
And this method is called for each request individually.
doGet() and doPost()
These methods are override by user to do specific action on particular request. Protected service() calls one of them when a request comes by observing the nature(get or post) of request.these methods calls for each request
Public void destroy()
Called by the servlet container(WebContainer) to indicate to a servlet that the servlet is being taken out of service.we can override this method. This is called only once when webapp stops work. 
Servlet instance created  only once when webcontainer initialise the webapp and then each time a request comes webcontainer create a thread(takes from the Thread Pool) of servlet .
Use of init() methods we can do such things that are required by servlet before any request come i.e create database connection.
I write code of response in service() and doGet and doPost also have out.println()
 then what happens
Only service method code runs here 
because we override the containers service method


we know button click sends a get request but what happen when we don't give doGet() to the respective url
then an error at run time comes which is
HTTP Status 405 - HTTP method GET is not supported by this URL
type Status report

message HTTP method GET is not supported by this URL

description The specified HTTP method is not allowed for the requested resource.










