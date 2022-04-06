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
  default     = "kubesphere/fluentbit-operator"
  description = "Fluentbit operator image to use"
}

variable "operatorTag" {
  type        = string
  default     = "latest"
  description = "Fluentbit operator image tag to use"
}

variable "fluentbitImage" {
  type        = string
  default     = "kubesphere/fluent-bit"
  description = "Fluentbit image to use"
}

variable "fluentbitTag" {
  type        = string
  default     = "v1.8.3"
  description = "Fluentbit image tag to use"
}

