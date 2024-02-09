pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                // Replace this with your build commands
                sh '''
                    ls
                    #ssh-keygen -f portofolio-web -N '' -y
                    #cat portofolio-web
                    cd terraform
                    #terraform init
                    #terraform plan
                    #terraform destroy --auto-approve
                    #terraform apply --auto-approve
                    cd ../ansible
                    ls
                    #rm /root/.ssh/known_hosts
                    #touch /root/.ssh/known_hosts
                    #ansible all -i inventory/hosts --list-hosts
                    #ansibleAdhoc credentialsId: 'portofolio-web', disableHostKeyChecking: true, inventory: '/root/.jenkins/workspace/portofolio-web/ansible/inventory/hosts', hosts: 'all', module: 'ping'
                    #ansibleAdhoc('ansible all -i inventory/hosts -m ping')
                    #ansible all -i inventory/hosts -m ping
                '''
                // script {
                //     // Menunggu selama 5 menit (300 detik)
                //     sleep time: 300, unit: 'SECONDS'
                // }
            }
        }
        stage('Test') {
            steps {
                // Replace this with your test commands
                sh 'echo "Testing..."'
                ansiblePlaybook credentialsId: 'portofolio-web', disableHostKeyChecking: true, installation: 'ansible', inventory: '/root/.jenkins/workspace/portofolio-web/ansible/inventory/hosts', playbook: '/root/.jenkins/workspace/portofolio-web/ansible/playbook/ping.yaml', vaultTmpPath: ''
                ansiblePlaybook credentialsId: 'portofolio-web', disableHostKeyChecking: true, installation: 'ansible', inventory: '/root/.jenkins/workspace/portofolio-web/ansible/inventory/hosts', playbook: '/root/.jenkins/workspace/portofolio-web/ansible/playbook/apache-playbook.yaml', vaultTmpPath: ''
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
