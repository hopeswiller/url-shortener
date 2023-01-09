build-dev:
	echo "Building development image..."
	docker rmi -f elment/urlshortener-dev
	docker compose -f docker-compose.debug.yml build

build:
	echo "Building image..."
	docker compose -f docker-compose.yml build

# run-dev:
# 	echo "Starting service..."
#     docker compose -f docker-compose.debug.yml up

run:
	echo "Starting service..."
    docker compose up

# remove:
# 	echo "Stopping service"
#     docker compose -f docker-compose.debug.yml down 
