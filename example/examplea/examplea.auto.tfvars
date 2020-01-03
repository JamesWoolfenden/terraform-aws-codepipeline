artifact_store = {
  location = "codepipeline-eu-west-1-163714928765"
type = "S3" }
description = ""
name        = "cron-poll"
stages = [{
  name = "Source"
  action = {
    name     = "Source"
    category = "Source"
    owner    = "AWS"
    provider = "CodeCommit"
    version  = "1"
    configuration = {
      BranchName           = "master"
      PollForSourceChanges = "false"
      RepositoryName       = "cron-poll"
    }
    input_artifacts  = []
    output_artifacts = ["SourceArtifact"]
  }
  },
  {
    name = "Build"
    action = {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["SourceArtifact"]
      output_artifacts = ["BuildArtifact"]
      version          = "1"
      configuration = {
        ProjectName = "cron-poll"
      }
    }
  },
  {
    name = "Deploy"
    action = {
      name             = "Deploy"
      category         = "Deploy"
      owner            = "AWS"
      provider         = "ECS"
      version          = "1"
      input_artifacts  = ["BuildArtifact"]
      output_artifacts = []
      configuration = {
        ClusterName = "test"
        ServiceName = "cron-poll"
      }
    }
  }
]

common_tags = {
  name = "aws-codebuild-container"
}
