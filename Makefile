# defining a default value for the parameter KEYWORD passed to the entrypoint script
KEYWORD=FIXED

run: build
	docker run --rm keyword-release-action $(KEYWORD)

build:
	docker build --tag keyword-release-action .

test:
	./entrypoint.sh $(KEYWORD)
