WORKSPACE:=$(shell pwd)

D=docker

TAG=1

KTA_IMAGE_NAME=mrupgrade/kta:$(TAG)

debug:
	@echo workspace: $(WORKSPACE)


docker-kta-build:
	$(D) build -t $(KTA_IMAGE_NAME) $(WORKSPACE)/kta/

docker-kta-push:
	@echo test


k8s-kta-run:
	kubectl run kta --image $(KTA_IMAGE_NAME) --port=8080
	kubectl expose deployment kta --type=LoadBalancer
	#--type=NodePort

k8x-kta-delete:
	kubectl