pipeline {
agent any
stages {
stage('Build') {
       steps {
         sh 'sudo docker build -t nodeapp01 .'
       }
    }
stage("Run shell script") {
            steps {
                sh "
                cd /home/ubuntu
                ./1.sh"
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