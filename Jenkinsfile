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
                    def result = sh(returnStatus: true, script: '/home/ubuntu/kaibur/1.sh')
                     def exitCode = sh(returnStatus: true, script: "/home/ubuntu/kaibur/1.sh")
                    if (exitCode != 0) {
                        error("Shell script returned a non-zero exit codec");
                    }
                }
            }
        }
stage('Building the node js app') {
            steps {
                sh 'npm install'
            }
}
stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh 'npx sonar-scanner'
                }
            }
        }




}
}