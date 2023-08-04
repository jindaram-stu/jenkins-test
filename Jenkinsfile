def getCommitType(commit) {
    script {
        return sh(script: "git show -s --format=%B $commit", returnStdout: true)
    }
}

def executeALL() {
        stage('Gradle Build') {
            sh 'chmod +x gradlew'
            sh './gradlew clean build'
        }

        stage('Deploy') {
            sh 'docker-compose down --rmi all'
            sh 'docker-compose up -d --build'
        }
}

def executeFE() {
    stage('Deploy') {
        sh 'docker-compose up -d --build test_front'
    }
}

def executeBE() {
    stage('Gradle Build') { 
        sh 'chmod +x gradlew'
        sh './gradlew clean build'
    }

    stage('Deploy') {
        sh 'docker-compose up -d --build test_back'
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
        if (type == "AL") {
            executeALL()
        }

        if (type == "FE") {
            executeFE
        }

        if (type == "BE") {
            executeBE()
        }
        
    }

}