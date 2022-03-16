pipeline {
    agent any
    stages {

        stage('Build') {
            steps {
                sh "mvn compile"
            }
        }
        stage('Test') {
            steps {
                sh "mvn test"
            }
            post {
                always {
                    junit '**/TEST*.xml'
                }
            }
        }
        stage('newman') {
                    steps {
                        sh 'newman run Linus_Postman-labb.postman_collection.json --environment Postman-labben.postman_environment.json --reporters junit'
                    }
                    post {
                        always {
                                junit '**/*xml'
                        }
                    }
        }
    }
}