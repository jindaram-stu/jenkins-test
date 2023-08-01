node {
    def GIT_URL = "https://github.com/jindaram-stu/jenkins-test.git"

    stage('Pull') {
        git url: "${GIT_URL}", branch: "main", poll: true, changelog: true
    }

    stage('Gradle Build') {
        sh 'gradlew clean build'
    }

    stage('Docker Build') {
        sh 'docker build -t jindaram/perper .'
    }

    stage('Deploy') {
        sh 'docker run -d --name testserver -p 8084:8084'
    }

}