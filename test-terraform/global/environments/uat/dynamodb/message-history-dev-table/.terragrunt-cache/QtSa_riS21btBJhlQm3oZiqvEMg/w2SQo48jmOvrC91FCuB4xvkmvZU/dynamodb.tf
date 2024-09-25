resource "aws_dynamodb_table" "ats-ddna-dynamodb-table" {
  name = format("%s-%s-table", var.tableName, var.env)
  //name = "ats-ddna-dev-ce-core-table"
  hash_key                    = var.hashKey
  range_key                   = var.rangeKey
  billing_mode                = var.billingMode
  read_capacity               = var.readCapacity
  write_capacity              = var.writeCapacity
  deletion_protection_enabled = var.deletionProtectionEnabled
  tags                        = var.tags

  point_in_time_recovery {
    enabled = false
  }

  dynamic "attribute" {
    for_each = var.table_attributes
    content {
      name = attribute.value["name"]
      type = attribute.value["type"]
    }
  }

  ttl {
    attribute_name = var.ttl_attribute
    enabled        = var.ttl_enabled
  }

  dynamic "global_secondary_index" {
    for_each = var.global_secondary_indexes == null ? [] : var.global_secondary_indexes
    content {
      hash_key           = global_secondary_index.value["hash_key"]
      range_key          = global_secondary_index.value["range_key"]
      name               = global_secondary_index.value["name"]
      projection_type    = global_secondary_index.value["projection_type"]
      non_key_attributes = global_secondary_index.value["non_key_attributes"]
      read_capacity      = global_secondary_index.value["read_capacity"]
      write_capacity     = global_secondary_index.value["write_capacity"]
    }
  }
}
output "dynamodb" {
  value = aws_dynamodb_table.ats-ddna-dynamodb-table.arn
}
