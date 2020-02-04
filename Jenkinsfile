pipeline {
   agent any

   stages {
      stage('terraform') {
         steps {
            sh "echo 'Hello World'"
            sh "terraform init"
            sh "terraform plan"
         }
      }
   }
}