build:
	@docker-compose -p blog build
	@docker-compose -p blog pull mysqldb
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

