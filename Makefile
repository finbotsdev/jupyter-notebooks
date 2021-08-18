
APP_NAME ?= finbotsdev-jupyter-notebooks

.DEFAULT_GOAL := run

build:
	docker build -t ${APP_NAME} .

run: build
	docker run -it --rm \
		--name "$(APP_NAME)" \
		--publish 8888:8888 \
		--volume "$(shell pwd)/notebooks":/home/jovyan/ \
		$(APP_NAME)
