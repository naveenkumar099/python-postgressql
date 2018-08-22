#Dockefile for creating a docker image : Ubuntu + Apache + Pyhton + Flask
#Commnet
FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y python python-pip wget gcc phantomjs 

RUN apt-get install -y xvfb

RUN apt-get install sudo 

RUN sudo apt install  -y apache2

RUN sudo apt install -y vim

RUN sudo pip install Flask

RUN sudo pip install psycopg2

#RUN pip install robotframework
#RUN pip install robotframework-sshlibrary
#RUN pip install robotframework-selenium2library
#RUN pip install Flask-SqlAlchemy
EXPOSE 4000

WORKDIR  /home

RUN  mkdir -pv /home/templates/

ADD app4.py /home
 
ADD index.html /home/templates

RUN mkdir -pv /home/static/

ADD style.css /home/static
ADD main.js /home/static

ENTRYPOINT ["/usr/bin/python", "app4.py"] 
#Added comment to checkin the file.
