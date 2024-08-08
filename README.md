# Docker Python Runner

The goal of this project is to be able to quickly clone and run your Python project while still taking advantage of all the benefits that come with Docker. This is ideal for smaller and simpler projects that you may see rapid iteration.

## Features

- GitHub repository is cloned at runtime allowing new commits to be deployed by simply restarting the container
- Installs any additional Python packages needed for your project

## Usage

### Getting the image

A prebuilt docker image is [available on docker hub](https://hub.docker.com/r/roseatoni/docker-python-runner).

```
docker pull roseatoni/docker-python-runner
```

### Environment Variables

- (Required) REPO_URL

  - For public repositories, the link to the repo is enough. For example:

    ```
    https://github.com/render-examples/flask-hello-world
    ```

  - For private repositories, a GitHub access token is needed. A guide on how to create an access token can be found [here](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens). Once you have the token, insert it into the repo link. For example:

    ```
    https://[TOKEN]@github.com/render-examples/flask-hello-world
    ```

- (Optional) PYTHON_PACKAGES

  - A space-separated list of additional Python packages to install. For example, if you were running a project whose dependencies were numpy and pandas, you would set PYTHON_PACKAGES to

    ```
    numpy pandas
    ```

### Running

#### Docker Run

```
docker run --rm -e REPO_URL="https://github.com/render-examples/flask-hello-world" -e PYTHON_PACKAGES="numpy pandas" roseatoni/docker-python-runner
```

#### Docker Compose

```
version: '3.8'

services:
  python-runner:
    image: roseatoni/docker-python-runner
    environment:
      REPO_URL: "https://github.com/render-examples/flask-hello-world"
      PYTHON_PACKAGES: "numpy pandas"
    restart: "unless-stopped"

```
