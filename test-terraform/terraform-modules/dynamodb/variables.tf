##Global
variable env {
  type        = string
  description = "environment name"
}

variable tableName {
  type        = string
  description = "Name of the dynamodb table"
}

variable hashKey {
  type        = string
  description = "Name of hasKey of the dynamodb table"
}

variable rangeKey {
  type        = string
  description = "Name of rangeKey of the dynamodb table"
}

variable "billingMode" {
  type        = string
  description = "PROVISIONED OR PAY_PER_REQUEST"
  default     = "PAY_PER_REQUEST"
}

variable "readCapacity" {
  type        = number
  description = "The read capacity"
  default     = 0
}

variable "writeCapacity" {
  type        = number
  description = "The write capacity"
  default     = 0
}

variable "deletionProtectionEnabled" {
  type        = bool
  description = "Checks if an Amazon DynamoDB table have deletion protection set to enabled"
  default     = false
}

variable tags {
  type = map(string)
  description = "map containing all necessary tags for resources"
}

variable table_attributes {
  type = list(object({
    name = any,
    type = any
  }))
}

variable "ttl_attribute" {
  type        = string
  description = "Time To Live that indicates when an item is no longer needed - expires at"
  default     = ""
}

variable "ttl_enabled" {
  type        = bool
  description = "Enabled/Disabled"
  default     = false
}

variable "global_secondary_indexes" {
  type = list(object({
    hash_key        = string
    range_key = optional(string)
    name            = string
    projection_type = string
    non_key_attributes = optional(list(string))
    read_capacity   = number
    write_capacity  = number
  }))
  default = null

}