def BRANCH_NAME = "master"
def GIT_URL = "https://github.com/widdix123/test.git"

node ('master') {
	 environment {
    		registry = "docker_hub_account/repository_name"
    		registryCredential = 'dockerhub'
  	}
	
	stage ('Cleanup') {
		deleteDir()	
	}
	stage ('Prep') {
	    sh """
	        docker --version
	        ansible --version
	    """
	}
		
	stage('Spring PetClinic Checkout'){
	   dir('spring-petclinic') {
        	git url: 'https://github.com/spring-projects/spring-petclinic.git'
    	   }
	   dir('demo') {
        	//git url: 'https://github.com/spring-projects/spring-petclinic.git'
		checkout scm
    	   }
	}
	
	stage('Docker prep'){
	   sh """
	   	cp demo/Dockerfile ./Dockerfile
	   	#docker build -t "spring-petclinic" .
	   """
	}
	
	stage('Docker push'){

	   withCredentials([usernamePassword( credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
		   
		sh """
			docker login -u ${USERNAME} -p ${PASSWORD}
			docker tag spring-petclinic gupta220/myhub:r1
			#docker push gupta220/myhub:r1
		"""
	    }
	}
}

timeout(time: 15, unit: "MINUTES") {
    input message: 'Do you want to approve the deploy in production?', ok: 'Yes'
}

node('master') { 
    stage('Deploy') {
        dir('demo') {
		checkout scm
    	}
	sh """
		pwd
	
	"""
    }
}
