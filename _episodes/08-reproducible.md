---
title: "Reproducible Science and Hypothesis Testing"
author: "Hauke Bartsch"
teaching: 30
exercises: 0
questions:
- "What is reproducible science and why should I care?"
- "What tools exist for reproducible science?"
- "How should I share my results?"
objectives:
- "Be familiar with scripting and git"
keypoints:
- "Use established tools to share analysis streams. Use version control to store project history."
---

> ## You can skip this lesson if you can answer these questions: &#8680;
>
>  - What is the preferred shebang for portability in bash?
>  - How do I commit to the master branch on the command line?
>  - How do I create a github repository fork, implement a change suggest a merge?
>  - Name your three favorite text editors that work on Windows/MacOS/Linux
{: .challenge}

# Module 0: Reproducible Science

## Access to the command shell

For the duration of the workshop we are providing an interactive shell on a website: http://158.39.74.9. If you are running into problems please try to use a browser like Chrome. You will see a message "Your connection is not private". Please click on "Advanced" and "Proceed to 158.39.74.9". 

Select the "Terminal: SSH" icon in the center of the page, enter 158.39.74.9 for host and 22 for port, and enter one of the workshop user names (a01, a02, ... a20):
~~~
[Press Shift-F1 for help]

Host/IP or ssh:// URL [localhost]: 158.39.74.9
Port [22]:
User: a01
Connecting to ssh://a01@158.39.74.9:22

a01@localhost's password:
~~~
You should see a shell prompt that allows you to enter further commands.

## Introduction

The shell will wait for you to enter the first command. The easiest command is to press the Enter key on your keyboard which will show the shell prompt again:
~~~
a03@mmiv-workshop:~$
a03@mmiv-workshop:~$
a03@mmiv-workshop:~$
~~~
It shows your user name (here a03), the name of the machine - mmiv-workshop and your current directory '~' (tilde - a shortcut for your home directory). You can start typing commands after the '$' sign.

### Directories

Your user's home directory should be empty. You can check this by first making sure you are in your home directory. Type in the command `pwd` which stands for _print working directory_. Many commands use this type of short name to save you from typing too much.
~~~
a03@mmiv-workshop:~$ pwd
/home/a03
~~~

The command to list the content of the current directory is _ls_:
~~~
a03@mmiv-workshop:~$ ls
a03@mmiv-workshop:~$
~~~
It is also usual for a command to not produce any output if there is nothing to report.

In order to organize your project use a directory. You can always create a directory in your home folder:
~~~
a03@mmiv-workshop:~$ pwd
/home/a03
a03@mmiv-workshop:~$ mkdir workshop
a03@mmiv-workshop:~$ ls
workshop
~~~

We use the `pwd` command to make sure we are in our home directory, `mkdir` - _make directory_ to create a new folder called `workshop`, and listed the home directory again with `ls`. This shows us our new directory. It is important to be aware of your current working directory. In other peoples directories you will not be able to create your folders.

In order to change our working directory to the new directory we can use the _change directory_ command `cd`. The `cd` command is also useful to get us back into our home directory if it is typed on its own:
~~~
a03@mmiv-workshop:~$ cd
a03@mmiv-workshop:~$
~~~
Add the name of the new directory to the command (separated by a space) to change to another directory:
~~~
a03@mmiv-workshop:~$ cd workshop
a03@mmiv-workshop:~/workshop$
~~~
This will change the prompt on the line, instead of just the tilde `~`-character now the prompt lists your home directory `~` followed by `workshop`. The slash (`/`) character is used to separate different folder names from each other.

List your current directory with `pwd` and use the `cd` command to go back to your home directory. Enter the workshop directory again using `cd workshop`.
~~~
a03@mmiv-workshop:~/workshop$ pwd
/home/a03/workshop
a03@mmiv-workshop:~/workshop$ cd
a03@mmiv-workshop:~$ cd workshop
a03@mmiv-workshop:~/workshop$
~~~
In order to move up relative to your current working directory use the special directory name which consists of two dots (`cd ..`).


Create two more directories called `source` and `bin` inside your `workshop` directory (use `mkdir`). Go back to your home directory and list your directory tree with the `tree` command. You should see this output:
~~~
a03@mmiv-workshop:~$ tree
.
└── workshop
    ├── bin
    └── source

3 directories, 0 files
~~~

