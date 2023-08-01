node {
    def GIT_URL = "https://github.com/jindaram-stu/jenkins-test.git"

    stage('Pull') {
        git url: "${GIT_URL}", branch: "main", poll: true, changelog: true
    }

    dir("${env.WORKSPACE}") {
        sh 'gradlew clean build'
        sh 'docker build -t jindaram/perper .'
        sh 'docker run -d --name testserver -p 8084:8084'
    }

}