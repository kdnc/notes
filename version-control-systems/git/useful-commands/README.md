# Git Useful Commands

## Table of Contents
**[Push an existing project to github](#push-an-existing-project-to-github)** 
**[Add files to the commit](#add-files-to-the-commit)** 
**[Commit to the git](#commit-to-the-git)** 
**[Push the code to the repository](#push-the-code-to-the-repository)** 
**[Remote Urls](#remote-urls)** 
**[Show status](#show-status)** 
**[Reverts uncommited changes](#reverts-uncommited-changes)** 
**[Configure git](#configure-git)** 

## Push an existing project to github

* Create the project
* cd from terminal into the project directory
* Initialize the project



    touch README.md
    git init
    touch .gitignore
    

* Update the .gitignore file by adding files and folders to ignore
* Push the code to the github.



    git status
    git add .
    git status
    git commit -m "first commit"
    git remote -v
    git remote add origin https://github.com/kdnc/gwt-code-snippets.git
    git remote -v
    git pull origin master
    git push -u origin master


Reference - <https://help.github.com/articles/adding-an-existing-project-to-github-using-the-command-line/>

---

## Clone branch
    // Fetch all the branches and check out the specified branch name
    git clone --branch master https://github.com/kdnc/notes.git

---

## Add files to the commit

    git add */src/*
    git add */pom.xml

---

## Commit to the git

* Commit with a message

```
git commit -a -m "enter commit message inside these quotes"
```
* Change commit author at once after you commited
```
git commit --amend --author="Author Name <email@address.com>"
```

---

## Push the code to the repository

### Push code with configured credentials

    git push origin master
    git push origin feature/feature-name

If this command did not work and says to issue the –set-upstream command then issue the following command

    git push --set-upstream origin master

Reference - <http://stackoverflow.com/questions/10032964/git-push-fatal-no-configured-push-destination>

### Push code with manually defining credentials

    git push https://username:password@github.com/kdnc/angular-reference-application.git --all 

---

## Rename your git branch on both local and remote
```
$ git branch -m old_branch new_branch         //# Rename branch locally    
$ git push origin :old_branch                 //# Delete the old branch    
$ git push --set-upstream origin new_branch   //# Push the new branch, set local branch to track the new remote 
```

---

## Remote Urls

Set the remote url

    git remote set-url origin https://github.com/kdnc/currency-vision.git

Shows the remote url of your repository

    git remote -v

---

## Show status

List out files that are untracked (only in your working directory), modified (tracked but not yet updated in your index), and staged (added to your index and ready for committing).

    git status
    
---

## Reverts uncommited changes

Reverts uncommited changes to the previous version. (throws away all uncommitted changes)

    git reset --hard

Reference - <http://stackoverflow.com/questions/9529078/how-do-i-use-git-reset-hard-head-to-revert-to-a-previous-commit>

Revert (reset) a single file. This will checkout the file from HEAD, overwriting your change.

    git checkout filename
    
Reference - <http://www.norbauer.com/rails-consulting/notes/git-revert-reset-a-single-file.html>

---

## Configure git

### Setup username and email
```bash
git config --global user.email "nuwanlanka@gmail.com"
git config --global user.name "Nuwan Chamara"
```
---

## Git rebasing

### Standard rebasing
* Git rebase in standard mode will automatically take the commits in your current working branch and apply them to the head of the passed branch.
```
git rebase <base>
git rebase release/1.0
```
* Continue rebasing. Conflicts might come. Fix the conflict. Right click the file in 'Unstaged file section' in Source tree and 'Resolve Conflicts -> Mark as resolved'. Do the `git rebase --continue` again. If nothing happens, do `git rebase --skip`

---

### Interactive rebasing
* Running git rebase with the -i flag begins an interactive rebasing session. Instead of blindly moving all of the commits to the new base, interactive rebasing gives you the opportunity to alter individual commits in the process. This lets you clean up history by removing, splitting, and altering an existing series of commits.
```
git rebase --interactive <base>
```
* This opens an editor where you can enter commands (described below) for each commit to be rebased. These commands determine how individual commits will be transferred to the new base. You can also reorder the commit listing to change the order of the commits themselves. Once you've specified commands for each commit in the rebase, Git will begin playing back commits applying the rebase commands. The rebasing edit commands are as follows:
```text
pick 2231360 some old commit
pick ee2adc2 Adds new feature
# Rebase 2cf755d..ee2adc2 onto 2cf755d (9 commands)
#
# Commands:
# p, pick = use commit
# r, reword = use commit, but edit the commit message
# e, edit = use commit, but stop for amending
# s, squash = use commit, but meld into previous commit
# f, fixup = like "squash", but discard this commit's log message
# x, exec = run command (the rest of the line) using shell
# d, drop = remove commit
```

---

### Aborting a rebase
```
git rebase --abort
```

---

### Git Rebase VS Git Pull

If you follow the instructions in the Git message and pull:

```bash
$ git pull origin master
```
Git actually does the following two commands:

```bash
$ git fetch origin master
$ git merge origin/master
```
And the following happens to the commit tree:
```bash
C1 - C2 - C3 - C4 - C5 - C6 - C7 (master)
              \               \
               C5' - C6' - C7' - C8 (origin/master)
```

On the other hand, if you are to rebase:

```bash
$ git fetch origin master
$ git rebase origin
```

The following happens to the commit tree:
```bash
 C1 - C2 - C3 - C4 - C5' - C6' - C7' - C5 - C6 - C7 (master)
                              |
                              (origin/master)
```
---
### Squashing commits with rebase

Suppose you have four different commit, but you want to convert into single commit, Following example will helps to do.

You commits,

 1. List item

```bash
#1 01d1124  Adding license

#2 6340aaa Moving license into its own file
 
#3 ebfd367 Jekyll has become self-aware.
 
#4 30e0ccb Changed the tagline in the binary, too.
```

```bash
$ git rebase -i HEAD~4

p 01d1124 Adding license
s 6340aaa Moving license into its own file
s ebfd367 Jekyll has become self-aware.
s 30e0ccb Changed the tagline in the binary, too.

# Rebase 60709da..30e0ccb onto 60709da
#
# Commands:
#  p, pick = use commit
#  e, edit = use commit, but stop for amending
#  s, squash = use commit, but meld into previous commit
#
# If you remove a line here THAT COMMIT WILL BE LOST.
# However, if you remove everything, the rebase will be aborted.
#
```
This may prompt you to do an confirmation for commit, once you successfully rebase you can push with -f(force).

---

Following link contains more useful git commands

Reference - <https://www.siteground.com/tutorials/git/commands.htm>
