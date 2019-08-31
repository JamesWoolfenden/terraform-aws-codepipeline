module "codepipeline" {
  source = "../../"

  artifact_store = "${var.artifact_store}"
  name           = "${var.name}"

  #role_arn       = "${var.role_arn}"
  stage = "${var.stage}"
}
