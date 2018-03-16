pipeline {
  agent any
  stages {
    stage('test') {
      steps {
        sh 'robot -d results -i Smoke Tests/REST.robot'
        sh 'which python'
      }
    }
  }
}