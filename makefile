build:
	docker compose build

up:
	docker compose up ${q}

down:
	docker compose down

# node userとして bash を実行
bash:
	docker compose exec next-app gosu node bash

test:
	docker compose exec next-app gosu node npm run test

studio:
	docker compose exec next-app gosu node npx prisma studio

tsx:
	docker compose exec next-app gosu node npx tsx script/$(q).ts

db:
	docker compose exec db sh

dbreset:
	docker compose exec next-app gosu node npx prisma migrate reset

migrate:
	docker compose exec next-app gosu node npx prisma migrate dev

prigen:
	docker compose exec next-app gosu node npx prisma generate

prodbuild:
	docker compose -f docker-compose-prod.yml build

produp:
	docker compose -f docker-compose-prod.yml up

prodown:
	docker compose -f docker-compose-prod.yml down

.PHONY: build up down nextapp test ps tsx db migrate prodbuild produp prodown
