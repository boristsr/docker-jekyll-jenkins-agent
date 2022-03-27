pipeline {
    //Run only on docker agents compatible with jekyll
    agent { label 'docker' }

    options {
        timeout(time: 1, unit: 'HOURS') 
    }

    environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub-accesstoken')
	}

    stages {
        stage('Build Image') {
            steps {
                //Execute build
                sh 'docker build -t jenkins-gh-slave:latest .'
            }
        }
        stage('Login') {
			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}
        stage('Push Image') {
            steps {
                sh 'docker push jenkins-gh-slave:latest'
            }
        }
    }

    post {
		always {
			sh 'docker logout'
		}
	}
}