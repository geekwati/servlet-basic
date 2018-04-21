echo off
@rem to delete class files from classes folder
set tPath=WEB-INF\classes\
del %tPath%\*.class /s /q 



rem create class files in WEB-INF\classes folder


javac  -cp .;./WEB-INF/lib/servlet-api.jar;./WEB-INF/lib/emailserver.jar  -d  %tPath% src/com/example/web/*.java 


