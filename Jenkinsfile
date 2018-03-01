pipeline {
  agent any
  stages {
    stage('test') {
      parallel {
        stage('test') {
          steps {
            powershell 'robot -d results Tests/REST.robot'
          }
        }
        stage('shell') {
          steps {
            sh 'robot -d results Tests/REST.robot'
          }
        }
      }
    }
  }
}