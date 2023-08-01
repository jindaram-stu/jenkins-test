node {
    def GIT_URL = "https://github.com/jindaram-stu/jenkins-test.git"

    stage('Pull') {
        git url: "${GIT_URL}", branch: "main", poll: true, changelog: true
    }

    dir("${env.WORKSPACE}") {
        stage('Gradle Build') {
            sh 'chmod +x gradlew'
            sh 'gradlew clean build'
        }

        stage('Docker Build') {
            sh 'docker build -t jindaram/perper .'
        }
        
        stage('Docker Run') {
            sh 'docker run -d --name testserver -p 8084:8084'
        }
    }

}