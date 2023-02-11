pipeline {
agent any
stages {
stage('Build') {
       steps {
         sh 'sudo docker build -t nodeapp01 .'
       }
    }
stage("Change Workspace") {
            steps {
                ws("/home/ubuntu/kaibur") {
                    sh "pwd"
                }
            }
    }
stage("Run shell script") {
            steps {
                ws("/home/ubuntu/kaibur") {
                    sh "pwd"
                }
                sh "/home/ubuntu/kaibur/1.sh"
                script {
                    def result = sh(returnStatus: true, script: './1.sh')
                    if (result != 0) {
                        error("Shell script returned a non-zero exit code.");
                    }
                }
            }
        }
}
}