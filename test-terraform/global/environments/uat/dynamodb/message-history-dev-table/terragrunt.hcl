#Local variables
locals {
  environment = get_env("ENVIRONMENT", "dev")
  region = "us-east-1"
}

terraform {
  source = "../../../../../../test-terraform/terraform-modules/dynamodb"
}

//Include the remote state configuration from a shared file
# include {
#   path = find_in_parent_folders("remote_state.hcl")
# }

# test-terraform/global/terragrunt.hcl
include "root" {
  path = find_in_parent_folders()
}

inputs = {
  environment = local.environment  # Reusing local variable
  region   = local.region
  env      = local.environment
  hashKey  = "id"
  rangeKey = "sk"
  tableName = "message-history"
  //vpc_id  = dependency.vpc.outputs.vpc_id
  tags = {

  }
  ttl_enabled = false

  table_attributes = [
    {
      "name" : "gsiEntityCreateTs_sk_createTs_id",
      "type" : "S"
    },
    {
      "name" : "gsiEntityUpdateTs_sk_updateTs_id",
      "type" : "S"
    },
    {
      "name" : "gsiTagEpc_sk_epc",
      "type" : "S"
    },
    {
      "name" : "id",
      "type" : "S"
    },
    {
      "name" : "sk",
      "type" : "S"
    }
  ]

  global_secondary_indexes = [
    {
      hash_key        = "id"
      range_key       = "gsiEntityCreateTs_sk_createTs_id"
      name            = "GSI_ENTITY_CREATE_TS"
      projection_type = "ALL"
      read_capacity   = 0
      write_capacity  = 0
    },
    {
      hash_key        = "id"
      range_key       = "gsiEntityUpdateTs_sk_updateTs_id"
      name            = "GSI_ENTITY_UPDATE_TS"
      projection_type = "ALL"
      read_capacity   = 0
      write_capacity  = 0
    },
    {
      hash_key        = "id"
      range_key       = "gsiTagEpc_sk_epc"
      name            = "GSI_TAG_EPC"
      projection_type = "ALL"
      read_capacity   = 0
      write_capacity  = 0
    }
  ]
}
