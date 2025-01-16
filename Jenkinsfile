pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = 'testa'           // Nom de l'image Docker
        DOCKER_TAG = 'latest'                 // Tag de l'image Docker
    }

    triggers {
        pollSCM('* * * * *')  // Optionnel, utilise Git polling si le webhook ne fonctionne pas
    }

    stages {
        stage('Checkout') {
            steps {
                // Cloner votre dépôt GitHub
                git branch: 'main', credentialsId: '12', url: 'https://github.com/m-nextc/test.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Construire l'image Docker
                    sh 'docker build -t $DOCKER_IMAGE_NAME:$DOCKER_TAG .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Supprimer le conteneur existant s'il existe
                    sh 'docker rm -f $DOCKER_IMAGE_NAME || true'

                    // Exécuter un conteneur à partir de l'image Docker construite
                    sh 'docker run -d --name $DOCKER_IMAGE_NAME $DOCKER_IMAGE_NAME:$DOCKER_TAG'
                }
            }
        }
    }
}
