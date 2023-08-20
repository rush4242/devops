pipeline {
  agent any
  stages {
    stage('checkout code') {
      steps {
        git(url: 'https://github.com/rush4242/devops', branch: 'main')
      }
    }

    stage('any') {
      steps {
        sh 'ls -ld'
      }
    }

    stage('build') {
      steps {
        sh 'docker build -f curriculum-front/Dockerfile .'
      }
    }

  }
}