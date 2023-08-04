def getCommitType(commit) {
    script {
        return sh(script: "git show -s --format=%B $commit", returnStdout: true)
    }
}

node {
    def GIT_URL = "https://github.com/jindaram-stu/jenkins-test.git"
    def vars = checkout scm
    def type = getCommitType(vars.GIT_COMMIT).substring(1,3)
    def branch = env.BRANCH_NAME

    echo "Type : ${type}"
    echo "Branch : ${branch}"
    

    stage('Pull') {
        git url: "${GIT_URL}", branch: "main", poll: true, changelog: true
    }

    dir("${env.WORKSPACE}") {
        stage('Gradle Build') {
            sh 'chmod +x gradlew'
            sh './gradlew clean build'
        }

        stage('Deploy') {
            sh 'docker-compose down --rmi all'
            sh 'docker-compose up -d'
        }

//         stage('Docker Build') {
//             sh 'docker build -t jindaram/perper .'
//         }
//
//         stage('Docker Run') {
//             sh 'docker run -d --name testserver -p 8084:8084 jindaram/perper'
//         }
    }

}