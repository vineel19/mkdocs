pipeline {

  agent (label 'node1')

  stages {

    def app

    stage('Clone repository') {
        /* We need to have the repository cloned to our workspace */

        checkout scm
    }


    stage('Build image') {
        /* This builds the docker image */

        app = docker.build("image_name_mkdocs")
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image */

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        /* Finally, we'll push the image to JFROG Artifactory
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */

        docker.withRegistry('https://artifactory.com', 'artifactory-credentials') {
            
	    app.push("${env.BUILD_NUMBER}")

            app.push("latest")
          }
       }
    } 
}
