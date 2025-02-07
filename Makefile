.PHONY: all generate git-add git-commit git-push

all: generate git-update



git-update: git-add git-commit git-push

generate:
	protoc -I proto proto/auth.proto --go_out=./gen --go_opt=paths=source_relative --go-grpc_out=./gen --go-grpc_opt=paths=source_relative
git-add:
	git add .
git-commit:
	git commit -m "Generate protobuf files"

git-push:
	git push -u origin main
