pipeline {
   agent any

   stages {
      stage('Hello') {
         steps {
            sh "echo 'Hello World'"
            sh "terraform init"
            sh "terraform plan"
         }
      }
   }
}