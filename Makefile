# Form of a rule
# targets: prerequisites
#   commnand
#   commnand
#   commnand

# Variables
HOST_PORT=8080
CNTR_PORT=8000
TAG=v1.1
NAME=todo_app
REPO_HOST=281803258316.dkr.ecr.us-west-2.amazonaws.com
TAGGED_IMAGE=$(REPO_HOST):$(TAG)

.PHONY: hello
hello:
	@echo "Hello, World"
	@echo "This line will print if a file named 'hello' does not exist unless 'hello' is phony"

image: Dockerfile
	docker build --pull -t todo_app_test:latest .
	@echo "DONE"

run-app-local:
	docker run --detach --publish $(HOST_PORT):$(CNTR_PORT) --name $(NAME) todo_app_test:latest

run-app-prod:
	docker run --detach --publish $(HOST_PORT):$(CNTR_PORT) --name $(NAME) $(TAGGED_IMAGE)

exec-app:
	docker exec -it $(NAME) bash

stop-app:
	docker stop $(NAME)

rm-app:
	docker rm $(NAME)

ecr-login:
	aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin $(REPO_HOST)

ecr-logout:
	docker logout $(REPO_HOST)

prod-image: ecr-login image
	docker tag todo_app_test:$(TAG) $(TAGGED_IMAGE)
	docker push $(TAGGED_IMAGE)
	$(MAKE) ecr-logout

all:
	@echo ${USER}