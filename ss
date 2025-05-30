sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
sudo apt-get remove --purge jenkins -y

sudo ansible-playbook -i hosts.ini setup.yml
ls -l /var/lib/jenkins/deployment/

it remote set-url origin https://SeiaShibu:github_
pat_11BFEKM4Q0XQekiiSwzjyk_Vhya1RZjy9U5yGOsy4651RLZiuY528yVdXl3l8wbf4N2VZLLIOD53chT0RI@github.com/SeiaShibu/maven11.git

- `**/target/surefire-reports/*.xml`
- For Gradle: `**/test-results/**/*.xml`


pipeline {
    agent any 

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/devops-ds/your-maven-project.git', branch: 'main' // Replace with your repo URL if different, adjust branch name if needed
                
            }
        }

        stage('Build') {
            steps {
               
                sh '/usr/bin/mvn clean package' 
            }
        }

        stage('Test') {
            steps {
                
                echo 'Tests are typically run during the Build stage with Maven.'
            }
        }
    }
    post {
        always {
            junit '**/target/surefire-reports/*.xml'
        }
        success {
            echo 'Build and tests succeeded!'
        }
        failure {
            echo 'Build or tests failed.'
        }
    }
}
