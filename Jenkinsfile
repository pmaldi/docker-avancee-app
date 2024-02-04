pipeline {
    agent any
    stages {
        stage('Prepare') {
            steps {
                script {
                    // Regrouper les commandes dans un bloc script pour une meilleure lisibilité
                    sh '''
                    apt-get update
                    apt-get install -y ca-certificates curl
                    install -m 0755 -d /etc/apt/keyrings
                    curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
                    chmod a+r /etc/apt/keyrings/docker.asc
                    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
                    apt-get update
                    apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
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
