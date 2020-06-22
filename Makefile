CONTAINER_NAME:=baity2-api_web_1
dev:
	docker-sync start
	docker-compose up -d

resync:
	docker-sync clean
	docker-sync start
down:
	docker-compose down
	docker-sync clean

restart:
	docker-compose restart

shell:
	docker-compose exec web /bin/bash

attach:
	docker attach ${CONTAINER_NAME}

rails-test:
	docker-compose exec web bin/bundle exec rspec
	docker-compose exec web bin/rails test

fmt:
	docker-compose exec web bin/rubocop -a

update-bank-local:
	docker-compose exec web bin/bundle update zengin_code
	docker-compose exec web bin/rake bank_seed:execute

update-bank:
	bundle update zengin_code
	rake bank_seed:execute