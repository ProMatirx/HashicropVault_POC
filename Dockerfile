FROM muralidevops18/dummy
MAINTAINER Murali
RUN apt-get update -y
RUN  apt-get install wget -y
WORKDIR /usr/local/tomcat/webapps
RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war
#RUN wget https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.warr
EXPOSE 8080
CMD ["catalina.sh","run"]
