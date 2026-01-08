📘 Day 7 – Dockerfile

This document explains Dockerfiles, how Docker builds images, and how DevOps engineers write clean, efficient, production-ready Dockerfiles.

1. What is a Dockerfile?

A Dockerfile is:

A plain text file

Containing instructions

That tell Docker how to build an image

📌 Dockerfile → Image → Container

2. Why Dockerfile Exists (Core Reason)

Without Dockerfile:

Image creation is manual

Environment is inconsistent

CI/CD becomes unreliable

Dockerfile ensures:

Same build, every time, everywhere

3. How Docker Reads a Dockerfile

Docker reads Dockerfile:

From top to bottom

Line by line

Each instruction creates a layer

Order matters.

4. Basic Dockerfile Structure
FROM base-image
WORKDIR /app
COPY files
RUN commands
CMD command


This pattern appears everywhere.

5. FROM – Base Image (MANDATORY)
Purpose
FROM ubuntu:22.04


Sets base OS/runtime

Every Dockerfile MUST start with FROM (except scratch)

Examples:

FROM node:18
FROM python:3.11
FROM nginx:latest


📌 Choose smallest image possible.

6. WORKDIR – Working Directory
Purpose
WORKDIR /app


Sets working directory inside image

Replaces repeated cd commands

If directory doesn’t exist → Docker creates it.

7. COPY – Copy Files Into Image
Syntax
COPY source destination

Example
COPY app.py /app/


Copies from host → image

Used for application code

📌 Prefer COPY over ADD.

8. RUN – Execute Commands at Build Time
Purpose
RUN apt update && apt install -y curl


Runs commands while building image

Creates a new image layer

Used for:

Installing packages

Compiling code

Setup tasks

9. CMD – Default Command (Runtime)
Purpose
CMD ["python", "app.py"]


Runs when container starts

Can be overridden at runtime

Only one CMD is effective (last one wins).

10. ENTRYPOINT (Intro Level)
Purpose
ENTRYPOINT ["python", "app.py"]


Makes container behave like an executable

Harder to override than CMD

📌 Beginners should focus on CMD first.

11. Build vs Run (VERY IMPORTANT)
Instruction	When it runs
RUN	Image build time
CMD	Container run time

This distinction is CRITICAL.

12. Complete Simple Dockerfile Example
FROM ubuntu:22.04

WORKDIR /app

COPY first-script.sh .

RUN chmod +x first-script.sh

CMD ["bash", "first-script.sh"]

What this does

Uses Ubuntu

Sets /app

Copies script

Makes executable

Runs script when container starts

13. Build the Image
docker build -t my-first-image .


Explanation:

-t → tag name

. → current directory as build context

14. Run the Container
docker run my-first-image


Output:

Same output as running script locally

15. Docker Build Context (IMPORTANT)

. means:

Send current directory to Docker daemon

📌 Don’t keep unnecessary files in build context.

Use .dockerignore later.

16. Image Layers & Caching (Important Concept)

Each Dockerfile line = one layer.

If a line doesn’t change:

Docker reuses cache

Build is faster

Best practice:

Put rarely changing lines first

Frequently changing lines last

17. Common Beginner Mistakes

❌ Forgetting FROM
❌ Using large base images
❌ Too many RUN commands
❌ Copying unnecessary files
❌ Confusing RUN vs CMD

18. DevOps Best Practices (Beginner Level)

Use official images

Use minimal images

Combine RUN commands

Keep Dockerfile readable

Version control Dockerfile

19. Dockerfile Mental Model (Remember This)

Think of Dockerfile as:

Install OS
↓
Install dependencies
↓
Copy code
↓
Set startup command

20. One-Page Revision Summary

Dockerfile defines image

FROM is mandatory

RUN = build time

CMD = run time

COPY brings code in

WORKDIR sets location

Order matters
