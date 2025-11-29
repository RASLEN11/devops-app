pipeline {
    agent any
    
    tools {
        maven 'M3'
        jdk 'JDK11'
    }
    
    environment {
        SONAR_SCANNER_HOME = tool 'SonarQubeScanner'
        TOMCAT_HOME = '/var/lib/tomcat9'
    }
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/YOUR_USERNAME/devops-app.git',
                    credentialsId: 'github-credentials'
                sh 'ls -la'
            }
        }
        
        stage('Build') {
            steps {
                sh 'mvn clean compile'
                sh 'echo "Build stage completed successfully"'
            }
        }
        
        stage('Unit Tests') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                    archiveArtifacts 'target/surefire-reports/*.xml'
                }
            }
        }
        
        stage('SAST - SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonarqube-server') {
                    sh 'mvn sonar:sonar -Dsonar.projectKey=devops-app -Dsonar.projectName="DevOps Java Application"'
                }
            }
        }
        
        stage('Package') {
            steps {
                sh 'mvn clean package -DskipTests'
                archiveArtifacts 'target/*.war'
            }
        }
        
        stage('Deploy to Tomcat') {
            steps {
                sh '''
                    echo "Deploying application to Tomcat..."
                    sudo systemctl stop tomcat9
                    sudo rm -rf $TOMCAT_HOME/webapps/devops-app*
                    sudo cp target/devops-app.war $TOMCAT_HOME/webapps/
                    sudo systemctl start tomcat9
                    echo "Deployment completed!"
                '''
            }
        }
    }
    
    post {
        always {
            emailext (
                subject: "Build Result: ${currentBuild.result ?: 'SUCCESS'} - DevOps Java App",
                body: """
                Project: ${env.JOB_NAME}
                Build Number: ${env.BUILD_NUMBER}
                Build Result: ${currentBuild.result ?: 'SUCCESS'}
                Build URL: ${env.BUILD_URL}
                """,
                to: 'your-email@example.com'
            )
        }
        success {
            sh 'echo "Pipeline executed successfully! Application deployed."'
        }
        failure {
            sh 'echo "Pipeline failed! Check the logs for details."'
        }
    }
}
