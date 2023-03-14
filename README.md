# autotests_yc_provision

0) Install terraform like it described in https://cloud.yandex.ru/docs/tutorials/infrastructure-management/terraform-quickstart#configure-provider
1) backup your old .terraformrc if exists: mv ~/.terraformrc ~/.terraformrc.old
2) Copy .terraformrc to ~/.terraformrc: cp .terraformrc ~/.terraformrc
3) Go to folder with use project
4) Put your Oath Token to file terraform.tfvars. Also check meta.txt in roles in order to pase your ssh key to cloud-init
5) terraform init
6) terraform plan -var-file=../terraform.tfvars
7) terraform apply -var-file=../terraform.tfvars
