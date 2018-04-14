I write code of response in service() and doGet and doPost also have out.prntln()
 then what happens
Only service method code runs here 
because we override the containers service method


we know button click sends a get request but what happen when we don't give doGet() to the respective url
then an error at run time comes which is
HTTP Status 405 - HTTP method GET is not supported by this URL
type Status report

message HTTP method GET is not supported by this URL

description The specified HTTP method is not allowed for the requested resource.
