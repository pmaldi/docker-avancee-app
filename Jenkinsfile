pipeline {
    agent any
    stages {
        stage('Prepare') {
            steps {
                script {
                    // Regrouper les commandes dans un bloc script pour une meilleure lisibilité
                    sh '''
                        # Add Docker's official GPG key:
                        sudo apt-get update
                        sudo apt-get install ca-certificates curl
                        sudo install -m 0755 -d /etc/apt/keyrings
                        sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
                        sudo chmod a+r /etc/apt/keyrings/docker.asc
                        
                        # Add the repository to Apt sources:
                        echo \
                          "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
                          $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
                          sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
                        sudo apt-get update
                    '''
                }
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
                // Ajoutez ici les commandes pour exécuter vos tests
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
