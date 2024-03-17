pipeline {
    agent any
    tools {
        maven 'maven3.8.5'
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn package -DskipTests -B -ntp'
            }
        }
        stage('Testing') {
            steps {
                sh 'mvn test -B -ntp'
            }
            post {                
                success {
                    jacoco()
                    junit 'target/surefire-reports/*.xml'
                }                
                failure {
                    echo 'Ha ocurrido un error TEST'
                }
            }
        }
        stage('Sonarqube + Quality Gate') {
            steps {
                withSonarQubeEnv('sonarqube'){                    
                    sh 'mvn sonar:sonar -B -ntp'
                }      
                timeout(time: 1, unit: 'HOURS'){
                    waitForQualityGate abortPipeline: true
                }          
            }
        }
        stage("Deploy DockerHub"){
            steps{
                script {
                    
                    def pom = readMavenPom file: 'pom.xml'
                    def app = docker.build("jhonpridedev/${pom.artifactId}:${pom.version}")

                    docker.withRegistry('https://registry.hub.docker.com/', 'dockerhub-credentials') {
                        app.push()
                        app.push('latest')
                    }                    

                }
            }
        }
    }
    post {
        success {
            archiveArtifacts artifacts: 'target/*.jar', followSymlinks: false
            deleteDir()
        }
    }
}
