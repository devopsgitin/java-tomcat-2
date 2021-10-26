FROM tomcat:8-alpine
COPY target/hello-world-war-1.0.0.war /usr/local/tomcat/webapps/myapp1.war
EXPOSE 8080