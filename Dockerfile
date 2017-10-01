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
    INSTALL_PATH=/app \
    PYTHONPATH=/usr/local/lib/python2.7/site-packages/:$INSTALL_PATH \
    BUILD_PACKAGES="build-essential" \
    DEV_PACKAGES="python-dev libldap2-dev libsasl2-dev libcurl4-openssl-dev libmysqlclient-dev libssl-dev libffi-dev"

RUN apt-get update
RUN apt-get install -y -qq $BUILD_PACKAGES $DEV_PACKAGES
RUN mkdir -p $INSTALL_PATH
COPY . $INSTALL_PATH
RUN cd $INSTALL_PATH && \
    rm -rf .git .gitignore && \
    pip install --no-cache-dir -r requirements.txt && \
    env | grep PYTHON >> /etc/environment

WORKDIR $INSTALL_PATH

EXPOSE ${port}
CMD ["python", "blog.py"]