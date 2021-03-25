pipeline {
    //agent any
    agent {
        label 'wk1'
    }
    parameters {
       gitParameter branch: '', branchFilter: '.*', defaultValue: 'main', description: '', name: 'BRANCH', quickFilterEnabled: false, selectedValue: 'NONE', sortMode: 'DESCENDING_SMART', tagFilter: '*', type: 'PT_BRANCH', useRepository: 'https://github.com/agpenton/geotools-docker.git'
    }
    stages {
        stage('Build') {
            steps {
                checkout([$class: 'GitSCM',
                          branches: [[name: "${params.BRANCH}"]],
                          doGenerateSubmoduleConfigurations: false,
                          extensions: [],
                          gitTool: 'Default',
                          submoduleCfg: [],
                          userRemoteConfigs: [[url: 'https://github.com/agpenton/geotools-docker.git']]
                        ])
            }
        }
        stage('PostGIS') {
            steps {
                //step([$class: 'DockerComposeBuilder', dockerComposeFile: 'docker-compose.yml', option: [$class: 'StartAllServices'], useCustomDockerComposeFile: false])
                sh "docker-compose up -d"
                sh "docker-compose logs -f geotools"
            }
        }
    }
}
