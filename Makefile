.PHONY: build dist

PLATFORMS = linux/amd64,linux/arm/v7
TAG = $(DOCKER_REGISTRY)rhasspy/julius:4.5

all: build

build:
	docker buildx build . --platform $(PLATFORMS) --tag $(TAG) --push

dist:
	./create-dists.sh $(PLATFORMS) $(TAG)
