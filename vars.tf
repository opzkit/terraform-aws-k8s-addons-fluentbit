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
