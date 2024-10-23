pipeline {
    agent any
    tools{
            nodejs "node18.20.4"
    }
    environment {
        DOCKER_IMAGE = 'abdelrahamnaliheggo/node.org'
        IMAGE_TAG = "${DOCKER_IMAGE}:${BUILD_NUMBER}"
        // DockerHub credentials (Jenkins credentials ID)
        DOCKER_CREDENTIALS = 'dockerhub'
	}
    stages {
        stage('Install Dependencies'){
            steps{
                sh 'npm install'
            }
        }
        stage('Build Code'){
            steps{
                sh 'npm run build'
            }
        }
        stage('Unit Test'){
            steps{
                sh 'npm test'
            }
        }
        stage('Docker Build') {
            steps {
                
                 sh 'docker build -t ${IMAGE_TAG} .'
                
            }
        }
        // stage('Login to DockerHub & Push Image') {
        //     steps {
        //         script {
        //             // Login to DockerHub using the credentials you set up in Jenkins
        //             withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDENTIALS}", passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USER')]) {
        //                 sh '''
        //                 echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin ;\
        //                 docker push ${IMAGE_TAG}
        //                 ''' 
        //             }
        //         }
        //     }
        // }

    }
    post{
        always{
            sh 'docker logout'
        }

    }
}
