artifact_store= [{
    location = "codepipeline-eu-west-1-163714928765"
    type     = "S3"}]

name          = "cron-poll"
stage         = [{
    name="Source"
    action=[{
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeCommit"
      version          = "1"
      configuration={
          BranchName="master"
          PollForSourceChanges="false"
          RepositoryName="cron-poll"
      }
      output_artifacts = ["SourceArtifact"]
    }]
},
{
    name = "Build"
    action=[{
      name            = "Build"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      input_artifacts = ["SourceArtifact"]
      output_artifacts= ["BuildArtifact"]
      version         = "1"

      configuration = {
         
        ProjectName = "cron-poll"
      }
    }]
},
{
    name="Deploy"
    action=[{
        name="Deploy"
        category        = "Deploy"
        owner           = "AWS"
        provider        = "ECS"
        version         = "1"
        input_artifacts = ["BuildArtifact"]
        configuration = {
            ClusterName = "test"
            ServiceName = "cron-poll"
            }
    }]
}
]

environment =[{
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = "aws/codebuild/docker:18.09.0-1.7.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = "true"
  }]
  
common_tags={
    name="aws-codebuild-container"
  }
  
  sourcecode=[{
    type      = "CODEPIPELINE"
    buildspec = ""
    location  = "0"
  }]
build_timeout=60
description=""
env                   = "dev"
projectroot           = "core"
force_artifact_destroy= true
type                  = "CODEPIPELINE"