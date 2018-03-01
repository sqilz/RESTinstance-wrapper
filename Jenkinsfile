pipeline {
  agent any
  stages {
    stage('test') {
      steps {
        powershell 'pybot --outputdir results Tests/REST.robot'
      }
    }
  }
}