pipeline {
    agent any
    stages {

        stage('Build') {
            steps {
                bat "mvn compile"
            }
        }
        stage('FooTest') {
            steps {
                bat "mvn test"
            }
            post {
                always {
                    junit '**/TEST*.xml'
                }
            }
        }
    }
}