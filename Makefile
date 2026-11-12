## Install dependencies
install-dependencies:
	@docker run --rm -v "${PWD}:/app" -w /app composer:latest install