
build:
	docker build . -t justmiles/dev-sandbox

push: build
	docker push justmiles/dev-sandbox

run:
	docker run --rm -d --name dev-sandbox -v $$PWD:/home/sandbox/workspaces -p 8080:8080 justmiles/dev-sandbox
