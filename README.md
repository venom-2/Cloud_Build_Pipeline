# Introduction 
A CloudBuild pipeline have been created that is present inside the cloudbuild.yaml file, a docker file is created to generate a docker image of the source code present in the the app.py file, the requirements.txt file contains the libraries that are required for this application.

# Getting Started
To run the application using the CI/CD pipeline and invoking it manually using the Google Cloud CLI, follow the steps below:
1.	Create a virtual environment inside the root directory and install the libraries inside the environment using the command:

```
pip install -r requirements.txt
```

2.	Install the Google Cloud CLI to interact with the cloud platform from the terminal and set the path so that it can accessed globally.

# CloudBuild Pipeline 
This cloudbuild pipeline includes four steps:
1. Installing the dependencies using requirements.txt file
2. Building the docker image using the docker file with the help of cloud builders.
3. Pushing the docker images in the artifact registry of GCP
4. Deploying it to the Cloud Run with the name 'helloworld' in the region 'us-central1' and allowing unauthenticated access to the deployed image, it will provide you a Service URL.

-> You can access your docker images here: us-central1-docker.pkg.dev/${PROJECT_ID}/my-docker-repo/my-image
-> To check the metrics of deployed container go to Cloud Run

Note: In the Cloud Build settings enable the Cloud Run Admin role so that container can be deployed using the cloud build pipeline, otherwise it will show permission denied.

# Docker File
The docker file is used to create the docker image of the source code, it uses python version 3.9, the working directory for this is /app.
This file will copy the requirements.txt file and source code the image and run the application using CMD command mentioned in the docker file.

After deployement port: 8080 will be exposed to Internet so users can access that.

# Build and Test
To submit your CloudBuild pipeline or we can say to check the CI/CD pipeline you have to write the below command:

```
gcloud builds submit --region=us-central1 --config=cloudbuild.yaml .
``` 

The . at the end specifies that the source code is in the current directory.

Refer these documentations:
- [Cloud Build configurations](https://cloud.google.com/build/docs/configuring-builds/create-basic-configuration)
- [Installing Google Cloud CLI](https://cloud.google.com/sdk/docs/install-sdk)
- [Containerize Python Application](https://cloud.google.com/build/docs/building/build-containerize-python)