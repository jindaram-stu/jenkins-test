node {
    def GIT_URL = "https://github.com/jindaram-stu/jenkins-test.git"

    stage('Pull') {
        step {
            git url: "${GIT_URL}", branch: "main", poll: true, changelog: true
        }
    }

    stage('Gradle Build') {
        step {
            sh 'gradlew clean build'
        }
    }

    stage('Docker Build') {
        step {
            sh 'docker build -t jindaram/perper .'
        }
    }

    stage('Deploy') {
        step {
            sh 'docker run -d --name testserver -p 8084:8084'
        }
    }

}