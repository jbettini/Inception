### Inception
## Overview

Inception is a project designed to set up a small infrastructure composed of different Docker containers. This project aims to provide an understanding of containerization by deploying multiple services using Docker Compose.
## Features

-   Sets up a multi-container environment using Docker.
-   Includes services such as Nginx, WordPress, and MySQL.
-   Utilizes Docker Compose for managing services.
-   Provides a foundation for understanding container orchestration and management.

## Prerequisites

-   A Unix-like operating system.
-   Docker and Docker Compose installed.
-   Basic knowledge of Docker and containerization.

## Installation
```
git clone https://github.com/jbettini/Inception.git;
cd Inception;
docker-compose up --build
```
## Usage

After starting the containers, you can access the services through the specified ports. For example, the Nginx server might be accessible at http://localhost.

## Project Structure

-   srcs/: Contains the Dockerfiles and configuration files for the different services.
-   docker-compose.yml: Configuration file for Docker Compose.