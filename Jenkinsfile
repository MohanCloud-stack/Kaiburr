pipeline {
agent any
environment {
    registry ='devopsmohan/kaiburnodejs'
    registryCredential ='devopsmohan'
    dockerImage = ''
  }
stages {
stage('Build') {
      steps {
         sh 'sudo docker build -t nodeapp01 .'
       }
    }
stage("Run shell script") {
            steps {
                sh "/var/lib/jenkins/workspace/CICDPipelineMERN/1.sh"
                script {
                    def result = sh(returnStatus: true, script: '/var/lib/jenkins/workspace/CICDPipelineMERN/1.sh')
                     def exitCode = sh(returnStatus: true, script: "/var/lib/jenkins/workspace/CICDPipelineMERN/1.sh")
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
stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
stage('Deploy Image') {
      steps{
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }

// stage("Deploying in EKS cluster"){
//   steps{
//     script{
//       "kubectl apply -f finalapp.yaml"
//     }
//   }
    
// }

}
}