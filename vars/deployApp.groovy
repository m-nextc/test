def call(String environment, String appName) {
    echo "ce msg from deployApp Deploying ${appName} to ${environment}"
  //  sh "kubectl apply -f deployments/${environment}/${appName}.yaml"
}
  
