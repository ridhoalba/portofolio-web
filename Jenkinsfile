pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                // Replace this with your build commands
                sh '''
                    ls
                    cd terraform
                    #terraform init
                    #terraform plan
                    #terraform destroy --auto-approve
                    # terraform apply --auto-approve
                    cd ../ansible
                    ansible all -i inventory/hosts -m ping
                '''
            }
        }
        stage('Test') {
            steps {
                // Replace this with your test commands
                sh 'echo "Testing..."'
            }
        }
        stage('Deploy') {
            steps {
                // Replace this with your deployment commands
                sh 'echo "Deploying..."'
            }
        }
    }
    
    post {
        success {
            echo 'Pipeline succeeded! Deploying...'
            // Add any additional actions to take on success
        }
        failure {
            echo 'Pipeline failed! Not deploying...'
            // Add any additional actions to take on failure
        }
    }
}
