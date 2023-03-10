# Customize Terraform Configuration with Variables

## https://developer.hashicorp.com/terraform/tutorials/certification-associate-tutorials/variables

### https://developer.hashicorp.com/terraform/language/values/variables#assigning-values-to-root-module-variables

### https://developer.hashicorp.com/terraform/language/values/variables#variable-definition-precedence

### https://developer.hashicorp.com/terraform/language/values/variables

### https://developer.hashicorp.com/terraform/language/values/locals

### https://developer.hashicorp.com/terraform/tutorials/modules/module

### https://developer.hashicorp.com/terraform/tutorials/configuration-language/custom-conditions

### https://developer.hashicorp.com/terraform/language/expressions/type-constraints#structural-types

#### Variable Definition Precedence

Terraform loads variables in the following order, with later sources taking precedence over earlier ones:

Environment variables
The terraform.tfvars file, if present.
The terraform.tfvars.json file, if present.
Any _.auto.tfvars or _.auto.tfvars.json files, processed in lexical order of their filenames.
Any -var and -var-file options on the command line, in the order they are provided. (This includes variables set by a Terraform Cloud workspace.)

#### Variables on the Command Line

To specify individual variables on the command line, use the -var option when running the terraform plan and terraform apply commands:

terraform apply -var="image_id=ami-abc123"
terraform apply -var='image_id_list=["ami-abc123","ami-def456"]' -var="instance_type=t2.micro"
terraform apply -var='image_id_map={"us-east-1":"ami-abc123","us-east-2":"ami-def456"}'

#### Variable Definitions (.tfvars) Files

To set lots of variables, it is more convenient to specify their values in a variable definitions file (with a filename ending in either .tfvars or .tfvars.json) and then specify that file on the command line with -var-file:

terraform apply -var-file="testing.tfvars"
