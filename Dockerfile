FROM tiangolo/uwsgi-nginx:python2.7

ENV DJANGODIR=/application

RUN mkdir $DJANGODIR
WORKDIR $DJANGODIR

RUN apt-get update

RUN apt-get install -y postgresql-client postgis 
RUN apt-get install -y xvfb libfontconfig wkhtmltopdf build-essential libssl-dev libffi-dev python-dev

RUN sed '/st_mysql_options options;/a unsigned int reconnect;' /usr/include/mysql/mysql.h -i.bkp

COPY ./requirements.txt $DJANGODIR/

RUN pip install -r requirements.txt