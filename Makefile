PROJECT  ?= kr1sp1n/docker-rails-blog
TAG      ?= latest

DOCKER_EMAIL ?= fake@example.com
DOCKER_USER ?= fake_user
DOCKER_PASS ?= fake_password
DOCKER_TAG=$(PROJECT):$(CIRCLE_SHA1)

ifdef REGISTRY
	IMAGE=$(REGISTRY)/$(PROJECT):$(TAG)
else
	IMAGE=$(PROJECT):$(TAG)
endif

all:
	@echo "Available targets:"
	@echo "  * build - build a Docker image for $(IMAGE)"
	@echo "  * pull  - pull $(IMAGE)"
	@echo "  * push  - push $(IMAGE)"
	@echo "  * test  - build and test $(IMAGE)"

install:
	# no need to install anything here

build: Dockerfile
	docker build -t $(IMAGE) .

pull:
	docker pull $(IMAGE) || true

push:
	docker push $(IMAGE)

test: build
	docker-compose run -e RAILS_ENV=test app rspec

deploy:
	docker login -e $(DOCKER_EMAIL) -u $(DOCKER_USER) -p $(DOCKER_PASS)
	docker push $(IMAGE)
	docker tag $(IMAGE) $(DOCKER_TAG)
	docker push $(DOCKER_TAG)
	curl -X POST -d "" $(DEPLOY_HOOK_STAGING)
