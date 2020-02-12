pipeline {
   agent any

    parameters {
        string(name: 'city', defaultValue: '', description: 'born in....?')
        choice(name: 'color', choices: ['red', 'green', 'blue'], description: '') 
    }

   stages {
      stage('terraform') {
         steps {
            sh "echo 'Hello World'"
            // sh "terraform init"
            // sh "terraform plan"
         }
      }

      stage('second_stage') {
         steps {
            sh "echo 'this is the second stage'"
            // sh "terraform init"
            // sh "terraform plan"
         }
      }
   }
}