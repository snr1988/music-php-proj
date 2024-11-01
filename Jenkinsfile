pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE_NAME = 'dhulkifil/music-php-proj'
        DOCKER_IMAGE_TAG = "${env.BUILD_ID}"
    }

    stages {
        stage('git checkout') {
            steps {
                checkout scmGit(branches: [[name: 'main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/dhulkii/music-php-proj.git']])
            }
        }
        
        stage('sonar analysis') {
            steps {
                script{
                    def scannerHome = tool 'sonar-scanner'
                    withCredentials([usernamePassword(credentialsId: 'sonarqube', usernameVariable: 'SONAR_USER', passwordVariable: 'SONAR_PASS')]) {
                        withSonarQubeEnv('sonar-server') {
                        sh """
                        ${scannerHome}/bin/sonar-scanner \
                        -D sonar.projectVersion=1.0-SNAPSHOT \
                        -D sonar.login=$SONAR_USER \
                        -D sonar.password=$SONAR_PASS \
                        -D sonar.projectBaseDir=${env.WORKSPACE} \
                        -D sonar.projectKey=music-php-proj \
                        -D sonar.sourceEncoding=UTF-8 \
                        -D sonar.language=php \
                        -D sonar.sources=. \
                        -D sonar.host.url=http://172.17.0.3:9000/
                        """
                        }
                    }
                }
            }
        }
        
        stage('build docker image'){
            steps {
                script {
                    sh '''
                    docker build -t ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} .
                    '''
                }
            }
        }
        
        stage('Login to Docker Hub') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dhulkifil', variable: 'DOCKER_USERNAME'), 
                                     string(credentialsId: 'docker-pass', variable: 'DOCKER_PASSWORD')]) {
                        sh '''
                        echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin
                        '''
                    }
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    sh '''
                    docker push ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}
                    '''
                }
            }
        }
        
        stage('Run Docker Containers') {
            steps {
                script {
                    sh '''
                    docker run -d --name music-app -p 8007:80 ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}
                    '''
                }
            }
        }
    }
}
