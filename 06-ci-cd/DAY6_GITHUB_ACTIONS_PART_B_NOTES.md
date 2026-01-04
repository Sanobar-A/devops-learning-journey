📘 Day 6 – GitHub Actions (Part B: From Zero)

This document explains **GitHub Actions** from scratch and walks through creating a **basic CI pipeline**.

---

## 1. What is GitHub Actions?

**GitHub Actions** is a **CI/CD tool built into GitHub**.

It allows you to:

* Automatically run tasks
* When code changes
* Inside your GitHub repository

📌 No separate server required
📌 Works directly with GitHub repos

---

## 2. Why GitHub Actions is Important

GitHub Actions helps you:

* Run tests automatically
* Enforce quality checks
* Build projects
* Prepare for deployment

It is widely used in:

* Open-source projects
* Startups
* Enterprises

---

## 3. Key Concepts in GitHub Actions

### 3.1 Workflow

A **workflow** is an automation file that defines:

* When something should run
* What steps should run

Workflow files are written in **YAML**.

---

### 3.2 Job

A **job** is a set of steps that run on the same machine.

A workflow can have:

* One job
* Multiple jobs

---

### 3.3 Step

A **step** is a single action:

* Run a command
* Use a predefined action

---

### 3.4 Runner

A **runner** is the machine that executes jobs.

Examples:

* Ubuntu (most common)
* macOS
* Windows

---

## 4. Where Workflows Live (IMPORTANT)

GitHub Actions workflows must be placed in:

```
.github/workflows/
```

GitHub automatically detects files here.

---

## 5. YAML Basics (Required for GitHub Actions)

YAML is:

* Indentation-based
* Space-sensitive
* Case-sensitive

### Example:

```yaml
key: value
```

⚠️ Tabs are NOT allowed
⚠️ Use spaces only

---

## 6. First CI Workflow (Basic Example)

Create folders:

```bash
mkdir -p .github/workflows
```

Create workflow file:

```bash
nano .github/workflows/ci.yml
```

---

## 7. Basic CI Workflow Code (Explained Line by Line)

Paste this:

```yaml
name: Basic CI Pipeline

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Run a shell command
        run: echo "CI pipeline is running"
```

---

## 8. Line-by-Line Explanation

### `name:`

```yaml
name: Basic CI Pipeline
```

* Name shown in GitHub Actions UI

---

### `on:`

```yaml
on:
  push:
    branches:
      - main
```

Meaning:

> Run this workflow when code is pushed to `main` branch

---

### `jobs:`

Defines jobs to run.

---

### `build:`

```yaml
build:
```

* Job name (can be anything)

---

### `runs-on:`

```yaml
runs-on: ubuntu-latest
```

* Job runs on a Linux machine provided by GitHub

---

### `steps:`

Defines ordered steps inside the job.

---

### `uses: actions/checkout@v4`

* Downloads your repository code into the runner
* Required for almost all workflows

---

### `run:`

```yaml
run: echo "CI pipeline is running"
```

* Executes a shell command
* Same as running command in terminal

---

## 9. What Happens When You Push This File?

When you commit & push:

1. GitHub detects workflow file
2. Creates a runner
3. Checks out code
4. Runs commands
5. Shows result in **Actions** tab

---

## 10. Viewing Workflow Results

On GitHub:

* Go to your repository
* Click **Actions**
* Click the workflow run
* View logs step-by-step

---

## 11. Common Beginner Mistakes

❌ Wrong folder name (`.github/workflow` instead of `workflows`)
❌ YAML indentation errors
❌ Forgetting `actions/checkout`
❌ Assuming workflows run without pushing

---

## 12. Why This Matters in DevOps

This same mechanism is used for:

* Testing code
* Running shell scripts
* Docker builds
* Deployments

You just created the **foundation of CI/CD**.

---

## 13. Real DevOps Mapping

| Concept   | GitHub Actions |
| --------- | -------------- |
| CI server | GitHub         |
| Agent     | Runner         |
| Pipeline  | Workflow       |
| Job       | Job            |
| Step      | Step           |

---

## 14. One-Page Revision Summary

* GitHub Actions = CI/CD tool
* Workflows live in `.github/workflows`
* YAML controls automation
* `on` defines triggers
* Jobs run on runners
* Steps execute commands
