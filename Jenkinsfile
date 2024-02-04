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
            }
        }
    }
}