There are many more commands availble. You should get help for each one of them if you use the command `man` - _manual page` followed by the command you want to know more about. Find out what the command `banner` is doing from the help page and use it on your screen.

Find out about the `nudoku` command.

Find out about the `moon-buggy` command.

### Create a script

A shell script is a text document that lists single commands. By storing them in a text file we can run them later in the same order. We can share them with other people as well - one of the goals of reproducible science. We will store our script file in the `~/workshop/bin` directory. Change to this directory and open the text editor `nano`.
~~~
a03@mmiv-workshop:~/workshop/bin$ nano
~~~

The nano text editor is very simple to use. You can type some text and save it under a new file name using the Control-o (^O) keyboard short-cut. Enter the filename `workshop01.sh` and leave the editor again (^x). The new script is now in our directory tree (use `cd` and `tree` to list the file):
~~~
a03@mmiv-workshop:~/workshop/bin$ cd
a03@mmiv-workshop:~$ tree
.
└── workshop
    ├── bin
    │   └── workshop01.sh
    └── source

3 directories, 1 file
~~~

To indicate that this file should be executable and not just a text file change the permissions of the file using the `chmod` - _change permission_ command:
~~~
a03@mmiv-workshop:~$ cd workshop/bin/
a03@mmiv-workshop:~/workshop/bin$ chmod +x workshop01.sh
a03@mmiv-workshop:~/workshop/bin$
~~~
Now we can execute our script by tying its name (prepend `./` to indicate that the script is in the current directory).
~~~
a03@mmiv-workshop:~/workshop/bin$ ./workshop01.sh
./workshop01.sh: line 1: some: command not found
a03@mmiv-workshop:~/workshop/bin$
~~~
As you can see we got an error message in the first line of our new script. The first line I entered was `some text` and it tried to find the command `some` - which does not exist. The commands we enter inside a script have to be valid commands on our system.

Use `nano` to change the text in your `workshop01.sh` file to contain the following two lines:
~~~
#!/usr/bin/env bash

echo "some text"
~~~
Close the editor with ^o and ^x and run the script again:
~~~
a03@mmiv-workshop:~/workshop/bin$ nano workshop01.sh
a03@mmiv-workshop:~/workshop/bin$ ./workshop01.sh
some text
a03@mmiv-workshop:~/workshop/bin$
~~~
Now the script correctly echo's "some text". Open the script again and change the text, add some more text or use `banner` instead of echo.

### Text editors (you should know how to get out of)

The default text editor on most unix based systems is called `vi`. This editor is used as the default editor by the Unix system if a manual change to a text file is required. In order to quit the vi editor again you should remember the following sequence of keys: `ESC :q!`.

Invest some time in learning how to use 'vi' productively. Its an obscure skill that is mandatory to master for any Linux guru. If you want to go overboard learn 'ed' as well. Its more pure, without any unnessesary sophistications of full-screen editors like vi (this is a joke). 

The question might be asked why to use a dedicated program for editing texts. This question is linked to the long history of character encodings that are in use. Different programs like scripting or programming languages only understand specific dialects of character encodings and break if they see unusual characters like double-quotes (") - not a joke. If you have a choice try to store your files as UTF-8 or latin-1. A text editor will do this for you so you can concentrate on writing good code. Bad text editors include Notepad, Wordpad and Word - if you want to annoy someone send them a script written in Notepad and you can move on friendship wise.

A good modern text editor supports syntax highlighting, many different languages and debugging. My personal favourite right now is Visual Studio Code from Microsoft and of course Emacs (Ctrl-x Ctrl-c to exit).

## Test data

We have some example data archives stored on our system in the `/data/` directory. Usually you would work with about 100,000 of these files instead of the small sample we use in this workshop. We can list the first file in the directory using a combination of commands separated by the pipe `|` character which will take the output of the first command and send it to the second command. What we will see as the result is the output of the second command. Here the first command lists all the files in that directory and the second command returns only the first file, all other lines from ls are removed:
~~~
a03@mmiv-workshop:~/workshop/bin$ ls /data/ | head -1
LIDC-IDRI-0193-data.tgz
~~~
Combining commands in this way is an effective way to process large numbers of files consistently. Here is a chain of commands that lists all the participant IDs in the /data directory
~~~
a03@mmiv-workshop:~/workshop/bin$ ls /data/ | cut -d'_' -f1 | sort | uniq
LIDC-IDRI-0193-data.tgz
LIDC-IDRI-0194-data.tgz
LIDC-IDRI-0195-data.tgz
LIDC-IDRI-0196-data.tgz
LIDC-IDRI-0197-data.tgz
LIDC-IDRI-0198-data.tgz
LIDC-IDRI-0199-data.tgz
~~~
Use `man` to learn about the new commands `cut`, `sort`, and `uniq`.

If we now add the command `wc -l` to the above chain we can also count the number of participants (3) we have available:
~~~
a03@mmiv-workshop:~/workshop/bin$ ls /data/ | cut -d'_' -f1 | sort | uniq | wc -l
7
~~~

It is difficult to give a complete list of commands that are useful to know. Here is just the list of my favorites: `pwd, ls, cd, mkdir, cut, sort, uniq, wc, find, bc, tar, cat, rm, echo`.

## Scripting a workflow

One of the most useful scripting functions is to be able to access a subset of files from our `/data` directory one after another and to perform an operation on each. In the simplest case we want to list all the image studies. Open the `workshop01.sh` script in `nano` and replace the content with the following loop. The line is more complex because it is able to work with spaces in the directory or file names. If you are using a loop use this pattern (google "nixCraft bash for loop file names with spaces"):
~~~
#!/usr/bin/env bash

find /data/* -name "*019*.tgz" -print0 | while IFS= read -r -d $'\0' line; do
    echo $line
done
~~~
Run this script using its name `./workshop01.sh` and we should get a list of all the files that contain T1 weighted image series. Instead of `echo $line` (prints out the current filename) we can now use the `tar` command to extract a single DICOM file from this archive. All the DICOM files contain information about the whole image series so we can extract for example the DeviceSerialNumber tag from that DICOM file and remove the file afterwards again to keep our directory clean:
~~~
#!/usr/bin/env bash

find /data/* -name "*019*.tgz" -print0 | while IFS= read -r -d $'\0' line; do
   tar --wildcards -xf $line "*00001.dcm" --strip-components 3
   dcmdump +P StudyTime *.dcm | cut -d'[' -f2 | cut -d']' -f1
   rm *.dcm
done
~~~
The `dcmdump` command is provided by the dcmtk tools (see dicom.office.de).


Running this script should produce the following list of (anonymized) scanner device serial numbers from each T1 series:
~~~
a03@mmiv-workshop:~/workshop/bin$ ./workshop01.sh
143907.000000
083304.000
124256.000000
164826.000000
104921.000000
125453.000000
204159.000000
~~~

Change the script to show the DeviceSerialNumber tag for the DTI series.

## Regular expressions

You have already seen search strings like "*00001.dcm". The star-character is used to indicate 'anything before'. This wild-card search is convenient enough that there is a more advanced version called 'regular expressions'. They are a standard feature in most programming languages (matlab, python). On the command line we can use the 'grep' command to search using regular expressions.

The '/data/city.csv' file is an example data file downloaded from the radiohead house of cards (https://github.com/dataarts/radiohead) page. The file is quite large for a csv (comma-separated values) file. Use 'head' to look at the beginning of the file:
~~~
head /data/city.csv
-4192,222555,-3554,47
-4167,222557,-3555,47
-4142,222560,-3545,46
-3303,222687,-2879,37
-4094,222558,-3618,50
-3942,222579,-3529,50
-3920,222579,-3553,47
-3897,222582,-3544,47
-3891,222582,-3550,46
-3713,222607,-3432,30
~~~

Opening this file in Excel you will likely get an error message - not all the lines could be loaded.

Arbitrarily lets look at a subset of the lines. All the lines that end with '50'. Because there might be a lot of those lets filter the output of grep with 'head' to only the first couple of lines. This filtering is done by using the pipe (|)-character.
~~~
grep "50" /data/city.csv | head
-4094,222558,-3618,50
-3942,222579,-3529,50
-3891,222582,-3550,46
-3250,222676,-3065,29
-2848,222648,-3650,40
-2850,222642,-3713,44
-2759,222645,-3750,46
-1504,222703,-3726,30
-509,222718,-3705,28
-503,222718,-3708,27
~~~
You notice that most of the lines have the number 50 not at the end. Using regular expressions we can specify that '50' should be at the '$'-end. In regular expressions the dollar sign is used to indicate the end of a line.
~~~
grep "50$" /data/city.csv | head
-4094,222558,-3618,50
-3942,222579,-3529,50
5643,222274,-3795,50
10337,221753,-3884,50
-57119,215704,18565,150
-4641,222068,-3524,50
-4599,222073,-3516,50
3809,222005,-3800,50
4390,221971,-3465,50
4386,221984,-3285,50
~~~
We can remove the '150$' rows by specifying
~~~
grep "50$" /data/city.csv | head
-4094,222558,-3618,50
-3942,222579,-3529,50
5643,222274,-3795,50
10337,221753,-3884,50
-4641,222068,-3524,50
-4599,222073,-3516,50
3809,222005,-3800,50
4390,221971,-3465,50
4386,221984,-3285,50
5590,221823,-3810,50
~~~

The beginning of a line can be indicated similarily with the hat (^)-character.

How do we get all the entries from 10, 20, ..., 90? We can use a character range instead of the specific character '5':
~~~
grep ",[0-9]0$" /data/city.csv | head
-4094,222558,-3618,50
-3942,222579,-3529,50
-3713,222607,-3432,30
-2851,222651,-3620,40
-2852,222649,-3644,40
-2848,222648,-3650,40
-2742,222646,-3752,40
-2030,222676,-3729,30
-1913,222684,-3720,30
-1871,222685,-3725,30
~~~
This uses the fact that all characters are listed in a specific order. It starts with the numbers 0 to 9 followed by the upper case characters A to Z and the lower case characters a to z. If you want to see a list of the order search for the 'latin 1 character table'. 

## Version control

Keep track of your changes using a version control system. Instead of adding dates to filenames and copying files called `_backup42` you need to use a version control software which will help to document your changes over time. GIT is such a modern version control system that makes it easy to document and share your work. It can be used for team-work as well as on its own.

We can use our `workshop` directory to start keeping track of our changes using git. Start by creating an empty git repository in that directory:
~~~
a03@mmiv-workshop:~/workshop/bin$ cd ~/workshop
a03@mmiv-workshop:~/workshop$ git init
Initialized empty Git repository in /home/a03/workshop/.git/
~~~
If you list now the content of the workshop directory it will not show any changes - version control tries to keep your directory clean by storing all the information in the invisible .git directory. The `ls` command has an option to show these invisible directories and files as well. Any file you want to keep track of needs to be added to git. From that point forward the file is under version control. We have a single file `workshop01.sh`, lets add it to git.
~~~
a03@mmiv-workshop:~/workshop$ git add bin/workshop01.sh
a03@mmiv-workshop:~/workshop$
~~~
There is no output - a sign that the command was successful. In order to save a particular version of the file we need to `commit` the file. The first time we try to commit a file git will complain with a message that it does not know who we are:
~~~
a03@mmiv-workshop:~/workshop$ git commit -m "initial checkin message"

*** Please tell me who you are.

Run

  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"

to set your account's default identity.
Omit --global to set the identity only in this repository.

fatal: empty ident name (for <a03@mmiv-workshop.ucsd.edu>) not allowed
~~~
Run the two lines (copy & paste), fill in your email and your full name. Now try the `commit` line again.

If this worked try to change the file using `nano`. Add a comment as a second row, start the line with a hash-sign (# some comment). Add the file to git again and commit using a new message. Your changes have been saved in the .git directory and the git commands 'git log' for example can show you all the different versions.

One nice feature of git is that you cannot loose work you have commited. If by chance you deleted the workshop01.sh file you can get it back using:
~~~
git checkout workshop01.sh
~~~
Try this out by:
~~~
a03@mmiv-workshop:~/workshop$ cd ~/workshop/bin
a03@mmiv-workshop:~/workshop$ rm workshop.sh
a03@mmiv-workshop:~/workshop$ ls
a03@mmiv-workshop:~/workshop$ git checkout workshop.sh
a03@mmiv-workshop:~/workshop$ ls
~~~

Learn more about `git` (`git log`, `git blame`, `git tag`, `git branch`) and how you can check-out a specific version of the files stored in your local git repository.


## JavaScript Object Notation (JSON)

Whereas the comma-separated values file (csv) can contain a single table with a fixed number of columns for each row some data types require more complex structures. If entries in each cell of the table contain for example a list of values a csv file is not a good way to share this data. A JSON file is flexible enough to represent hierarchies of structures. 

There is an example Wmunu.json file in the /data/ directory downloaded from the opendata.cern.ch (W to munu events approved for educational use, doi: 10.7483/OPENDATA.CMS.SQG7.44B9) page. Whereas JSON files are just text files the preferred way to access these is to use the jq command line tool. The program can be used to filter .json files and extract specific entries or convert the files to csv. 

Lets look at the head of the Wmunu.json text file with 'head':
~~~
head /data/Wmunu.json
~~~
Lets ignore the fact that this JSON file could be represented as a CSV file as well.

Now show the complete content (.) of the Wmunu.json file with 'jq'.
~~~
jq "." /data/Wmunu.json
~~~
The content of the file contains an array ('[' .. ']') of structures ('{'..'}'). Each structure contains keys like "E" and values. We can use jq now to extract one or more columns:
~~~
jq ".[].E" /data/Wmunu.json | head
"40.5233280769"
"141.891930672"
"88.0808773377"
"71.7652464497"
"67.7792204192"
"42.1504926279"
"42.9143179702"
"53.1587128483"
"36.0527958217"
"33.241519567"
~~~
We can remove the double quotes if we use the jq option '-r' (raw):
~~~
jq -r ".[].E" /data/Wmunu.json | head
40.5233280769
141.891930672
88.0808773377
71.7652464497
67.7792204192
42.1504926279
42.9143179702
53.1587128483
36.0527958217
33.241519567
~~~

As a more complex example we can extract all "E" and "MET" values for entries that have a "Q" value of "-1" as a comma-separated list:
~~~
jq -r '.[]|select(.Q=="-1")|[.E,.MET]|@csv' /data/Wmunu.json
~~~


## First steps in Matlab





