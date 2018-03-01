pipeline {
  agent any
  stages {
    stage('test') {
      steps {
        bat 'pybot -d results Tests/REST.robot'
      }
    }
  }
}