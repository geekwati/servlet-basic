echo off
@rem to delete class files from classes folder
set tPath=WEB-INF\classes\
del %tPath%\*.class /s /q 
del MySessionCheck.war /s /q


rem create class files in classes folder


javac  -cp .;./WEB-INF/lib/servlet-api.jar;  -d  %tPath% src/com/example/web/*.java
rem -source 1.4
rem src/com/example/model/*.java


jar -cvf MySessionCheck.war *
rem F:\project\WebApps\Factorial\src>javac -d ../classes/ com/example/model/TestCases.java
rem F:\project\WebApps\Factorial\src>cd..

rem F:\project\WebApps\Factorial>cd classes

rem F:\project\WebApps\Factorial\classes>java com/example/model/TestCases
