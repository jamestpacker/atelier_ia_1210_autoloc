.PHONY: dev test migrate seed lint clean logs

dev:
	docker compose up

test:
	docker compose exec -T backend python -m pytest
	docker compose exec -T frontend npm run test -- --run

migrate:
	docker compose exec -T backend python -m flask --app app db upgrade

seed:
	docker compose exec -T backend python -m flask --app app seed

lint:
	docker compose exec -T backend ruff check .
	docker compose exec -T frontend npm run lint

# Stops containers but keeps named database/cache volumes intact.
clean:
	docker compose down --remove-orphans

logs:
	docker compose logs --follow
