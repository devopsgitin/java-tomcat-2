pipeline{
    agent{
        label 'agent1'
    }
    tools{
        maven 'mvn383'
    }
    stages{
        stage("Maven Build"){
            steps{
                sh "mvn clean package"
            }
        }
        stage("Build Docker Image"){
            steps{
                sh "docker build -t devopsdock1/java_tomcat:v1.$BUILD_NUMBER ."
                sh "docker build -t devopsdock1/java_tomcat ."
            }
        }
        stage("Push Docker Image to Registry"){
            environment{
                DOCKER_LOGIN=credentials('docker_login')
            }
            steps{
                sh "docker login -u $DOCKER_LOGIN_USR -p $DOCKER_LOGIN_PSW "
                sh "docker push devopsdock1/java_tomcat:v1.$BUILD_NUMBER"
                sh "docker push devopsdock1/java_tomcat"
                sh "docker rmi devopsdock1/java_tomcat:v1.$BUILD_NUMBER"
                sh "docker rmi devopsdock1/java_tomcat"
                sh "docker logout"
            }
        }
        stage("Deploying APP"){
            steps{
                sh "ansible-playbook ansibleplay.yaml"
            }
        }
    }
}
