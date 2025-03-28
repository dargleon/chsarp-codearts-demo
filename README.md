# CSharp API Demo

This repository contains an example of a C# API that runs on Mono and is integrated with Huawei Cloud CodeArts for building, Docker packaging, image upload to SWR, and deployment.

## Overview

This project demonstrates a complete CI/CD workflow using Huawei Cloud CodeArts. The API is compiled using Mono on a Linux environment, then Dockerized, and finally deployed with the image stored in SWR.

## Repo Structure

```plaintext
.
├── build.sh            # Script for compiling in Mono Linux with CodeArts
├── Dockerfile          # Defines the docker image creation
├── README.md           
└── src
    └── MicroserviceDemo
        ├── MicroserviceDemo.csproj
        ├── Program.cs

```

## Workflow

1. **Compilation:**  
   The API source code is compiled using Mono on a Linux-based CI/CD agent. Dependencies are managed with NuGet, and the project is built in Release mode.

2. **Packaging:**  
   After compilation, the resulting artifacts (such as the executable and debugging symbols) are packaged into an archive file for upload.

3. **Dockerization:**  
   A Docker image is built from a Mono base image, incorporating the compiled artifacts. The container is configured to expose port 5000 for API access.

4. **Image Upload and Deployment:**  
   The Docker image is pushed to the Huawei Cloud SWR registry. Finally, the deployment process in CodeArts pulls the image and starts a container on a Linux machine, mapping the API port to allow external access.

## Key Considerations

- **Mono & NuGet:**  
  The build process runs on a Mono Linux environment with dependencies managed via NuGet.

- **Docker:**  
  The container must correctly map port 5000 to allow external connections to the API.

- **Huawei Cloud CodeArts & SWR:**  
  The solution leverages Huawei Cloud’s tools for continuous integration and deployment, ensuring an end-to-end automated workflow from build to production.

## Resources

- [Mono Documentation](https://www.mono-project.com/docs/)
- [Docker Documentation](https://docs.docker.com/)
- [Huawei Cloud CodeArts](https://support.huaweicloud.com/intl/en-us/codearts/)

---

This project serves as a reference for implementing a complete CI/CD pipeline on Huawei Cloud, integrating native Mono builds, Docker packaging, and automated deployment.
