# Next.js Application with Docker and OrbStack

The entire development environment is containerized using Docker and OrbStack for a consistent and high-performance developer experience. The goal of this project is to create a seamless workflow from local to production.

## Why a Containerized Development Environment?

Containerizing a development environment offers several key advantages over installing Node.js directly on your system:

* Consistency: The application runs in a predefined environment (the Docker image), ensuring that all developers on the team are using the exact same versions of Node.js (v22), npm, and other dependencies. This eliminates the "it works on my machine" problem.

* Isolation: The containerized environment is isolated from your host machine's system. You can have multiple projects with different Node.js versions and dependencies without them conflicting with each other. This is especially useful for projects that require older Node.js versions.

* Version Management: Tools like nvm are great for managing different Node.js versions on your system. However, a container ensures that the project-specific version is always used, even if your global nvm alias is set to a different version. This removes the need for manual version switching.

* Cleanliness: Your host machine remains clean of project-specific dependencies. The node_modules folder and its thousands of files live inside the container, not on your local file system, which can be a significant performance and resource-saving benefit.

* Portability: The project can be run on any machine with Docker (or a compatible tool like OrbStack) installed, making it easy to onboard new team members or move development to a different computer.

For this project, I recommend using OrbStack on macOS or Linux for a superior experience. It's a faster, more lightweight drop-in replacement for Docker Desktop with better file system performance, which is crucial for Next.js's Hot Module Replacement (HMR).

## Prerequisites

To run this project, you will need OrbStack or Docker Desktop

## Getting Started

### Start the Docker Containers

The project uses a docker-compose.yml file to define the development environment. This command will build the Docker image (using Node.js v22) and start the Next.js development server. The --build flag is important for the first time you run it.

```docker-compose up --build```

Note: You can omit the --build flag on subsequent runs for faster startup: docker-compose up.

### Access the Application

Once the containers are up and running, you can access the application in your browser at: `http://localhost:3000`

## Development Workflow

* Hot Module Replacement (HMR): The development setup is configured for HMR. Any changes you make to the source files on your local machine will be automatically synchronized with the container, and the changes will appear instantly in your browser without a manual refresh.

* Committing Changes: All project files exist on your local machine, outside of the Docker container. This allows you to use your preferred IDE's Git tools or the command line to stage, commit, and push your changes to GitHub as you normally would.

* Stopping the Containers: To stop the running containers, simply press Ctrl + C in your terminal. To stop and remove the containers, run: `docker-compose down`

## Further Information

* GitHub branch protection on both master & staging.
* Dependabot alerts for package vunerabilities.

## Branch naming

* `/feat`: New features
* `/fix`: Bug fixes in dev/staging/prod
* `/docs`: Doc changes such as readme or component
* `/chore`: Housekeeping, dependency updates, build config
* `/refactor`: Code restructure, no functionality changes
* `/test`: Adding or modifying tests