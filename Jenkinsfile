pipeline {
    agent any

    environment {
        AWS_CREDENTIALS = credentials('aws-creds')
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/PradeepReddyGunna/terraform-ec2-project.git'
            }
        }

        stage('Terraform Init, Validate, Apply') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-creds']]) {
                    sh '''
                        terraform init
                        terraform validate
                        terraform plan -out=tfplan
                        terraform apply -auto-approve
                    '''
                }
            }
        }
    }
}

