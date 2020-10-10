pipeline{
  agent any
   environment{
         AWS_REGION="ap-south-1"
         AWS_PROFILE="test"
}
  stages {
   stage("Opening"){
         steps{
            //Welcome message
            script{
               sh "echo 'Welcome to Jenkins'"
}
}
}

   stage("Workspace_cleanup"){
        //Cleaning WorkSpace
        steps{
            step([$class: 'WsCleanup'])
}
}

   stage("Repo_clone"){
       //Clone repo from GitHub
      steps {
         checkout ([$class: 'GitSCM', branches: [[name: '*/master']], userRemoteConfigs: [[credentialsId: 'Jenkins_id', url: 'git@github.com:shubh9975/ec2-instance.git']]])

}
}
   
   stage("create_instance"){
      //createing instance using terraform
      steps{
       resource "aws_instance" "web" {
         ami= "ami-09052aa9bc337c78d"
         instance_type = "t2.micro"

         tags = {
         Name = "HelloWorld"
}
}

}
}

   stage("static_analysis"){
     //static analysis
      steps{
       script{
       sh "terraform validate"
}
}
}   
   stage("terraform_init"){
     //terraform init
     steps{
      script{
       sh"bash bash.sh"
}
}
}
   stage("terraform_plan"){
     //terraform plan
      steps{
       script{
        sh"terraform plan"
}
}
}
 
   stage("terraform_apply"){
    //terraform apply
     stapes{
      script{
       sh"terraform apply --auto-approve"
}
}
}

   stage("terraform_destroy"){
    //terraform destory
     steps{
      script{
       sh '''
            cd infra
            terraform destroy --auto-approve
            cd -
       '''
}
}
}


}
}
