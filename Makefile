.PHONY: build
build:
	sudo docker build -t cuda_gl_on_docker .

.PHONY: run
run:
	xhost + local:root
	sudo docker run -it \
    --network=host \
	--env=DISPLAY=$(DISPLAY) \
	--env=QT_X11_NO_MITSHM=1 \
	--privileged \
	--gpus all \
	--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	 cuda_gl_on_docker /bin/bash