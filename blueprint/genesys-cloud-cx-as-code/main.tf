

terraform {

  backend "remote" {
    organization = "TestCognizant"

    workspaces {
      prefix = "CI_CD"
    }
  }

  required_providers {
    genesyscloud = {
      source = "mypurecloud/genesyscloud"
    }
  }
}

provider "genesyscloud" {
  sdk_debug = true
}

<<<<<<< HEAD
#Thiss is an example of creating queues using a remote modules.  Remote modules allow you to re-use Terraform/CX as Code component across multiple Terraform
=======
#Thisss is an example of creating queues using a remote modules.  Remote modules allow you to re-use Terraform/CX as Code component across multiple Terraform
>>>>>>> a5849b6d8714147730f82500ec49d56a7b36a75e
#configs.

# module "classifier_queues" {
#   source                   = "git::https://github.com/GenesysCloudDevOps/genesys-cloud-queues-demo.git?ref=main"
#   classifier_queue_names   = ["401K", "IRA", "529", "GeneralSupport"]
#   classifier_queue_members = module.classifier_users.user_ids
# }

module "classifier_queues" {
  source                   = "./modules/queues"
  classifier_queue_names   = ["401K", "IRA", "ROTH", "529", "GeneralSupport", "PremiumSupport","PremiumSupport2"]
  //classifier_queue_members = module.classifier_users.user_ids
}


# module "classifier_email_routes" {
#   source               = "./modules/email_routes"
#   genesys_email_domain = var.genesys_email_domain
# }

module "classifier_data_actions" {
  source             = "./modules/data_actions"
}