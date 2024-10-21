

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
//
provider "genesyscloud" {
  sdk_debug = true
}

resource "genesyscloud_integration" "PureCloud_Data_Actions" {
  intended_state   = "ENABLED"
  integration_type = "purecloud-data-actions"
  config {
    name       = "PureCloud_Data_Actions"
    properties = jsonencode({})
    advanced   = jsonencode({})
    notes      = "Used to retrieve estimated wait time for a specific media type and queue"
  }
}

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
  intg_name = "PureCloud_Data_Actions"
}