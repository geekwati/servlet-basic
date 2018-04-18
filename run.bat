echo off
@rem to delete class files from classes folder
set tPath=WEB-INF\classes\
del %tPath%\*.class /s /q 



rem create class files in classes folder


javac  -cp .;./WEB-INF/lib/servlet-api.jar;  -d  %tPath% src/com/example/web/*.java src/com/example/model/*.java 

jar -cvf ListenerTest.war *