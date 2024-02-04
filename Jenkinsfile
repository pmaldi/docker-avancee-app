pipeline {
    agent any
    stages {
        stage('Prepare') {
          steps {
            sh 'sudo apt-get update'
            sh 'sudo apt-get install ca-certificates curl'
            sh 'sudo install -m 0755 -d /etc/apt/keyrings'
            sh 'sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc'
            sh 'sudo chmod a+r /etc/apt/keyrings/docker.asc'
            sh 'echo \'
            sh '  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \'
            sh '  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \'
            sh '  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null'
            sh 'sudo apt-get update'
            sh 'sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin'
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
