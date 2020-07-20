node
{
    stage('ContinuousDownload')
    {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/ProMatirx/HashicropVault_POC.git']]])
    }

    stage('ContinuousBuild')
    {
        sh 'mvn package'
    }
        stage('Build IMAGE')
        {
            sh "echo $WORKSPACE"
            sh "docker --version"
            sh "docker build -t Image-$BUILD_NUMBER ."
            sh "docker run -itd --name $JOB_NAME-$BUILD_NUMBER -P Image-$BUILD_NUMBER"

        }
}

