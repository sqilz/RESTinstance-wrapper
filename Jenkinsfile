pipeline {
  agent any
  stages {
    stage('test') {
      parallel {
        stage('test') {
          steps {
            bat 'robot -d results Tests/REST.robot'
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