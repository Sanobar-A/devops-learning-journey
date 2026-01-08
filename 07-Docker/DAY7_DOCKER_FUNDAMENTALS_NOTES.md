📘 Day 7 – Docker Fundamentals (From Scratch → DevOps Ready)

These notes explain **what Docker is**, **why it exists**, **how it works internally**, and **how DevOps engineers think about containers**.

---

## 1. The Problem Docker Solves (Very Important)

Before Docker, developers faced this problem:

> “It works on my machine, but not on the server.”

Reasons:

* Different OS
* Different library versions
* Missing dependencies
* Environment mismatch

Docker solves this by **packaging everything together**.

---

## 2. What is Docker?

**Docker** is a platform that allows you to:

* Package an application
* Along with its dependencies
* Into a single unit called a **container**

This container runs **the same everywhere**.

---

## 3. Docker vs Virtual Machine (Core Concept)

### Virtual Machine (VM)

* Has full OS
* Heavy
* Slow to start
* Uses more resources

### Docker Container

* Shares host OS kernel
* Lightweight
* Starts in seconds
* Uses fewer resources

📌 Containers are **NOT VMs**.

---

## 4. Key Docker Terminology (Must Know)

| Term          | Meaning                            |
| ------------- | ---------------------------------- |
| Image         | Blueprint of an app                |
| Container     | Running instance of an image       |
| Dockerfile    | Instructions to build an image     |
| Docker Engine | Runtime that runs containers       |
| Registry      | Place to store images (Docker Hub) |

---

## 5. What is a Docker Image?

A **Docker image** is:

* Read-only
* Immutable
* A template

It contains:

* OS libraries
* Runtime (Node, Python, Java, etc.)
* Application code
* Configuration

Images do **not run** by themselves.

---

## 6. What is a Docker Container?

A **container** is:

> A running instance of a Docker image

Think:

* Image = class
* Container = object

Multiple containers can run from **one image**.

---

## 7. Dockerfile (Heart of Docker)

A **Dockerfile** is a text file with instructions to build an image.

Example:

```Dockerfile
FROM ubuntu:22.04
RUN apt update
CMD ["echo", "Hello Docker"]
```

Docker reads this file **top to bottom**.

---

## 8. Docker Image Layers (Important Concept)

Each instruction in a Dockerfile creates a **layer**.

Benefits:

* Caching
* Faster builds
* Smaller images

Docker reuses layers when possible.

---

## 9. Docker Engine Architecture (High Level)

Docker Engine consists of:

* Docker CLI (client)
* Docker daemon (server)
* Container runtime

When you run a Docker command:

1. CLI sends request
2. Daemon processes it
3. Container runs

---

## 10. Docker Registry

A **registry** stores Docker images.

Most popular:

* Docker Hub

Examples:

```text
ubuntu
nginx
node
python
```

You pull images from a registry.

---

## 11. Why DevOps Engineers Love Docker

Docker provides:

* Consistency
* Portability
* Fast deployments
* Easy CI/CD integration
* Scalability

Docker is the **bridge between development and operations**.

---

## 12. Docker in CI/CD Pipelines

In CI/CD, Docker is used to:

* Build images
* Run tests inside containers
* Push images to registries
* Deploy containers

This ensures:

> Same environment from CI → production

---

## 13. Docker vs Bare Metal Deployment

| Feature     | Without Docker | With Docker |
| ----------- | -------------- | ----------- |
| Setup time  | High           | Low         |
| Consistency | Poor           | Excellent   |
| Rollback    | Hard           | Easy        |
| Scaling     | Manual         | Simple      |

---

## 14. Common Beginner Misconceptions

❌ Docker is a VM
❌ Docker replaces Linux
❌ Docker images are containers
❌ Docker runs only on Linux servers

---

## 15. Docker Mental Model (VERY IMPORTANT)

Think of Docker as:

```
Code + Dependencies + OS libs
            ↓
         Docker Image
            ↓
        Running Container
```

---

## 16. Real DevOps Docker Workflow

1. Write Dockerfile
2. Build image
3. Test container
4. Push image to registry
5. Deploy container
6. Monitor & scale

This workflow is universal.

---

## 17. Docker + Kubernetes (Preview)

* Docker creates containers
* Kubernetes manages containers

📌 Docker is **mandatory before Kubernetes**.

---

## 18. One-Page Revision Summary

* Docker packages apps + dependencies
* Images are templates
* Containers are running instances
* Dockerfiles define images
* Containers are lightweight
* Docker is CI/CD friendly

