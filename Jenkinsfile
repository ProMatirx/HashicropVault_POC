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
		 withVault(configuration: [timeout: 60, vaultCredentialId: 'HashiCrop_Vault', vaultUrl: 'http://18.235.248.236:8200'], vaultSecrets: [[path: 'secrets/Dockerhub', secretValues: [[envVar: 'username', vaultKey: 'password']]]])
		 {
          
		  sh 'docker login -u$username -p$password'
			sh "echo $WORKSPACE"
            sh "docker --version"
            sh "docker build -t image-$BUILD_NUMBER ."
			sh "docker tag image-$BUILD_NUMBER muralidevops18/dummy:$BUILD_NUMBER "
            //sh "docker run -itd --name $JOB_NAME-$BUILD_NUMBER -P Image-$BUILD_NUMBER"
			sh "docker push muralidevops18/dummy:$BUILD_NUMBER"
         }
        }
}

