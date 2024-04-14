# Application Setup Guide

## Task Overview

This document provides instructions for dockerizing your application, configuring it to use a database, and deploying it using Kubernetes. Specific details for each task are outlined below.

## Tasks

### Task 1: Dockerize the Application

**Objective:** Create a Docker container image for the application using a multi-stage Dockerfile.

- **Understand Multi-Stage Builds:** Research and comprehend the benefits of multi-stage builds
- **Create Dockerfile:** Develop a multi-stage Dockerfile for your application, focusing on including only the necessary components in the final image to ensure it is lightweight and secure.


### Task 2: Configure the Application for Database Usage

**Objective:** Modify the application to connect to either a MySQL or PostgreSQL database.

**Steps:**
1. **Database Selection:** Choose between MySQL and PostgreSQL for the application.
2. **Configuration Updates:** Update the application’s configuration files or environment variables to include the database connection details.

### Task 3: Deploy the Application and Database on Kubernetes

**Objective:** Deploy the application and its database on Kubernetes, using ConfigMaps for configuration data and Secrets for sensitive information.

**Steps:**
1. **Create ConfigMap:** Define a ConfigMap in Kubernetes to store the database name and user.
2. **Create Secret:** Define a Secret in Kubernetes to store the database password securely.
3. **Deployment Configuration:** Create deployment configurations for both the application and the chosen database.
4. **Deploy on Kubernetes:** Use the configurations to deploy the application and database on Kubernetes.
5. **Verify Deployment:** Ensure the application is running correctly and can connect to the database within the Kubernetes environment.

### Task 4: Verify Application Functionality Locally

**Objective:** Ensure that the application is running correctly on your local machine and can be accessed through a web browser.

**Steps:**
1. **Access in Browser:** Open your web browser and navigate to the application's adress(use service expose or ingress).
2. **Test Features:** Add an owner and a pet in the PetClinic application to ensure it is functioning correctly.

### Task 5: Validate Database Connectivity and Data

**Objective:** Connect to the database using a database client and verify that the new data has been correctly added.

**Steps:**
1. **Connect to Database:** Use a database client like DBeaver, pgAdmin, or MySQL Workbench to connect to your database.
2. **Inspect Data:** Navigate through the database tables to find the newly added owner and pet records.

### Task 6: Implement CI/CD with Self-Hosted Runners

**Objective:** Automate the deployment process using GitHub Actions with self-hosted runners, ensuring privacy and security for the git repository and Docker image registry.

1. **Self-Hosted Runner Setup:**
   - Install on a local machine or Kubernetes.
2. **GitHub Actions Workflow Configuration:**
   - Trigger on changes to the main branch.
3. **Secure Workflow:**
   - Store sensitive data like credentials in GitHub Secrets.
4. **Docker Image Handling:**
   - Build and push the Docker image using the self-hosted runner.
   - Use private registry credentials 
5. **Kubernetes Deployment:**
   - Deploy the Docker image to Kubernetes.

This setup ensures that changes to the main branch automatically trigger secure, efficient CI/CD processes via self-hosted runners.

