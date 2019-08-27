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
	}
	
}
