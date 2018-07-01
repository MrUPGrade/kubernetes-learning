WORKSPACE:=$(shell pwd)

PIP=pip

TAG=latest
KTA_IMAGE_NAME_FLASK=mrupgrade/kta-webapp-flask:$(TAG)
KTA_IMAGE_NAME_GUNICORN=mrupgrade/kta-webapp-gunicorn:$(TAG)


D=docker
RM=rm -Rfv
DOCKER_EVAL=eval $(minikube docker-env);



clean:
	$(RM) *.log

pip-install:
	${PIP} install --upgrade -r requirements.txt
	${PIP} install --upgrade -r kta/requirements.txt


env-dev-up:
	minikube start --cpus 2 --disk-size 40000MB --memory 4096 #--kubernetes-version 1.10.4
	helm init

env-dev-down:
	-minikube delete

env-dev-setup: env-dev-down env-dev-up



debug:
	@echo workspace: $(WORKSPACE)

docker-kta-build-flask:
	$(D) build -t $(KTA_IMAGE_NAME_FLASK) -f ${WORKSPACE}/kta/flask.Dockerfile $(WORKSPACE)/kta/

docker-kta-build-gunicorn:
	$(D) build -t $(KTA_IMAGE_NAME_GUNICORN) -f ${WORKSPACE}/kta/gunicorn.Dockerfile $(WORKSPACE)/kta/

docker-kta-build: docker-kta-build-flask docker-kta-build-gunicorn

docker-kta-push:
	$(D) push $(KTA_IMAGE_NAME_FLASK)
	$(D) push $(KTA_IMAGE_NAME_GUNICORN)



mk-endpoints:
	minikube service list

k8s-kta-pod-run:
	kubectl run kta --image $(KTA_IMAGE_NAME) --port=8080
	kubectl expose deployment kta --type=LoadBalancer

k8s-apply:
	kubectl apply -f k8s/db.yaml
	kubectl apply -f k8s/app.yaml
