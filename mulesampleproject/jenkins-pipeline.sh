			
def server = Artifactory.server 'Art'

def rtMaven = Artifactory.newMavenBuild()

def buildInfo

pipeline {
    agent any

	tools {
		jdk "java"
		maven "maven"
	}

    stages {
     
       stage ('git Clone') {
           steps{
	      	   git branch: 'master',
               url: 'https://github.com/YugandharaP/Mulesoft.git'
              
           }
       }
	   stage('Execute Maven') {
		 steps{
		script {
		
		rtMaven.run pom: 'mulesampleproject/pom.xml', goals: 'clean install deploy -DmuleDeploy -Danypoint.username=s32 -Danypoint.password=Shru@1234', buildInfo: buildInfo
			}
	   } 
       }	   
     }
}
