pipeline {
    agent any // Агент з Docker

    environment {
        IMAGE_NAME = "your-dockerhub-username/space2study-backend" 
        REGISTRY_CREDS_ID = "docker-reg-creds" // ID з Jenkins Credentials
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build & Push Image') {
            steps {
                script {
                    echo "--- Building Backend Image ---"
                    def dockerImage = docker.build(IMAGE_NAME, ".")
                    
                    docker.withRegistry(null, REGISTRY_CREDS_ID) {
                        echo "--- Pushing Backend Image ---"
                        dockerImage.push("${env.BUILD_NUMBER}")
                        dockerImage.push("latest")
                    }
                }
            }
        }
    }
}