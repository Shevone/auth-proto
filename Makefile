.PHONY: all generate git-add git-commit git-push

all: generate-all git-add git-commit git-push

generate-all: generate-accounts generate-auth generate-training-admin generate-training-get generate-training-subscription generate-sub-notification

git-update: git-add git-commit git-push

generate-accounts:
	protoc -I proto proto/accounts/accounts.proto --go_out=./gen/go/ --go_opt=paths=source_relative --go-grpc_out=./gen/go/ --go-grpc_opt=paths=source_relative
generate-training-get:
	protoc -I proto proto/training-get/training-get.proto --go_out=./gen/go/ --go_opt=paths=source_relative --go-grpc_out=./gen/go/ --go-grpc_opt=paths=source_relative
generate-training-admin:
	protoc -I proto proto/training-admin/administrating.proto --go_out=./gen/go/ --go_opt=paths=source_relative --go-grpc_out=./gen/go/ --go-grpc_opt=paths=source_relative
generate-training-subscription:
	protoc -I proto proto/trainig-subscription/sub-user.proto --go_out=./gen/go/ --go_opt=paths=source_relative --go-grpc_out=./gen/go/ --go-grpc_opt=paths=source_relative
generate-auth:
	protoc -I proto proto/auth/auth.proto --go_out=./gen/go/ --go_opt=paths=source_relative --go-grpc_out=./gen/go/ --go-grpc_opt=paths=source_relativeprotoc
generate-sub-notification:
	protoc -I proto proto/sub-notification/sub-notification.proto --go_out=./gen/go/ --go_opt=paths=source_relative --go-grpc_out=./gen/go/ --go-grpc_opt=paths=source_relative
git-add:
	git add gen/go
git-commit:
	git commit -m "Generate protobuf files"

git-push:
	git push -u origin main
