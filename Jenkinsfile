# Jenkinsfile
# Jenkins pipeline to deploy EC2 via Terraform using AWS credentials from Jenkins

pipeline {
    agent any

    environment {
        AWS_CREDENTIALS = credentials('aws-access-key')
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/PradeepReddyGunna/terraform-ec2-project.git'
            }
        }

        stage('Terraform Init, Validate, Apply') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-access-key']]) {
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
