pipeline {
  agent any
  stages {
    stage('test') {
      steps {
        powershell 'robot Tests/REST.robot'
      }
    }
  }
}