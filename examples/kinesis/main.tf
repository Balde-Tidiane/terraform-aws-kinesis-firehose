provider "aws" {
  region = "us-west-1"
}

resource "random_pet" "run" {}

module "observe_kinesis" {
  source           = "../.."
  observe_customer = var.observe_customer
  observe_token    = var.observe_token
  observe_url      = var.observe_url

  name           = random_pet.run.id
  kinesis_stream = aws_kinesis_stream.this
}
