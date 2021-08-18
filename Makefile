PROJECT  := infoblox/buildtool
PROJECT_APLINE  := infoblox/buildtool-alpine

.PHONY: all clean latest clean-alpine latest-alpine
all: latest


# Create the Docker image with the latest tag.
latest:
	docker build -t $(PROJECT):$@ buildtool


clean:
	docker rmi -f $(PROJECT):latest


latest-alpine:
	docker buildx build --platform linux/arm64  -t $(PROJECT_APLINE)-3.9:1.12-arm64 buildtool-alpine


clean-alpine:
	docker rmi -f $(PROJECT_APLINE)-3.9:1.12
