export APP_VERSION?=v1.2.0

# for notifications:
# renovate: datasource=github-releases packageName=henrywhitaker3/adguard-exporter
export EXPORTER_VERSION?=v1.1.17


export COMPOSE_FILE := ./compose.yml


compile:
	CGO_ENABLED=0 go build -o ./bin/adguard-exporter main.go
.PHONY: compile

# local build
build: PUSH=
build: PULL=--pull
build: compile
	docker compose build $(PULL) $(PUSH)
.PHONY: build

# build with github actions
ci-build: compile
	docker compose build --pull
.PHONY: ci-build
