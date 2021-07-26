pipeline {
    agent {
        label 'docker'
    }
    stages {
        stage('Building our image') {
            steps {
                script {
                    dockerImage = docker.build "volodymyr128/mypython:1.$BUILD_NUMBER"
                }
            }
        }
        stage('Deploy our image') {
            steps {
                script {
                    // Assume the Docker Hub registry by passing an empty string as the first parameter
                    docker.withRegistry('' , 'dockerhub') {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}
