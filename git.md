---
title: "Git Commands"
output: 
  html_document: 
    toc: yes
---

# Introduction
This page is the continuation of [my blog post on git commands](https://paulremote.blogspot.de/2013/10/git-commands.html).

My typicall git use consist in archiving file modifications for personnal projects.
I never work in the master branch, always in a development branch called `develop`. 
I merge `develop` in `master`, only before pushing modifications back to my remote archive.
This simple branching strategy makes it much easier to deal with potential changes in the remote master branch.


# Basic git commands to start working asap
Initialise a new repository
    
    git init
    
Change to the development branch
    
    # If the branch doesn't exist, create it first.
    git branch develop
    git checkout develop

Work and modify files in the folder. 
At some point, when your work has reached a certain status, you might want to archive it before you move on to something else. The few commands below tell git to archive the work. 
All file modifications will be archived with a commit hash which is a unique key describing your changes.
The most important part is entering a commit message, it should be sufficiently general to describe your changes with a high level of abstraction and sufficiently specific to be understood amoung all other changes later.

First show which files have been modified in the folder under git control: 

    git status

Add a file to be committed 

    git add filename
    # Add all files
    git add --all
    
Commit and describe changes

    git commit -m "describe changes made to those files"
    
Now you can continue working and changing files. 
Repeat the `git add --all` and `git commit -m "describe changes"` each time your reach a 
consistant change status.

At some point you will be ready to upload your content to a remote archive. 
Merge to the master branch

    git checkout master
    git merge develop
    
Push contents to the remote repository

    git push

See below how to set-up the remote repository with `git remote add origin ssh:repositoryurl` and pushing content for the first time with `git push -u origin master`.

Check status again 

    git status
    
Go back to the development branch

    git checkout develop

Continue to modify files in the repository.

# Uploading content to online git platforms
Git is useful as a version management on its own. 
But it's even more usefull when code can be back-up online. 
Free public git storage is availble on Github. 
Free public and private git storage are available on Bitbucket, with up to 5 collaborators on one project.

Commands I've used to upload content to github.com/paul4forest/forestproductsdemand are:
```
    git remote add origin https://github.com/paul4forest/forestproductsdemand
    git pull origin master
    git add
    git commit -m "Explanatory message"
    git push origin master
```

Commands to upload content to a fresh repository from bitbucket :
```
    mkdir /path/to/your/project
    cd /path/to/your/project
    git init
    git remote add origin ssh://git@bitbucket.org/username/bbreponame.git
    # Upload and set the local changes as upstream
    git push -u origin master
```
See also this discussion on [why do I need to set upstream](http://stackoverflow.com/questions/6089294/why-do-i-need-to-do-set-upstream-all-the-time)?

Commands to copy an existing repository from bitbucket :

     git clone git@bitbucket.org/username/bbreponame.git

# Going back in time 

## Log
Display the modification log

    git log 

In the log, you can copy the begining of a commit hash for use as `commit_sha` in the reset commands below.

Display the log of a particular branch (after a fetch for example)

    git log origin/master 

Display a compact log for one file or one directory only

    git log --abbrev-commit --pretty=oneline path_to_file


## Reset whole folder
Identify the commit identity in the log and copy its sha number. Then to go back to this state for the whole folder: 

    git reset --hard commit_sha

Use the begining of a `commit_sha` copied from the log.

## Reset only one file
To go back to this state for only one file, see git checkout

    git checkout commit_hash  path_to_file/file_name

No commit hash to get to get the file back to the latest commit.

Chekout the older revision of a file under a new name


    git show commit_sha:filename > new_file_name

See also alias and git grep below.

# Help

Get help on a command (will start a web browser):

    git init --help


# Configuring user name and email

Display your user name, email and remote repositories

    git config -l

To change username and email

    git config --global user.name "Your Name" 

    git config --global user.email you@example.com

Setting your email in git explains how to change the email for the current repository only.


# Branching

To start work in a new branch:

    git branch new_branch_name
    git checkout new_branch_name

To compare a file between 2 branches:

    git diff branch1 branch2 file_name

To merge changes back to the master branch:

    git checkout master

    git merge branch1

If there were conflicts, they will be presented in this way:

    "The area where a pair of conflicting changes happened is marked with markers &lt;&lt;&lt;&lt;&lt;&lt;&lt;, =======, and &gt;&gt;&gt;&gt;&gt;&gt;&gt;. The part before the ======= is typically your side, and the part afterwards is typically their side."


I might need to delete a branch at some point:

    git branch -d branchname 

Delete a remote branch (stackoverflow question)

    git push --delete origin temp

Deleting your master branch.


If I am on a detached head, it is recommended to create a temporary branch (stackoverflow).

    git branch temp

    git checkout temp

    git add -a

    git  commit -m "description of changes"

    git checkout master

    git merge temp

Delete uncommitted changes in current working directory:

    git checkout branch_name .

See also below git clean.


Add minor change to the previous commit (git commit --amend):

    git commit --amend

# Tagging

Creating an annotated tag

    git tag -a v1.4 -m 'my version 1.4'

You can add a tag after the fact. To tag an earlier commit, specify the commit checksum or part of it:

    git log --pretty=oneline

    git tag -a v1.2 -m 'version 1.2' 9fceb02

Delete a tag

    git tag -d tag_name


A regular push command won't push a tag (bitbucket), to push all your tags :

    git push origin --tags

Display changes

To view modified files that have not been committed and to view commit history you can use: 

    git status
    git log

    git log --pretty=oneline 

Shows the changes between the working directory and the index.

    git diff


Shows the changes between the index and the HEAD

    git diff --cached

Shows all the changes between the working directory and HEAD

    git diff HEAD

The 3 lines above were copied from this question on git diff.



Show when the tip of branches have been updated

    git reflog

 Alternatively, call the repository browser with:

    gitk

To view a shorter version of the log file, and get an idea at where I am in the history:

    git log --graph --decorate --all --pretty=oneline

You can define an alias for git log as explained be Fred here:

    git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)&lt;%an&gt;%Creset' --abbrev-commit" 

The new alias can then be used with

    git lg 

Use tags to specify important points in history, such as software versions.


# Working with files

Get back a file to the last commit 

    git checkout path_to_file/file_name

Get back a file to a previous commit, using the commit hash

    git checkout 4fb987f175210c09daaa4d0240070ffc9641120b path_to_file/file_name

Rename a file

    git mv file_name file_name_new

Change the case of a file on a windows FAT 32 system:

    git mv load.r load2.R
    git mv load2.R load.R

Sometimes the vi editor starts. To exit the vi editor:

    ESC:q!

If a file or folder has been renamed outside of git, I get this warning:

    $ git add .
    warning: You ran 'git add' with neither '-A (--all)' or '--ignore-remo
    whose behaviour will change in Git 2.0 with respect to paths you removed
    Paths like 'docs/efi/efi_logo_rgb_small_siw.jpg' that are
    removed from your working tree are ignored with this version of Git.

    * 'git add --ignore-removal ', which is the current default,
      ignores paths you removed from your working tree.

    * 'git add --all ' will let you also record the removals.

Therefore I think I should always run "git add --all "


Remove local (untracked) files from my current Git branch

Show what will be deleted with the -n option:

    git clean -f -n

Then - beware: this will delete files - run:

    git clean -f 

Alternatively clean in interactive mode:

    git clean -i

## Searching text

 Search all files in the subdirectory "subdir" for lines containing the words "factor" and "item". Show 2 lines of context (2 leading and 2 trailing lines).

    git grep -e item --and -e factor -C 2 -- subdir/

Stackoverflow:  How to search committed code in the git history?


## Replacing strings

Use git grep to replace strings in many files in the directory :

    git grep -l 'original_text' | xargs sed -i 's/original_text/new_text/g'

# .gitignore

To ignore all files in a folder but not the folder itself. Put this .gitignore into the folder, then git add .gitignore

    *
    !.gitignore

 To exclude everything except a specific directory foo/bar (note the /* - without the slash, the wildcard would also exclude everything within foo/bar):

    /*
    !/foo
    /foo/*
    !/foo/bar


# Remote

When a repository is connected to several remote repositories, to change the default git remote, push with :

    git push -u origin master

Then later push of that branch to that remote can be made simply with:

    git push


Another command without specifying the remote and the branch

    $ git push -u

    fatal: The current branch master has no upstream branch.

    To push the current branch and set the remote as upstream, use


        git push --set-upstream origin master

After I run this set upstream flag, I can push to the remote server. Then I get this message


    [...]
     * [new branch]      master -&gt; masterBranch master set up to track remote branch master from origin. 

I'll have to figure out what this does.


# Publishing project documentation on github

SO Answer to the question "How to add a git repo as a submodule of itself? (Or: How to generate GitHub Pages programmatically?)": An alternative to using Git Submodules to generate GitHub Pages is to use Git Subtree Merge Strategy.


In fact I didn't use quite that strategy and I instead cloned a temporary copy of my repository. Created the gh-page  branch. Pushed it to github. Then I went back to the original repository (where I have a few large untracked data files I find handy to keep for analyses purposes).


Then within the inst folder, I cloned only the gh-branch. To clone only one branch:

    git clone -b mybranch --single-branch git://sub.domain.com/repo.git

Then I renamed the folder to "web", so that I had a inst/web folder, tracking the gh-branch. inst/web is ignored in the main repository.


# References

Presentations:

    Power Your Workflow With Git (towards 43 minutes, an animation of branches and merging) A recommendation if you work in a team, don't use pull, but use fetch + merge.
    Getting Started with GitHub + Git

Workflow:

    Mixing private and public repository in Git workflow

Turorial:

    Git foundations


