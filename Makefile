build:
	@docker-compose -p blog build
	@docker-compose -p blog pull mysqldb
restart:
	@docker-compose restart blog
run:
	@docker-compose -p blog up -d
stop:
	@docker-compose -p blog stop
clean:	stop
	@docker-compose -p blog rm blog
clean-data: clean
	@docker-compose -p blog rm -v mysqldb
clean-images:
	@docker rmi `docker images -q -f "dangling=true"`
nuke-images:
	@docker image prune -af
