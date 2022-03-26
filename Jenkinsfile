pipeline {
    agent any

    stages {

        stage('Git checkout') {
            steps {
                git 'https://github.com/Stoltefar/auto21.git'}
        }

        stage('Build') {
            steps {
                bat "mvn compile"
            }
        }

        stage('Test') {
            steps {
                bat "mvn test"
            }
            post {
                always {
                    junit '**/TEST*.xml'
                }
            }
        }

        stage('newman') {
                    steps {
                        bat 'newman run Linus_Postman-labb.postman_collection.json --environment Postman-labben.postman_environment.json --reporters junit'
                    }
                    post {
                        always {
                                junit '**/*xml'
                        }
                    }
        }

        stage('Cobertura Coverage') {
                        steps {
                            bat 'mvn clean cobertura:cobertura'
                        }
                        post {
                                        always {
                                          step([$class: 'CoberturaPublisher', coberturaReportFile: '**/*coverage.xml'])
                                        }
                        }
        }

        stage('Robot Framework System tests with Selenium') {
                    steps {
                        bat 'robot -d Results Tests/labb2LinusVGdel.robot'
                    }
                    post {
                        always {
                            script {
                                  step(
                                        [
                                          $class              : 'RobotPublisher',
                                          outputPath          : 'Results',
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
        // Lånat från https://igorski.co/sonarqube-scans-using-jenkins-declarative-pipelines/
        // Behöver nog kolla mer där...
        stage('SonarCloud') {
          environment {
            SCANNER_HOME = tool 'SonarQubeScanner'
            ORGANIZATION = "Stoltefar-github"
            PROJECT_NAME = "Stoltefar_jenkins-pipeline-as-code"
          }
          steps {
            withSonarQubeEnv('SonarCloudOne') {
                sh '''$SCANNER_HOME/bin/sonar-scanner -Dsonar.organization=$ORGANIZATION \
                -Dsonar.java.binaries=build/classes/java/ \
                -Dsonar.projectKey=$PROJECT_NAME \
                -Dsonar.sources=.'''
            }
          }
        }
    }
}