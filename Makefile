build:
	@docker-compose build blog
	@docker-compose pull mysqldb
restart:
	@docker-compose restart blog
run: build
	@docker-compose up -d
stop:
	@docker-compose down
clean:	stop
	@docker-compose rm blog
clean-data: clean
	@docker-compose rm -v mysqldb
clean-images:
	@docker rmi `docker images -q -f "dangling=true"`
nuke-images:
	@docker image prune -af
