
pipeline {
    agent any
        parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
    }
        environment {
        TF_IN_AUTOMATION      = '1'
        TF_VAR_pagerduty_token    = credentials('pagerduty_token')
        TF_VAR_grafana_admin_password = credentials('grafana_admin_user_pass')
    }

    stages {
        stage('Checkout') {

           steps{
                cleanWs deleteDirs: true, patterns: [[pattern: 'Sandbox_monitoring', type: 'EXCLUDE']]
                git branch: 'master', credentialsId: 'GitHub2', url: 'git@github.com:igorpetutin/monitoring-stack'
            }
        }

Next step
        stage('Plan-grafana') {
            steps {
                script {
                    currentBuild.displayName = params.version
                }
                sh 'export TF_VAR_grafana_admin_password=${TF_VAR_grafana_admin_password}'
                sh 'terraform -chdir=grafana/ init  -input=false'
                sh 'terraform -chdir=grafana/ validate'
                sh "terraform -chdir=grafana/ plan -input=false -out grafana_tfplan.out"
                sh 'terraform -chdir=grafana/ show -no-color grafana_tfplan.out > grafana_tfplan.txt'
            }
        }

        stage('Approval-grafana') {
            when {
                not {
                    equals expected: true, actual: params.autoApprove
                }
            }

            steps {
                script {
                    def plan = readFile 'grafana_tfplan.txt'
                    input message: "Do you want to apply the plan?",
                        parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                }
            }
        }

        stage('Apply-grafana') {
            steps {
                // withCredentials([usernamePassword(credentialsId: 'sb_grafana_admin_user_pass', passwordVariable: 'grafana_admin_password', usernameVariable: 'grafana_admin_user')]) {
                // sh 'export TF_VAR_grafana_admin_password=$grafana_admin_password'
                // sh 'export TF_VAR_grafana_admin_user=$grafana_admin_user' 
                sh 'export TF_VAR_grafana_admin_password=${TF_VAR_grafana_admin_password}'              
                sh "terraform -chdir=grafana/ apply -input=false grafana_tfplan.out"
                // }
            }
        } 

    }

    post {
            always {
                archiveArtifacts artifacts: '*.txt'
            }
        }
}