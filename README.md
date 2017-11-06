## tornado-blog

Modified Tornado blog example with bootstrap and markdown support.

Working example can be seen @ https://sqweeb.net

Pre-built docker container @ https://hub.docker.com/r/mikeder/tornado-blog/

__Running the container:__

With docker-compose (w/ MySQL container):

```bash
docker-compose up -d
```

With external MySQL database:

```bash
docker pull mikeder/tornado-blog
docker run -d -e MYSQL_USER={{yourDbUser}} -e MYSQL_PASSWORD={{yourDbPassword}} -e MYSQL_HOST={{yourDbHost}} -p 8000:8000 mikeder/tornado-blog
```


### TODO:

* Convert blog into module
* General server to handle all modules
* Admin page to handle load/unload of modules
* Ability to delete or hide posts
* Create modules for gallery, dht graphs, etc.