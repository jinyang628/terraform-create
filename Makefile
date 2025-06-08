.PHONY: format

format:
	terraform init
	terraform fmt -recursive
	terraform validate
