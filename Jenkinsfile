pipeline {
    agent any
    tools {
        maven 'Mvn-3.9'
    }
    environment {
        scannerHome = tool 'Sonar';
    }
    stages {
        stage('Unit Testing') {
            steps {
                sh 'mvn test'
            }
        }
        stage('integration Testing') {
            steps {
                sh 'mvn integration-test'
            }
        }
        stage('SonarQube analysis') {
            steps {
                script {
                    sh '''
                    ${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=tunartisan -Dsonar.java.binaries=. -Dsonar.host.url=http://master:9000 -Dsonar.login=squ_a918939eb419f31cbdd274d2d03830fa34d3ee8c
                    '''
                }
            }
        }
        stage ('Build Jar') {
            steps {
                sh 'mvn package'
            }
        }
        stage ('Build Docker Image') {
            steps {
                sh 'docker build -t demo:1.0 .'
            }
        }
        stage ('Push Docker Image to Nexus') {
            steps {
                sh 'docker login -u devops -p devops http://master:9001'
                sh 'docker tag demo:1.0 master:9001/demo:1'
                sh 'docker push master:9001/demo:1'
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                    sh 'kubectl apply -f Deployment.yaml'
                    sh 'kubectl apply -f Service.yaml'
                    }
        }
    }
}
