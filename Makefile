postgres:
	docker run --name mypostgres -p 5432:5432 -e POSTGRES_USER=atharv -e POSTGRES_PASSWORD = secret -d postgres:17rc1-alpine

createdb:
	docker exec -it mypostgres createdb --username=atharv --owner=atharv simple_bank

dropdb:
	docker exec -it mypostgres dropdb simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://atharv:secret@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://atharv:secret@localhost:5432/simple_bank?sslmode=disable" -verbose down

.PHONY: postgres createdb dropdbc migrateup migratedown