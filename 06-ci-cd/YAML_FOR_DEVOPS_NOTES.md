📘 YAML for DevOps – Complete Notes (From Scratch)

These notes explain **YAML** in a way that is **practical, minimal, and DevOps-focused**.
You do **NOT** need to learn full YAML — only what is used in real systems.

---

## 1. What is YAML?

**YAML** stands for:

> **YAML Ain’t Markup Language**

It is a **human-readable data format** used to define:

* Configuration
* Pipelines
* Infrastructure
* Automation steps

---

## 2. Why DevOps Uses YAML

DevOps tools prefer YAML because:

* Easy to read
* Easy to write
* Easy to version-control

Used in:

* GitHub Actions
* GitLab CI
* Kubernetes
* Docker Compose
* Ansible
* Helm

---

## 3. YAML is NOT a Programming Language

Important clarification:

❌ YAML does NOT:

* Run logic
* Execute commands
* Perform calculations

✅ YAML only:

* Describes structure
* Defines configuration
* Lists steps

Think of YAML as **instructions**, not actions.

---

## 4. Basic Rule of YAML (MOST IMPORTANT)

> **Indentation defines structure**

YAML uses:

* Spaces
* NOT tabs
* NOT brackets `{}`

⚠️ One wrong space = error.

---

## 5. Key–Value Pairs (Foundation)

### Syntax

```yaml
key: value
```

### Example

```yaml
name: CI Pipeline
```

Meaning:

* `name` → key
* `CI Pipeline` → value

---

## 6. Nested Key–Value Pairs (Hierarchy)

### Example

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
```

### How to read this

> jobs has a child called build
> build has a property runs-on

Indentation = ownership.

---

## 7. Lists in YAML (`-` symbol)

A dash (`-`) means **list item**.

### Example

```yaml
branches:
  - main
  - dev
```

Meaning:

> branches contains multiple values

---

## 8. Lists of Objects (Very Common)

### Example

```yaml
steps:
  - name: Checkout code
    uses: actions/checkout@v4
```

Breakdown:

* `steps` → list
* Each `-` → one step
* Each step has properties

---

## 9. Why `-` Exists (Simple Explanation)

This:

```yaml
steps:
  - step1
  - step2
```

Is equivalent to:

```text
Step 1
Step 2
```

Order matters.

---

## 10. YAML in GitHub Actions (Core Structure)

Every GitHub Actions workflow follows this shape:

```yaml
name:
on:
jobs:
```

You should **recognize this pattern**, not memorize syntax.

---

## 11. `steps:` Explained (Very Important)

```yaml
steps:
  - name: Example step
    run: echo "Hello"
```

Meaning:

> Run steps one after another, in order.

---

## 12. `name:` Inside Steps

```yaml
- name: Run tests
```

* Only for humans
* Shown in UI
* Helps debugging
* Has NO effect on execution

---

## 13. `run:` (Execute Commands)

```yaml
- name: Print message
  run: echo "Hello CI"
```

Meaning:

* Runs a shell command
* Same as terminal command
* Default shell = bash (Linux runners)

---

## 14. `uses:` (Reuse Existing Actions)

```yaml
- uses: actions/checkout@v4
```

Meaning:

> Use an action written by someone else

This action:

* Clones repository
* Makes code available in runner

Think of it as:

```bash
git clone <repo>
```

---

## 15. `uses:` vs `run:` (CRITICAL DIFFERENCE)

| Keyword | Purpose               |
| ------- | --------------------- |
| `uses`  | Use a prebuilt action |
| `run`   | Run shell commands    |

Both are steps, but do different things.

---

## 16. YAML Indentation Rules (MUST KNOW)

✅ Correct:

```yaml
jobs:
  build:
    steps:
      - run: echo "OK"
```

jobs:              ← level 0 (no spaces)
␣␣build:           ← level 1 (2 spaces)
␣␣␣␣steps:         ← level 2 (4 spaces)
␣␣␣␣␣␣- run: ...   ← level 3 (6 spaces)


❌ Wrong:

```yaml
jobs:
 build:
   steps:
    - run: echo "FAIL"
```

---

## 17. Strings in YAML

### Simple string

```yaml
name: Build job
```

### Quoted string

```yaml
run: echo "Hello World"
```

Quotes are optional unless:

* Value contains special characters
* Value contains `:` or `{}`

---

## 18. Numbers and Booleans

```yaml
retries: 3
enabled: true
```

YAML automatically understands:

* Numbers
* true / false

---

## 19. Comments in YAML

```yaml
# This is a comment
```

Used for:

* Explanation
* Documentation
* Clarity

---

## 20. Common YAML Errors (VERY IMPORTANT)

❌ Using tabs
❌ Wrong indentation
❌ Forgetting `-` in lists
❌ Mixing spaces inconsistently
❌ Misplacing `run` or `uses`

---

## 21. How Much YAML You Actually Need (Reality)

You need only:

* Key–value pairs
* Lists
* Indentation
* `run` and `uses`

❌ You do NOT need:

* Anchors
* References
* Advanced YAML syntax

---

## 22. YAML Mental Model (Remember This)

Think of YAML as:

```text
Folders (keys)
  → Subfolders
    → Lists of actions
```

---

## 23. One-Page YAML Cheat Sheet

```yaml
key: value

parent:
  child: value

list:
  - item1
  - item2

steps:
  - name: Step name
    run: command
  - name: Another step
    uses: action/name@version
```

---

## 24. DevOps Mapping (Why This Matters)

| Tool           | Uses YAML  |
| -------------- | ---------- |
| GitHub Actions | CI/CD      |
| Kubernetes     | Deployment |
| Docker Compose | Services   |
| Ansible        | Automation |
| Helm           | Packaging  |

Learn YAML once → use everywhere.
