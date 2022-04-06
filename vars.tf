variable "namespace" {
  type        = string
  default     = "fluentbit"
  description = "namespace to create the fluentbit-operator resources in"
}

variable "configuration" {
  type        = map(string)
  default     = {}
  description = "Configuration for Fluentbit"
}

variable "operatorImage" {
  type        = string
  default     = ""
  description = ""
}

variable "operatorTag" {
  type        = string
  default     = ""
  description = ""
}

variable "fluentbitImage" {
  type        = string
  default     = ""
  description = ""
}

variable "fluentbitTag" {
  type        = string
  default     = ""
  description = ""
}

