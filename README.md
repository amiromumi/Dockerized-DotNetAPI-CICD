# CI/CD Dockerized DotNet API
A simple .NET API with GitHub Actions CI/CD pipeline that automatically builds and pushes Docker images to Docker Hub.

## How to Run (Using Docker CLI)
1. **Pull the image from Docker Hub:**  
   ```sh
   docker pull amiromumi/dockerized-dotnetapi-cicd::latest
   ```

2. **Run the Docker container:**  
   ```sh
   docker run -d -p 2503:80 --name mydockerapi-container-cicd amiromumi/dockerized-dotnetapi-cicd:
   ```

3. **Access the API:**  
   - Open your browser and go to: [http://localhost:2503](http://localhost:2503)  
   - For environment check, visit: [http://localhost:2503/env](http://localhost:2503/env)

## CI/CD Pipeline
This project includes a GitHub Actions workflow that:
- Builds the Docker image on every push to the `master` branch.
- Automatically pushes the image to Docker Hub using your credentials.

Workflow file path:
```
.github/workflows/ci-dockerized-dotnet-api.yml
```

## Environment Configuration
By default, the API runs in **Production mode** inside the Docker container.  
You can override this by passing an environment variable:

```sh
docker run -d -p 2503:80 -e ASPNETCORE_ENVIRONMENT=Development --name mydockerapi-container-cicd amiromumi/dockerized-dotnetapi-cicd:
```

Check environment by visiting:  
- [http://localhost:2503/env](http://localhost:2503/env)

## Logging Configuration
The application logs are stored inside the container:
- Path: `/app/logs/log.txt`
- Automatically creates the folder if it doesn't exist

## Project Structure
```
CI-CD-DotNetAPI/
│-- .github/
│   └── workflows/
│       └── ci-dockerized-dotnet-api.yml
│-- Dockerfile
│-- Dockerized-DotNetAPI.csproj
│-- Program.cs
│-- logs/ (generated at runtime)
```

## Notes
- Demonstrates CI/CD using GitHub Actions with Docker Hub integration.
- Supports both manual Docker CLI execution and automated image builds.
- Make sure Docker is installed and the container port is available.

