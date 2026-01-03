📘 Positional Parameters in Bash ($0, $1, $2, $@, $#)

These notes explain what positional parameters are, who creates them, when they get values, and how DevOps engineers use them.

1. What are Positional Parameters?

Positional parameters are special variables in Bash that automatically store values passed to:

A script

A function

They are called positional because their meaning depends on position.

2. Who Creates $1, $2, etc.?

The Bash shell creates positional parameters automatically.

You:

❌ Do NOT define $1

❌ Do NOT initialize $1

✅ Bash sets them at runtime

This happens:

When a script is executed

When a function is called

3. $0 – Script Name
Meaning

$0 stores the name of the script itself.

Example

Script:

#!/bin/bash
echo "Script name: $0"


Run:

./deploy.sh


Output:

Script name: ./deploy.sh


Used for:

Usage messages

Error messages

Logging

4. $1, $2, $3 – Positional Arguments
Meaning
Variable	Meaning
$1	First argument
$2	Second argument
$3	Third argument
Example (Script)
#!/bin/bash
echo "First argument: $1"
echo "Second argument: $2"


Run:

./script.sh dev backend


Internally, Bash assigns:

$1 = dev
$2 = backend


Output:

First argument: dev
Second argument: backend

5. Where Do These Values Come From?

They come from how you run the script.

Command:

./script.sh value1 value2


Bash automatically maps:

$0 → ./script.sh
$1 → value1
$2 → value2


You never assign them manually.

6. Positional Parameters in Functions (Same Rule)

Functions also receive positional parameters.

Function Example
print_value() {
    echo "Received: $1"
}


Call:

print_value config.env


Internally:

$1 = config.env


📌 Positional parameters inside a function are local to that function call.

7. What Happens If Nothing Is Passed?

If you don’t pass arguments:

./script.sh


Then:

$1 = empty
$2 = empty


This is why input validation is required.

8. $# – Number of Arguments
Meaning

$# stores how many arguments were passed.

Example
#!/bin/bash
echo "Total arguments: $#"


Run:

./script.sh one two three


Output:

Total arguments: 3


Used for:

Validation

Conditional logic

Error handling

9. $@ – All Arguments
Meaning

$@ represents all positional parameters as a list.

Example
#!/bin/bash
for arg in "$@"
do
    echo "$arg"
done


Run:

./script.sh dev backend v1


Output:

dev
backend
v1

10. $* vs $@ (Important Difference)
Variable	Behavior
$@	Treats each argument separately (recommended)
$*	Treats all arguments as one string

👉 Always use $@ in scripts.

11. Why DevOps Scripts Use Positional Parameters

Because scripts must be:

Reusable

Environment-independent

Configurable

Example:

deploy.sh dev
deploy.sh prod


Same script, different environment.

12. Input Validation Example (Best Practice)
if [ $# -lt 1 ]
then
    echo "Usage: $0 <environment>"
    exit 1
fi


Explanation:

$# -lt 1 → no arguments passed

$0 → script name

Prevents misuse

13. Common Beginner Mistakes

❌ Thinking $1 must be declared
❌ Forgetting arguments come from command line
❌ Not validating $#
❌ Using $* instead of $@
❌ Assuming $1 always exists

14. Mental Model (IMPORTANT)

Think of positional parameters like this:

script.sh arg1 arg2 arg3
          |    |    |
         $1   $2   $3


Bash does this mapping automatically.

15. Summary (One-Page Revision)

$0 → script name

$1, $2, $3 → positional arguments

$# → number of arguments

$@ → all arguments (safe)

Bash assigns values automatically

Values come from how script/function is called
