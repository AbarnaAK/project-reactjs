pipeline {
    agent any

    stages {
        stage('Build and Push Dev Image') {
            when {
                changeset 'origin/dev'
            }
            steps {
                script {
                    dockerBuildAndPush('dev')
                }
            }
        }

        stage('Build and Push Prod Image') {
            when {
                changeset 'origin/master'
            }
            steps {
                script {
                    dockerBuildAndPush('prod')
                }
            }
        }
    }
}

def dockerBuildAndPush(dev) {
    def abarna272 = "${abarna272}/${dev}-image:latest"

    // Docker login using credentials from Jenkins Credential Store
    withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dckr_pat_DtYWRiHgFsGsRihWotvUw5iPvW8', usernameVariable: 'abarna272')]) {
        sh "docker login -u ${abarna272} -p ${dckr_pat_DtYWRiHgFsGsRihWotvUw5iPvW8}"
    }

    // Build Docker image
    sh "docker build -t ${abarna272} ."

    // Push Docker image
    sh "docker push ${abarna272}"

    // Logout from DockerHub
    sh "docker logout"
}

