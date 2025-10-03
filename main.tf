terraform {
  required_version = ">= 1.10"

  required_providers {
    katapult = {
      source  = "krystal/katapult"
      version = "~> 0.0"
    }
  }
}