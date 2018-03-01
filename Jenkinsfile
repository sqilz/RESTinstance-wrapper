pipeline {
  agent any
  stages {
    stage('test') {
      steps {
        sh 'pybot --outputdir results Tests/REST.robot'
      }
    }
  }
}