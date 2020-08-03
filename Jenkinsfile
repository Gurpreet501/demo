node{
	
	def buildnumber=BUILD_NUMBER
    def mavenHome = tool name: 'Maven', type: 'maven'
    def mavenCommand = "${mavenHome}/bin/mvn "

stage("checkout"){
git  url: 'https://github.com/Gurpreet501/demo.git'
}
