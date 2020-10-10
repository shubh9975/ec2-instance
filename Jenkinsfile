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
      
   stage("terraform_init"){
     //terraform init
     steps{
      script{
       sh "bash plugins.sh"
}
}
}

   stage("static_analysis"){
     //static analysis
      steps{
       script{
       sh '''
        cd infra
        terraform validate
        cd -
       '''
}
}
}
   stage("terraform_plan"){
     //terraform plan
      steps{
       script{
       sh '''
	 cd infra
	terraform plan
	 cd -
       '''
}
}
}
 
   stage("terraform_apply"){
    //terraform apply
     steps{
      script{
      sh '''
	   cd infra
	   terraform apply --auto-approve
 	   cd -
      '''
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
