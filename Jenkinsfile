pipeline {
    agent any
    tools{
        maven "maven_3_5_0"
    }
    
    stages {
        stage("Build Maven"){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/code-nemo/devops-automation']])
            }
        }
        stage("Build docker image"){
            steps{
                script{
                    sh "docker build -t newdevops111/devops-automation ."
                }
            }
        }
        stage("Push image to docker hub"){
            steps{
                script{
                    withCredentials([string(credentialsId: 'docker-hub', variable: 'dockerhubpwd')]) {
                        sh "docker login -u newdevops111 -p ${dockerhubpwd}"
                        
                        sh "docker push newdevops111/devops-automation:latest"
                    }
                }
            }
        }
    }
}
