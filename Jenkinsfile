pipeline {
    agent any
    stages {
        stage('Prepare') {
          when {
            expression {
              BRANCH_NAME == 'prod'
            }
          }
          steps {
              echo 'Prepare only on prod..'
            }
        }
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'docker build -t docker-avancee-app:${BUILD_NUMBER} .'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                sh 'docker run -d -p 5173:5173 docker-avancee-app:${BUILD_NUMBER}'
            }
        }
    }
}
