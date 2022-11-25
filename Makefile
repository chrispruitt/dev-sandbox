
build:
	docker build . -t chrispruitt/dev-sandbox

push: build
	docker push chrispruitt/dev-sandbox

run:
	docker run --rm -d --name dev-sandbox -v $$PWD:/home/sandbox/workspaces -p 8080:8080 chrispruitt/dev-sandbox

run-shell:
	docker run --rm -it --name dev-sandbox -v $$PWD:/home/sandbox/workspaces --entrypoint zsh chrispruitt/dev-sandbox
