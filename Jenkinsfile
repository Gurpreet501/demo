node{
	
	def buildnumber=BUILD_NUMBER
    def mavenHome = tool name: 'Maven', type: 'maven'
    def mavenCommand = "${mavenHome}/bin/mvn "

stage("checkout"){
git  url: 'https://github.com/Gurpreet501/demo.git'
}

stage("build"){
sh "${mavenCommand} clean package"
}

stage("docker image creation"){
  sh "docker build -t gurpreet501/demo:${buildnumber} ."
}

stage("docker image push to dockerhub")
{
	withCredentials([string(credentialsId: 'dockerhubcredentail', variable: 'docker')]) {
    sh "docker login -u gurpreet501 -p ${docker} "
}
 sh "docker push gurpreet501/demo:${buildnumber}"
}

stage("Running Application"){
            sshagent(['dockerserver']) {
                sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.41.135 docker rm -f javawebappcontainer || true"
                sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.41.135 docker run -d -p 9001:9001 --name javawebappcontainer gurpreet501/demo:${buildnumber}"
            }
        }


}

