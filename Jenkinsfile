node ('jslave1') {
	
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
	   	pwd
	   	cp docker/Dockerfile ./Dockerfile
	   	docker build -t "spring-petclinic" .
	   """
	}
	
}
