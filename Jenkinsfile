node {
    def GIT_URL = "https://github.com/jindaram-stu/jenkins-test.git"

    stage('Pull') {
        steps {
            git url: "${GIT_URL}", branch: "main", poll: true, changelog: true
        }
    }

    stage('Gradle Build') {
        steps {
            sh 'gradlew clean build'
        }
    }

    stage('Docker Build') {
        steps {
            sh 'docker build -t jindaram/perper .'
        }
    }

    stage('Deploy') {
        steps {
            sh 'docker run -d --name testserver -p 8084:8084'
        }
    }

}