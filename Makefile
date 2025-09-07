# Variables
IMAGE_NAME = my-node-app
IMAGE_TAG = 1.0.0
PORT = 5000
CONTAINER_NAME = $(IMAGE_NAME)

.PHONY: help build run run-dev stop clean logs shell ps restart up default

## Show this help message
help:
	@echo ""
	@echo "Available commands:"
	@echo ""
	@echo "Development:"
	@echo "  make build     - Build Docker image"
	@echo "  make run       - Run container in background"
	@echo "  make run-dev   - Run container in foreground (dev mode)"
	@echo "  make up        - Build and run container (alias for build + run)"
	@echo ""
	@echo "Management:"
	@echo "  make stop      - Stop and remove container"
	@echo "  make restart   - Restart container"
	@echo "  make clean     - Clean up containers and images"
	@echo "  make ps        - Show running containers"
	@echo ""
	@echo "Debugging:"
	@echo "  make logs      - View container logs"
	@echo "  make shell     - Access container shell"
	@echo ""
	@echo "Info:"
	@echo "  make help      - Show this help message"
	@echo ""
	@echo "Configuration:"
	@echo "  Image: $(IMAGE_NAME):$(IMAGE_TAG)"
	@echo "  Port: $(PORT)"
	@echo "  Container: $(CONTAINER_NAME)"
	@echo ""

## Build the Docker image
build:
	@echo "Building Docker image..."
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .
	@echo "✓ Image built successfully: $(IMAGE_NAME):$(IMAGE_TAG)"

## Run the container in background
run:
	@echo "Starting container in background..."
	docker run -d -p $(PORT):5000 --name $(CONTAINER_NAME) $(IMAGE_NAME):$(IMAGE_TAG)
	@echo "✓ Container started on port $(PORT)"
	@echo "Run 'make logs' to view logs"

## Run container in foreground (development mode)
run-dev:
	@echo "Starting container in foreground..."
	@echo "Press Ctrl+C to stop the container"
	docker run -p $(PORT):5000 --name $(CONTAINER_NAME) $(IMAGE_NAME):$(IMAGE_TAG)

## Stop and remove the container
stop:
	@echo "Stopping container..."
	-docker stop $(CONTAINER_NAME) 2>/dev/null
	-docker rm $(CONTAINER_NAME) 2>/dev/null
	@echo "✓ Container stopped and removed"

## Clean up containers and images
clean:
	@echo "Cleaning up Docker resources..."
	-docker stop $(CONTAINER_NAME) 2>/dev/null
	-docker rm $(CONTAINER_NAME) 2>/dev/null
	-docker rmi $(IMAGE_NAME):$(IMAGE_TAG) 2>/dev/null
	@echo "✓ All resources cleaned up"

## View container logs
logs:
	@echo "Showing logs for container: $(CONTAINER_NAME)"
	@echo "Press Ctrl+C to exit"
	docker logs -f $(CONTAINER_NAME)

## Access container shell
shell:
	@echo "Accessing container shell..."
	docker exec -it $(CONTAINER_NAME) sh

## List running containers
ps:
	@echo "Running containers:"
	docker ps --filter "name=$(CONTAINER_NAME)"

## Restart the container
restart: stop run
	@echo "✓ Container restarted"

## Build and run in one command
up: build run
	@echo "✓ Application built and started"

## Default target (show help when just typing 'make')
default: help
