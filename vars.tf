variable "namespace" {
  type        = string
  default     = "fluentbit"
  description = "namespace to create the fluent-operator resources in"
}

variable "configuration" {
  type        = map(string)
  default     = {}
  description = "Configuration for Fluentbit"
}

variable "operatorImage" {
  type        = string
  default     = "kubesphere/fluent-operator"
  description = "Fluent operator image to use"
}

variable "operatorTag" {
  type        = string
  default     = "v1.0.2"
  description = "Fluent operator image tag to use"
}

variable "fluentbitImage" {
  type        = string
  default     = "kubesphere/fluent-bit"
  description = "Fluentbit image to use"
}

variable "fluentbitTag" {
  type        = string
  default     = "v1.8.11"
  description = "Fluentbit image tag to use"
}

variable "fluentbitResources" {
  type        = object({ cpuRequest : string, cpuLimit : string, memRequest : string, memLimit : string })
  default     = { cpuRequest : "10m", cpuLimit : "500m", memRequest : "25Mi", memLimit : "200Mi" }
  description = "Fluentbit container resources"
}
