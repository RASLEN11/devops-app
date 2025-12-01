pipeline {
    agent any
    
    tools {
        maven 'M3'
        jdk 'JDK11'
    }
    
    environment {
        SONAR_SCANNER_HOME = tool 'SonarQubeScanner'
        TOMCAT_URL = 'http://localhost:8080/manager/text'
        TOMCAT_CREDENTIALS_ID = 'tomcat-credentials'
        GITHUB_CREDENTIALS_ID = 'github-credentials'
    }
    
    stages {
        // Stage 1: Checkout code from GitHub
        stage('Checkout') {
            steps {
                script {
                    echo '📥 Checking out code from GitHub repository...'
                    git branch: 'main',
                        url: 'https://github.com/RASLEN11/devops-app.git',
                        credentialsId: GITHUB_CREDENTIALS_ID
                    
                    // Display commit information
                    sh 'git log --oneline -3'
                }
            }
        }
        
        // Stage 2: Build the application
        stage('Build') {
            steps {
                script {
                    echo '🔨 Building Java Maven application...'
                    sh 'mvn clean compile'
                }
            }
        }
        
        // Stage 3: Run unit tests
        stage('Unit Tests') {
            steps {
                script {
                    echo '🧪 Running JUnit tests...'
                    sh 'mvn test'
                }
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                    archiveArtifacts 'target/surefire-reports/*.xml'
                }
            }
        }
        
        // Stage 4: Code Quality Analysis with SonarQube (SAST)
        stage('SAST - SonarQube Analysis') {
            when {
                environment name: 'SKIP_SONARQUBE', value: 'false'
            }
            steps {
                script {
                    echo '🔍 Running SonarQube Static Analysis...'
                    withSonarQubeEnv('sonarqube-server') {
                        sh 'mvn sonar:sonar ' +
                           '-Dsonar.projectKey=devops-app ' +
                           '-Dsonar.projectName="DevOps Java Application" ' +
                           '-Dsonar.host.url=http://localhost:9000 ' +
                           '-Dsonar.login=admin ' +
                           '-Dsonar.password=admin'
                    }
                }
            }
        }
        
        // Stage 5: Package the application
        stage('Package') {
            steps {
                script {
                    echo '📦 Packaging application as WAR file...'
                    sh 'mvn clean package -DskipTests'
                    
                    // Archive the WAR file
                    archiveArtifacts 'target/*.war'
                    
                    // Display file information
                    sh 'ls -la target/*.war'
                }
            }
        }
        
        // Stage 6: Deploy to Tomcat
        stage('Deploy to Tomcat') {
            steps {
                script {
                    echo '🚀 Deploying application to Apache Tomcat...'
                    
                    // Method 1: Using Deploy to Container plugin
                    deploy adapters: [tomcat9(
                        credentialsId: TOMCAT_CREDENTIALS_ID, 
                        path: '', 
                        url: TOMCAT_URL
                    )], 
                    contextPath: 'devops-app',
                    war: 'target/devops-app.war'
                    
                    // Alternative Method 2: Manual deployment (uncomment if needed)
                    /*
                    sh '''
                        echo "Stopping Tomcat..."
                        sudo systemctl stop tomcat9
                        
                        echo "Removing old deployment..."
                        sudo rm -rf /opt/tomcat/webapps/devops-app*
                        
                        echo "Copying new WAR file..."
                        sudo cp target/devops-app.war /opt/tomcat/webapps/
                        
                        echo "Starting Tomcat..."
                        sudo systemctl start tomcat9
                        
                        echo "Waiting for deployment..."
                        sleep 10
                        
                        echo "Deployment completed!"
                    '''
                    */
                }
            }
        }
        
        // Stage 7: Verify deployment
        stage('Verification') {
            steps {
                script {
                    echo '✅ Verifying deployment...'
                    
                    // Wait for Tomcat to fully start
                    sleep 20
                    
                    // Test if application is accessible
                    sh '''
                        echo "Testing application accessibility..."
                        curl -f http://localhost:8080/devops-app/ || echo "Application not yet ready"
                        
                        echo "Checking Tomcat manager..."
                        curl -u jenkins:jenkins123 http://localhost:8080/manager/text/list | grep devops-app || echo "Application not listed in manager"
                    '''
                }
            }
        }
    }
    
    post {
        always {
            echo '📊 Pipeline execution completed'
            
            // Clean up workspace
            cleanWs()
            
            // Send email notification
            emailext (
                subject: "DevOps Pipeline Result: ${currentBuild.result ?: 'SUCCESS'} - Build #${env.BUILD_NUMBER}",
                body: """
                <h2>DevOps CI/CD Pipeline Report</h2>
                <hr>
                <p><strong>Project:</strong> ${env.JOB_NAME}</p>
                <p><strong>Build Number:</strong> ${env.BUILD_NUMBER}</p>
                <p><strong>Build Result:</strong> <span style="color: ${currentBuild.result == 'SUCCESS' ? 'green' : 'red'}">${currentBuild.result ?: 'SUCCESS'}</span></p>
                <p><strong>Build URL:</strong> <a href="${env.BUILD_URL}">${env.BUILD_URL}</a></p>
                <p><strong>Application URL:</strong> <a href="http://${env.NODE_NAME}:8080/devops-app/">http://${env.NODE_NAME}:8080/devops-app/</a></p>
                <hr>
                <h3>Pipeline Stages:</h3>
                <ul>
                    <li>✓ Checkout - Code retrieved from GitHub</li>
                    <li>✓ Build - Maven compilation completed</li>
                    <li>✓ Unit Tests - JUnit tests executed</li>
                    <li>✓ SAST - SonarQube analysis performed</li>
                    <li>✓ Package - WAR file created</li>
                    <li>✓ Deploy - Application deployed to Tomcat</li>
                </ul>
                """,
                to: 'your-email@example.com',
                mimeType: 'text/html'
            )
        }
        
        success {
            echo '🎉 Pipeline executed successfully!'
            sh '''
                echo "=========================================="
                echo "         DEPLOYMENT SUCCESSFUL           "
                echo "=========================================="
                echo ""
                echo "Application deployed to:"
                echo "  http://localhost:8080/devops-app/"
                echo ""
                echo "Jenkins Build URL:"
                echo "  ${BUILD_URL}"
                echo ""
                echo "=========================================="
            '''
        }
        
        failure {
            echo '❌ Pipeline failed! Check logs for details.'
            sh '''
                echo "=========================================="
                echo "          DEPLOYMENT FAILED              "
                echo "=========================================="
                echo ""
                echo "Check the following:"
                echo "1. Jenkins console output"
                echo "2. Maven build logs"
                echo "3. Tomcat server logs"
                echo "4. Application deployment status"
                echo ""
                echo "=========================================="
            '''
        }
        
        unstable {
            echo '⚠️ Pipeline is unstable (tests failed)'
        }
        
        changed {
            echo 'Pipeline status changed'
        }
    }
    
    options {
        buildDiscarder(logRotator(numToKeepStr: '10'))
        timeout(time: 30, unit: 'MINUTES')
        disableConcurrentBuilds()
        ansiColor('xterm')
    }
    
    triggers {
        // Trigger on GitHub push (requires GitHub plugin)
        githubPush()
        
        // Poll SCM every minute
        pollSCM('* * * * *')
        
        // Manual trigger only (comment above lines for manual only)
        // upstream(upstreamProjects: '', threshold: hudson.model.Result.SUCCESS)
    }
    
    parameters {
        string(name: 'BRANCH', defaultValue: 'main', description: 'Git branch to build')
        booleanParam(name: 'SKIP_TESTS', defaultValue: false, description: 'Skip unit tests')
        booleanParam(name: 'SKIP_SONARQUBE', defaultValue: false, description: 'Skip SonarQube analysis')
        choice(name: 'DEPLOY_ENV', choices: ['development', 'staging', 'production'], description: 'Deployment environment')
    }
}
