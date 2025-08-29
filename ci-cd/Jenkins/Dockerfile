# Use official Jenkins LTS image
FROM jenkins/jenkins:lts

# Optionally, install plugins or tools here
# Example: install Docker CLI (if Jenkins needs to build/push images)
USER root
RUN apt-get update && apt-get install -y docker.io

# Switch back to Jenkins user
USER jenkins