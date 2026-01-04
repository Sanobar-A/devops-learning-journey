Day 6 – CI/CD Fundamentals (From Scratch)

These notes explain **Continuous Integration (CI)** and **Continuous Delivery / Deployment (CD)** from absolute basics to real DevOps usage.

---

## 1. What is CI/CD? (Simple Definition)

**CI/CD** is a way to:

* Automatically build
* Automatically test
* Automatically deploy code

Instead of humans doing steps manually, **machines do it reliably**.

---

## 2. Why CI/CD Exists (The Real Problem)

Before CI/CD:

* Developers manually tested code
* Bugs reached production
* Deployments were risky
* Rollbacks were painful

CI/CD solves:

* Human error
* Slow releases
* Broken deployments
* Inconsistent environments

---

## 3. CI/CD Breakdown (Very Important)

CI/CD is made of **two major parts**:

### CI – Continuous Integration

### CD – Continuous Delivery / Continuous Deployment

They are related but **not the same**.

---

## 4. Continuous Integration (CI)

### Definition

**Continuous Integration** means:

> Developers frequently merge code into a shared branch, and every merge is automatically tested.

---

### What Happens in CI?

Whenever code is pushed:

1. Code is fetched
2. Build runs
3. Tests run
4. Results are reported

If anything fails → pipeline fails.

---

### CI Example Flow

```
git push
   ↓
Build
   ↓
Test
   ↓
Report result
```

---

### Why CI is Important

* Detects bugs early
* Prevents broken code
* Keeps main branch stable
* Saves time and money

📌 CI focuses on **code quality**.

---

## 5. Continuous Delivery (CD)

### Definition

**Continuous Delivery** means:

> Code is always in a deployable state, but deployment is triggered manually.

---

### CD (Delivery) Flow

```
CI passed
   ↓
Package / Artifact created
   ↓
Ready to deploy
```

Deployment requires **human approval**.

---

## 6. Continuous Deployment (CD)

### Definition

**Continuous Deployment** means:

> Every successful change is automatically deployed to production.

No manual approval.

---

### Delivery vs Deployment (IMPORTANT)

| Feature        | Continuous Delivery | Continuous Deployment |
| -------------- | ------------------- | --------------------- |
| Human approval | Yes                 | No                    |
| Automation     | High                | Fully automated       |
| Risk           | Lower               | Higher                |
| Usage          | Most companies      | Advanced teams        |

---

## 7. CI/CD Pipeline (Core Concept)

A **pipeline** is a series of automated steps.

Example pipeline:

```
Checkout code
→ Install dependencies
→ Run tests
→ Build
→ Deploy
```

Each step is called a **stage**.

---

## 8. What Triggers a CI/CD Pipeline?

Common triggers:

* `git push`
* Pull Request
* Merge to main
* Scheduled runs
* Manual trigger

---

## 9. Where CI/CD Runs

CI/CD pipelines run on:

* CI servers
* Runners
* Agents

Examples:

* GitHub Actions
* GitLab CI
* Jenkins
* Azure DevOps
* Bitbucket Pipelines

---

## 10. Basic CI/CD Vocabulary (Must Know)

| Term           | Meaning                   |
| -------------- | ------------------------- |
| Pipeline       | Full automation workflow  |
| Job            | Single task (test, build) |
| Stage          | Group of jobs             |
| Runner / Agent | Machine executing jobs    |
| Artifact       | Output (build file)       |
| Trigger        | Event starting pipeline   |

---

## 11. Why Git is the Heart of CI/CD

CI/CD tools:

* Watch Git repositories
* React to commits
* Use branches
* Enforce quality gates

📌 Without Git knowledge, CI/CD makes no sense.

---

## 12. Typical Real-World Pipeline Example

For a web application:

1. Developer pushes code
2. CI runs tests
3. Build is created
4. Docker image is built
5. Image is pushed to registry
6. Deployment happens

---

## 13. CI/CD Failures (Important Concept)

If any step fails:

* Pipeline stops
* Deployment does NOT happen
* Developer fixes code

This is called **fail fast**.

---

## 14. CI/CD in DevOps Culture

CI/CD enables:

* Faster releases
* Smaller changes
* Continuous feedback
* Safer deployments

This supports:

> “Release often, release safely”

---

## 15. Common Beginner Misunderstandings

❌ CI/CD is only for big companies
❌ CI/CD means automatic production deployment
❌ CI/CD replaces testing
❌ CI/CD tools fix bad code

---

## 16. What CI/CD Does NOT Do

CI/CD does NOT:

* Write code for you
* Fix logical bugs
* Replace good practices
* Remove responsibility

It **enforces discipline**, not intelligence.

---

## 17. How CI/CD Fits with DevOps Tools

| Tool       | Role           |
| ---------- | -------------- |
| Git        | Source control |
| CI tool    | Automation     |
| Docker     | Packaging      |
| Kubernetes | Deployment     |
| Cloud      | Infrastructure |

CI/CD is the **glue**.

---

## 18. One-Page Summary (Revision)

* CI = build & test automatically
* CD = deploy automatically or on approval
* Pipelines are automated workflows
* Git triggers CI/CD
* Failures stop deployments
* CI/CD reduces risk


