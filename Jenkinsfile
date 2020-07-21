node
{
    stage('Git CheckOut')
    {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'GitCred', url: 'https://github.com/ProMatirx/HashicropVault_POC.git']]])
    }

    stage('Maven Build')
    {
        sh 'mvn package'
    }
        stage('Build IMAGE')
        {
		 
	 withVault(configuration: [timeout: 60, vaultCredentialId: 'HashiCrop_Vault', vaultUrl: 'http:/4.207.222.190:8200'], vaultSecrets: [[path: 'secrets/Dockerhub', secretValues: [[vaultKey: 'username'], [vaultKey: 'password']]]])
		 {
          
		    sh "docker login -u $username -p $password"
			sh "echo $WORKSPACE"
            sh "docker --version"
            sh "docker build -t image-$BUILD_NUMBER ."
			sh "docker tag image-$BUILD_NUMBER muralidevops18/dummy:$BUILD_NUMBER "
            //sh "docker run -itd --name $JOB_NAME-$BUILD_NUMBER -P Image-$BUILD_NUMBER"
			sh "docker push muralidevops18/dummy:$BUILD_NUMBER"
         }
        }
}

