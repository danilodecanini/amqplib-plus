.PHONY: test

DC=docker-compose
DE=docker-compose exec -T app

# Run tests
test:
	$(DC) down
	$(DC) pull
	$(DC) up -d --force-recreate
	$(DE) sleep 5
	$(DE) yarn install
	$(DE) npm run build
	$(DE) npm test

fast-test:
	$(DE) npm run build
	$(DE) npm test

install:
	$(DE) yarn install