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

        stage('Destroy Infrastructure') {
            when {
                expression {
                    return params.DESTROY == true
                }
            }
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-access-key']]) {
                    sh 'terraform destroy -auto-approve'
                }
            }
        }
    }

    parameters {
        booleanParam(name: 'DESTROY', defaultValue: false, description: 'Check this box to destroy infrastructure')
    }
}
