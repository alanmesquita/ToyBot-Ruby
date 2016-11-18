start:
	docker-compose run bot

test:
	docker-compose run bot bundler exec rspec spec
