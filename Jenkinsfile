def getCommitType(commit) {
    script {
        return sh(script : "git show -s --format=%B $commit", returnStdout: true)
    }
}

node {
    echo "Hello World"
    def vars = checkout scm
    def prj_type = getCommitType(vars.GIT_COMMIT).substring(1,3)
    echo "${prj_type}"
}