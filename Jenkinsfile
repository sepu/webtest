pipeline {
    agent any
    stages {
        stage('Levanta Web') {
            steps {
                echo 'Generando imagen'
		sh 'docker build -t webcontainer $WORKSPACE"'
		echo 'Arrancando contenedor web'
		sh 'docker run --name webprueba -p 80:80 -d webcontainer'
            }
        }
    	stage('Levanta JMeter y lanza pruebas rendimiento') {
	    steps {
		echo 'Levantando JMeter'
		sh 'docker run --name jmeter -i -v $JENKINS_HOME/techday/jmeter/test:/home/jmeter/apache-jmeter-5.4.3/test jmeter/docker:5.4.3'
	    }
	}
     }
     post {
        always {
            echo 'Parando y limpiando contenedores'
	    sh 'docker stop webprueba'
	    sh 'docker rm webprueba'
            sh 'docker stop jmeter'
            sh 'docker rm jmeter'
        }
        success {
            echo 'TODO FUE OK'
        }
        failure {
            echo 'ALGO HA FALLADO'
        }
     }
}
