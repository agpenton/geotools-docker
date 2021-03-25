pipeline {
    //agent any
    agent {
        label 'wk1'
    }
    stages {
        stage('Build') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/agpenton/geotools-docker.git']]])            }
        }
        stage('PostGIS') {
            steps {
                //step([$class: 'DockerComposeBuilder', dockerComposeFile: 'docker-compose.yml', option: [$class: 'StartAllServices'], useCustomDockerComposeFile: false])
                sh "docker-compose down --remove-orphans"
		sh "docker-compose up -d"
                sh "docker-compose logs -f geotools"
		sh "docker-compose down --remove-orphans"
            }
        }
    }
}
