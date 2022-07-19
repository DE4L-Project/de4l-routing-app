REPO_URL = "devdocker.wifa.uni-leipzig.de:5000"
IMAGE_TAG_BACKEND = "de4l/de4l-routing-backend"
IMAGE_TAG_FRONTEND = "de4l/de4l-routing-frontend"

BUILD = BRANCH_NAME == 'master' ? 'latest' : BRANCH_NAME

node('master') {
    checkout scm
    echo "Build: ${BUILD}"

    withCredentials([usernamePassword(credentialsId: 'docker-registry-devdocker', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USER')]) {
        sh "sudo docker login -u ${DOCKER_USER} -p ${DOCKER_PASSWORD} ${REPO_URL}"
    }

    stage('Build backend') {
        echo "Building backend: ${BUILD}"
        dir("backend") {
            sh "sudo docker build -t ${REPO_URL}/${IMAGE_TAG_BACKEND}:${BUILD} ."
        }
    }

    stage('Build frontend') {
        echo "Building backend: ${BUILD}"
        dir("frontend") {
            sh "sudo docker build -t ${REPO_URL}/${IMAGE_TAG_FRONTEND}:${BUILD} -f ./docker/Dockerfile ."
        }
    }

    stage('Publish to registry') {
        sh "sudo docker push  ${REPO_URL}/${IMAGE_TAG_BACKEND}:${BUILD}"
        sh "sudo docker push  ${REPO_URL}/${IMAGE_TAG_FRONTEND}:${BUILD}"
    }
}

