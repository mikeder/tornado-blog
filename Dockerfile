FROM python:2.7

ARG port="8000"
ARG mysql_host="mysqldb"
ARG mysql_database="blog"
ARG mysql_user="root"
ARG mysql_password="root"

ENV PORT=${port} \
    MYSQL_HOST=${mysql_host} \
    MYSQL_DATABASE=${mysql_database} \
    MYSQL_USER=${mysql_user} \
    MYSQL_PASSWORD=${mysql_password} \
    INSTALL_PATH=/usr/src/app \
    PYTHONPATH=/usr/local/lib/python2.7/site-packages/:/usr/src/app \
    BUILD_PACKAGES="build-essential" \
    DEV_PACKAGES="python-dev libldap2-dev libsasl2-dev libcurl4-openssl-dev default-libmysqlclient-dev libssl-dev libffi-dev"

RUN apt-get update
RUN apt-get install -y -qq $BUILD_PACKAGES $DEV_PACKAGES
RUN mkdir -p $INSTALL_PATH
COPY . $INSTALL_PATH
WORKDIR $INSTALL_PATH
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE ${port}
CMD ["python", "blog.py"]
