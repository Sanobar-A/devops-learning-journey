 📘 Day 7 – Docker Commands

This document explains **essential Docker commands**, what they do, **why they exist**, and how DevOps engineers use them.

---

## 1. `docker run` – MOST IMPORTANT COMMAND

### What it does

`docker run`:

* Creates a container
* Starts the container
* Runs a command inside it

All in **one command**.

---

### Example

```bash
docker run hello-world
```

### What Docker does internally

1. Pulls image (if missing)
2. Creates container
3. Runs container
4. Stops container

---

### Syntax

```bash
docker run [options] image [command]
```

---

## 2. `docker ps` – View Running Containers

### Command

```bash
docker ps
```

### Shows

* Only **running** containers

---

### Example Output

```text
CONTAINER ID   IMAGE   STATUS
```

📌 If nothing shows → no containers are running.

---

## 3. `docker ps -a` – View ALL Containers

### Command

```bash
docker ps -a
```

### Shows

* Running containers
* Stopped containers
* Exited containers

📌 This is used **very frequently**.

---

## 4. `docker images` – View Images

### Command

```bash
docker images
```

### Shows

* Images downloaded locally
* Image size
* Tags

---

### Example Output

```text
REPOSITORY      TAG       IMAGE ID
hello-world    latest    abc123
```

---

## 5. `docker pull` – Download Image

### Command

```bash
docker pull nginx
```

### Meaning

* Downloads image from Docker Hub
* Does NOT start a container

---

### Difference: pull vs run

| Command     | Pulls Image | Runs Container |
| ----------- | ----------- | -------------- |
| docker pull | ✅           | ❌              |
| docker run  | ✅           | ✅              |

---

## 6. `docker stop` – Stop Running Container

### Command

```bash
docker stop <container_id>
```

Gracefully stops a running container.

---

### Example

```bash
docker stop a1b2c3d4
```

---

## 7. `docker start` – Start Stopped Container

### Command

```bash
docker start <container_id>
```

Restarts an existing container.

📌 Does NOT create a new one.

---

## 8. `docker rm` – Remove Container

### Command

```bash
docker rm <container_id>
```

Deletes a **stopped** container.

---

### Remove multiple containers

```bash
docker rm id1 id2 id3
```

---

## 9. `docker rmi` – Remove Image

### Command

```bash
docker rmi image_name
```

Deletes image from local machine.

⚠️ Container using image must be removed first.

---

## 10. `docker exec` – Run Command INSIDE Container

### Command

```bash
docker exec <container_id> command
```

---

### Example

```bash
docker exec -it <container_id> bash
```

Meaning:

* `-i` → interactive
* `-t` → terminal
* Opens shell inside container

📌 Very important for debugging.

---

## 11. `docker logs` – View Container Logs

### Command

```bash
docker logs <container_id>
```

Shows:

* Application output
* Errors
* Debug messages

---

### Follow logs live

```bash
docker logs -f <container_id>
```

---

## 12. Detached Mode (`-d`)

### Run container in background

```bash
docker run -d nginx
```

Container runs without blocking terminal.

---

## 13. Naming Containers (Best Practice)

### Command

```bash
docker run --name web nginx
```

Instead of random names.

📌 Makes management easier.

---

## 14. Port Mapping (`-p`)

### Syntax

```bash
docker run -p host_port:container_port image
```

---

### Example

```bash
docker run -p 8080:80 nginx
```

Meaning:

* Port 80 inside container
* Accessible via port 8080 on host

---

## 15. Docker Command Mental Model (IMPORTANT)

Think in layers:

```
Image → Container → Process
```

Commands operate on:

* Images (`docker images`, `docker rmi`)
* Containers (`docker ps`, `docker stop`, `docker rm`)

---

## 16. Common Beginner Mistakes

❌ Confusing image and container
❌ Forgetting containers can stop
❌ Deleting wrong container
❌ Not using `docker ps -a`
❌ Running too many unused containers

---

## 17. DevOps Daily Docker Workflow

1. Pull image
2. Run container
3. Check logs
4. Exec into container
5. Stop container
6. Remove container

This loop happens **daily**.

---

## 18. One-Page Revision Summary

* `docker run` → create & start
* `docker ps` → running containers
* `docker ps -a` → all containers
* `docker images` → images
* `docker stop` → stop container
* `docker rm` → delete container
* `docker exec` → access container
* `docker logs` → view output
