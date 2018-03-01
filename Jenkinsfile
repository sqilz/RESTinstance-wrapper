pipeline {
  agent any
  stages {
    stage('test') {
      parallel {
        stage('test') {
          steps {
            bat 'pybot -d results Tests/REST.robot'
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