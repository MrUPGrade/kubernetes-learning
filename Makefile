WORKSPACE:=$(shell pwd)

TAG=latest
KTA_IMAGE_NAME=mrupgrade/kta:$(TAG)

D=docker
RM=rm -Rfv
DE=eval $(minikube docker-env);


clean:
	$(RM) *.log


debug:
	@echo workspace: $(WORKSPACE)


docker-kta-build:
	$(D) build -t $(KTA_IMAGE_NAME) $(WORKSPACE)/kta/

docker-kta-push:
	$(D) push $(KTA_IMAGE_NAME)


k8s-endpoints:
	minikube service list

k8s-kta-pod-run:
	kubectl run kta --image $(KTA_IMAGE_NAME) --port=8080
	kubectl expose deployment kta --type=LoadBalancer
