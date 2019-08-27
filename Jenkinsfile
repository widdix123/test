node ('jslave1') {
	
	stage ('Prep') {
	    sh """
	        docker --version
	        ansible --version
	    """
	}
	
	stage ('Code Checkout') {
	     checkout scm: [$class: 'GitSCM', branches: [[name: '*/master']], userRemoteConfigs: [[url: 'https://github.com/spring-projects/spring-petclinic.git']]]
	     
	}
	
	
	stage('Dockerfile Code Checkout'){
	    sh """
	    	pwd
	    """
	}
	
}
