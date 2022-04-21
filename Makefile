VERSION := $(shell git rev-parse HEAD)
IMAGE = opklnm102/hello-node:$(VERSION)

.PHONY: clean
clean:
	rm -rf node_modules

.PHONY: deps
deps:
	npm install

.PHONY: run
run: deps
	node app.js

.PHONY: test
test:
	docker build --build-arg VERSION="$(VERSION)" \
                 -t $(IMAGE) -f ./Dockerfile --target test .

.PHONY: build-image
build-image:
	echo "build image... version=${VERSION}"
	docker build --build-arg VERSION="$(VERSION)" \
                 -t $(IMAGE) -f ./Dockerfile .

.PHONY: build-dev-image
build-dev-image:
	echo "build dev image... version=${VERSION}"
	docker build --build-arg VERSION="$(VERSION)" \
                 -t $(IMAGE) -f ./Dockerfile --target test .

.PHONY: push-image
push-image: build-image
	docker push $(IMAGE)

.PHONY: clean-image
clean-image:
	docker image rm -f $(IMAGE)

.PHONY: run-container
run-container:
	docker run -p 3000:3000 $(IMAGE)
