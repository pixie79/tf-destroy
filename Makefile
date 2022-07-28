DYNAMODB ?= terraform-state-locking
AWS_REGION ?= af-south-1

.PHONY : clean all init destroy backend

all:
ifndef AWS_PROFILE
	@echo "AWS_PROFILE variable missing"
	exit 1
endif
ifndef AWS_REGION
	@echo "AWS_REGION variable missing"
	exit 1
endif
ifndef ENV
	@echo "ENV environment variable missing"
	exit 1
endif

clean:
	rm -rf .terraform .terraform.lock.hcl

init: | all clean
	terraform init -input=false -backend-config=./${ENV}.tfvars

destroy: | init
	terraform destroy -input=false
	make clean

backend: all
ifndef KEY
	@echo "KEY 'statefile not defined'"
endif
ifndef BUCKET
	@echo "BUCKET 'Terraform state not defined'"
endif
ifndef DYNAMODB
	@echo "DYNAMODB 'not defined'"
endif
	@echo 'key = "${KEY}.tfstate"\nbucket = "${BUCKET}"\nregion = "${AWS_REGION}"\nencrypt = true\ndynamodb_table = "${DYNAMODB}"' > ./${ENV}.tfvars
