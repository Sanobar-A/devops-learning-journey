Day 5 – Part B (Branches & Merge)

These notes are **from scratch → advanced**, explain **why branches exist**, **how merge works internally**, **commands**, **outputs**, **examples**, and **common mistakes**.

You can directly save this as a file in your repo.

---

## 📁 File name to create

Inside your repo (recommended inside a `notes/` folder if you have one):

```bash
nano DAY5_GIT_PART_B_BRANCHES_MERGE.md
```

Paste **everything below** 👇

---

# 📘 Day 5 – Git Deep Dive

## Part B: Branches & Merge (From Zero to Real DevOps)

This document explains **Git branches and merging** in a clear, practical, DevOps-oriented way.

---

## 1. What is a Branch? (From Scratch)

A **branch** is a **separate line of development** in Git.

You can think of it as:

* A parallel timeline
* An independent workspace
* A safe place to experiment

📌 A branch is **not a copy of files**.
📌 A branch is just a **pointer to a commit**.

---

## 2. Why Branches Exist (Very Important)

Branches allow you to:

* Work on new features safely
* Fix bugs without breaking stable code
* Collaborate with others
* Run CI/CD on isolated changes

👉 In real companies, **direct work on `main` is avoided**.

---

## 3. Default Branch: `main`

When a repository is created:

* Git creates a default branch called `main`
* `main` represents **stable / production-ready code**

📌 Treat `main` as **protected**.

---

## 4. Viewing Branches

### Command

```bash
git branch
```

### Example Output

```
* main
  day5-practice
```

### Meaning

* `*` → current branch
* Other branches exist but are inactive

---

## 5. Creating a Branch

### Create branch only

```bash
git branch feature-login
```

📌 This creates the branch but does NOT switch to it.

---

### Create + switch (most common)

```bash
git checkout -b feature-login
```

### Meaning

* Create a new branch
* Move `HEAD` to that branch

---

## 6. Switching Between Branches

### Command

```bash
git checkout main
```

or

```bash
git checkout feature-login
```

📌 Files in your working directory **change automatically** to match the branch.

---

## 7. What Happens Internally When You Create a Branch

When you run:

```bash
git checkout -b feature-x
```

Git:

1. Creates a new pointer at the current commit
2. Moves `HEAD` to that pointer
3. Keeps commit history shared until changes occur

No files are duplicated.

---

## 8. Making Commits on a Branch

When you are on a branch:

```bash
git checkout feature-x
```

Any commits you make:

* Belong ONLY to that branch
* Do NOT affect `main`

This is the **core power of Git**.

---

## 9. Verifying Branch Isolation (Very Important)

### On feature branch

```bash
touch test.txt
git add test.txt
git commit -m "Add test file"
```

### Switch to main

```bash
git checkout main
ls
```

📌 `test.txt` will NOT be present on `main`.

This proves:

> Branches are isolated timelines.

---

## 10. What is Merge?

A **merge** means:

> Bringing changes from one branch into another

Most commonly:

```
feature branch → main
```

---

## 11. Merge Workflow (Standard)

### Step 1: Switch to target branch

```bash
git checkout main
```

### Step 2: Merge feature branch

```bash
git merge feature-login
```

---

## 12. Types of Merges (Conceptual)

### 12.1 Fast-forward Merge

* Happens when `main` has no new commits
* Git simply moves the pointer forward
* No extra merge commit

### 12.2 Three-way Merge

* Happens when both branches diverged
* Git creates a **merge commit**
* History is preserved

📌 Both are normal and valid.

---

## 13. Merge Output Examples

### Fast-forward merge

```
Updating a1b2c3d..e4f5g6h
Fast-forward
```

### Three-way merge

```
Merge made by the 'recursive' strategy.
```

---

## 14. Merge Conflicts (Important Concept)

A **merge conflict** occurs when:

* Same file
* Same lines
* Modified differently in two branches

Git cannot decide automatically.

📌 Conflicts are NORMAL, not errors.

---

## 15. What Git Does During a Conflict

Git:

* Stops the merge
* Marks the conflicting files
* Asks YOU to resolve

Example markers in file:

```text
<<<<<<< HEAD
current branch content
=======
incoming branch content
>>>>>>> feature-branch
```

---

## 16. Resolving a Merge Conflict (High Level)

Steps:

1. Open the conflicted file
2. Decide correct content
3. Remove conflict markers
4. Save file
5. Run:

   ```bash
   git add <file>
   git commit
   ```

📌 Git considers conflict resolved after `git add`.

---

## 17. Abort a Merge (Safety Feature)

If something goes wrong:

```bash
git merge --abort
```

This returns the repo to pre-merge state.

---

## 18. Deleting a Branch (After Merge)

### Delete local branch

```bash
git branch -d feature-login
```

### Force delete (if not merged)

```bash
git branch -D feature-login
```

📌 Deleting a branch does NOT delete commits if they are merged.

---

## 19. Real DevOps Workflow (IMPORTANT)

In real teams:

1. Create branch
2. Make changes
3. Push branch
4. Open Pull Request (PR)
5. CI/CD runs
6. Review
7. Merge to main

You are practicing the **same workflow locally**.

---

## 20. Common Beginner Mistakes

❌ Working directly on `main`
❌ Forgetting to switch branch
❌ Merging from wrong branch
❌ Panicking during conflicts
❌ Deleting branches too early

---

## 21. One-Page Summary

* Branch = pointer to a commit
* `main` = stable code
* Feature branches isolate work
* Merge brings changes together
* Conflicts are normal
* Git always protects your data


