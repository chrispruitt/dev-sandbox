
build:
	docker buildx build --platform=linux/amd64 . -t chrispruitt/dev-sandbox

push: build
	docker push chrispruitt/dev-sandbox

run:
	docker run --platform=linux/amd64 --rm -d --name dev-sandbox -v $$PWD:/home/sandbox/workspaces -p 8080:8080 chrispruitt/dev-sandbox

run-shell:
	docker run --platform=linux/amd64 --rm -it --name dev-sandbox -v $$PWD:/home/sandbox/workspaces --entrypoint zsh chrispruitt/dev-sandbox
