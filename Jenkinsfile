pipeline {
    agent any
    stages {
        stage('Git checkout') {
            steps {
                git 'https://github.com/Stoltefar/auto21.git'}
        }

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

        stage('Cobertura Coverage') {
                        steps {
                            sh 'mvn clean cobertura:cobertura'
                        }
        }


        stage('Robot Framework System tests with Selenium') {
                    steps {
                        sh 'robot -d Results Tests'
                    }
                    post {
                        always {
                            script {
                                  step(
                                        [
                                          $class              : 'RobotPublisher',
                                          outputPath          : 'results',
                                          outputFileName      : '**/output.xml',
                                          reportFileName      : '**/report.html',
                                          logFileName         : '**/log.html',
                                          disableArchiveOutput: false,
                                          passThreshold       : 50,
                                          unstableThreshold   : 40,
                                          otherFiles          : "**/*.png,**/*.jpg",
                                        ]
                                  )
                            }
                        }
                    }
                }
    }
}