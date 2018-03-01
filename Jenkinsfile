pipeline {
  agent any
  stages {
    stage('test') {
      steps {
        powershell 'robot -d results Tests/REST.robot'
      }
    }
  }
}