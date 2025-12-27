📘 Day 3 – Shell Scripting (DevOps Revision Notes)
1. What is Shell Scripting?

A shell script is a text file that contains Linux commands written in sequence, which can be executed as a program.

Instead of typing commands manually every time, we automate them using scripts.

Why DevOps Engineers Use Shell Scripts:

Automation of repetitive tasks

Server setup & configuration

Application deployment

CI/CD pipelines

Monitoring & health checks

2. Shell Script File Basics
Script File Extension

Usually ends with:

.sh


Example:

deploy.sh
backup.sh

Shebang (#!) – VERY IMPORTANT
#!/bin/bash


Meaning:
Tells Linux which shell should run the script.

Without shebang:

Linux doesn’t know how to execute the file

3. Making a Script Executable

By default, scripts are NOT executable.

Command:
chmod +x script.sh

Run script:
./script.sh

4. Printing Output (echo)
Syntax:
echo "Hello World"


Used for:

Output

Logs

Debugging

CI/CD messages

5. Variables in Shell Scripts
Syntax:
NAME="Sanobar"
echo "$NAME"


⚠️ No spaces around =

Why variables matter

Dynamic values

Reusable scripts

Environment-based logic

6. Taking User Input (read)
Syntax:
echo "Enter your name:"
read NAME


Whatever user types → stored in NAME

7. Comments
Syntax:
# This is a comment


Used to:

Explain logic

Help teammates

Improve maintainability

8. Conditional Statements (if)
Basic Syntax:
if [ condition ]
then
    commands
else
    commands
fi


⚠️ Spaces inside [ ] are mandatory

Numeric Comparisons
Operator	Meaning
-eq	equal
-ne	not equal
-gt	greater than
-lt	less than
-ge	greater or equal
-le	less or equal
Example:
if [ "$NUM" -gt 10 ]
then
    echo "Greater than 10"
fi

String Comparison
if [ "$USER" = "root" ]
then
    echo "Dangerous user"
fi

9. File & Directory Checks (VERY IMPORTANT)
Check if file exists
if [ -f "file.txt" ]
then
    echo "File exists"
fi

Check if directory exists
if [ -d logs ]
then
    echo "Directory exists"
fi

NOT operator (!)
if [ ! -d logs ]
then
    mkdir logs
fi

10. Loops – Automation Core
10.1 for Loop (List-based)
Syntax:

for variable in list
do
    commands
done

Example (Numbers):
for i in 1 2 3 4 5
do
    echo "$i"
done

Explanation:

i is automatically assigned values from list

No manual initialization required

Example (Folder names):

for dir in logs backup temp
do
    mkdir -p "$dir"
done


📌 logs backup temp are just names, not keywords.

mkdir -p (Idempotent Command)

Creates directory only if missing

Does NOT fail if directory already exists

Safe for automation

11. while Loop (Condition-based)
Syntax:

while [ condition ]
do
    commands
done

Example:
count=1

while [ $count -le 5 ]
do
    echo "$count"
    count=$((count+1))
done

Real DevOps Example:

while ! systemctl is-active nginx
do
    echo "Waiting for nginx..."
    sleep 2
done

echo "Nginx is running"


Explanation:

systemctl is-active nginx → checks service status

! → NOT operator

Loop runs until nginx is active

sleep prevents CPU overload

12. break vs continue
break

Exits the entire loop

if [ "$i" -eq 3 ]
then
    break
fi

continue

Skips current iteration, continues loop

if [ "$i" -eq 3 ]
then
    continue
fi

13. Combining Loop + Condition (Real Automation)
for f in file1.sh file2.txt missing.txt
do
    if [ -f "$f" ]
    then
        echo "$f exists"
    else
        echo "$f missing"
    fi
done

14. Best Practices (VERY IMPORTANT)

Always quote variables "${var}"

Use mkdir -p in scripts

Add comments

Avoid hardcoding values

Write idempotent scripts

Use sleep in polling loops

Never assume files/folders exist

15. Common Beginner Mistakes

❌ Missing spaces in [ ]
❌ Forgetting chmod +x
❌ Not quoting variables
❌ Using break instead of continue
❌ Assuming directories exist

16. DevOps Mindset Summary

Shell scripting is about:

Thinking in automation

Writing safe, repeatable scripts

Preventing failures

Making systems predictable
