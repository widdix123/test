node ('jslave1') {
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
	   	docker build -t "spring-petclinic" .
	   """
	}
	
	stage('Docker push'){
	   sh """
	   	docker tag spring-petclinic gupta220/myhub:latest
		docker push gupta220/myhub:latest
	   """
	}
	
}
