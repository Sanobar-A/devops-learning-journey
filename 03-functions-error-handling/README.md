📘 Day 4 – Shell Scripting (Functions & Error Handling)

This document contains complete revision notes for Day 4 of shell scripting, written from absolute basics to advanced DevOps-level concepts.

These notes are meant for:

Self-revision

Interview preparation

Real-world DevOps scripting reference

1. Why Day 4 Matters in DevOps

Till Day 3, we learned:

Commands

Conditions

Loops

But real DevOps scripts must be:

Reusable

Structured

Safe

Predictable

That is why we need:

Functions

Parameters

Error handling

Exit codes

Defensive scripting

2. What is a Function? (From Zero)
Definition

A function is a named block of code that performs a specific task and can be reused multiple times.

Instead of writing the same logic again and again, we write it once and call it when needed.

3. Why Functions Are Needed (Real Reason)

Without functions:

Scripts become long

Code gets repeated

Fixing bugs becomes hard

With functions:

Code is clean

Logic is reusable

Debugging is easier

Teams can understand scripts

👉 All production DevOps scripts use functions.

4. Function Syntax (Bash)
Basic syntax
function_name() {
    commands
}


OR (both are valid):

function function_name {
    commands
}

5. First Function Example (Explained Line by Line)
#!/bin/bash

greet() {
    echo "Hello DevOps"
}

greet

Explanation
greet() {


greet → function name (you choose this)

() → tells bash this is a function

{ → start of function body

echo "Hello DevOps"


Command inside function

}


End of function

greet


Function call

Runs the function

6. Functions With Parameters (VERY IMPORTANT)

Functions can receive inputs, just like commands.

Example
welcome() {
    echo "Welcome $1"
}

welcome Sanobar

7. What is $1? (VERY IMPORTANT CONCEPT)
$1 means:

First argument passed to the function

Similarly:

$2 → second argument

$3 → third argument

$@ → all arguments

Where does $1 come from?

When you call:

welcome Sanobar


Internally:

$1 = Sanobar


So inside function:

echo "Welcome $1"


becomes:

Welcome Sanobar

8. Multiple Parameters Example
add_user() {
    echo "User: $1"
    echo "Role: $2"
}

add_user Sanobar DevOps

Internal mapping
$1 = Sanobar
$2 = DevOps

9. Real DevOps Function Example (File Check)
check_file() {
    if [ -f "$1" ]
    then
        echo "File $1 exists"
    else
        echo "File $1 does not exist"
    fi
}

check_file config.env
check_file deploy.sh

Why this is useful

Same file-check logic reused

Cleaner scripts

Less duplication

10. Exit Codes (CRITICAL CONCEPT)

Every Linux command returns an exit code.

Exit code meanings
Code	Meaning
0	Success
1–255	Failure
Check exit code of last command
echo $?

11. Why Exit Codes Matter in DevOps

CI/CD pipelines depend on exit codes.

If a command fails:

Pipeline must stop

Deployment must fail

12. Manual Error Handling Example
mkdir testdir

if [ $? -eq 0 ]
then
    echo "Directory created"
else
    echo "Failed to create directory"
    exit 1
fi

Explanation

$? → exit code of last command

exit 1 → manually fail script

13. exit Command
exit 0   # success
exit 1   # failure


Used to:

Stop scripts

Signal failure to CI/CD tools

14. set -e (Fail Fast Mode)
#!/bin/bash
set -e

Meaning

If ANY command fails, script exits immediately.

Used in:

Deployment scripts

Infrastructure automation

⚠️ Use carefully.

15. Combining Functions + set -e (Production Style)
#!/bin/bash
set -e

create_dir() {
    mkdir -p "$1"
    echo "Directory $1 ready"
}

create_dir logs
create_dir backup
create_dir temp

Why this is good

Reusable function

Safe directory creation

Script never breaks if folder exists

16. Input Validation (Defensive Scripting)

Never trust user input.

Example
if [ -z "$1" ]
then
    echo "Usage: $0 <filename>"
    exit 1
fi

Explanation

-z → checks if variable is empty

$0 → script name

Prevents misuse

17. Error Trapping (Advanced)
trap 'echo "Error occurred. Exiting."' ERR

Meaning

If any error happens

This message is printed

Useful for logging & cleanup

18. Logging Function (Best Practice)
log() {
    echo "$(date) - $1"
}

log "Script started"
log "Creating directories"

Why logging matters

Debugging

Monitoring

CI/CD visibility

19. Best Practices (VERY IMPORTANT)

Always quote variables "${var}"

Use functions for repeated logic

Validate inputs

Use mkdir -p

Use exit codes correctly

Add comments

Prefer readable code over clever code

20. Common Beginner Mistakes

❌ Forgetting $1 comes from function call
❌ Assuming parameters exist
❌ No input validation
❌ Ignoring exit codes
❌ Writing everything inline without functions

21. DevOps Mindset Summary

Day 4 teaches:

Reusable logic

Safe scripting

Predictable automation

Production-ready shell scripts

This is the difference between:

Learning shell ❌
Using shell professionally ✅
