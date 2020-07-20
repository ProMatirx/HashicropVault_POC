node
{
    stage('ContinuousDownload')
    {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/MuraliKarre/maven.git']]])
    }
    
    stage('ContinuousBuild')
    {
        sh 'mvn package'
    }
	stage('Build IMAGE')
	{
	    sh "echo $WORKSPACE"
		sh "docker --version"
	
	}
	

