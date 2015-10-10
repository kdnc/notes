# Git Useful Commands

## Table of Content
[TOC]


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

## Add files to the commit

    git add */src/*
    git add */pom.xml

## Commit to the git

    git commit -a -m "enter commit message inside these quotes"

## Push the code to the repository

    git push -u origin master

If this command did not work and says to issue the –set-upstream command then issue the following command

    git push --set-upstream origin master

Reference - <http://stackoverflow.com/questions/10032964/git-push-fatal-no-configured-push-destination>

## Remote Urls

Set the remote url

    git remote set-url origin https://github.com/kdnc/currency-vision.git

Shows the remote url of your repository

    git remote -v

## Show status

List out files that are untracked (only in your working directory), modified (tracked but not yet updated in your index), and staged (added to your index and ready for committing).

    git status

## Reverts uncommited changes

Reverts uncommited changes to the previous version. (throws away all uncommitted changes)

    git reset --hard

Reference - <http://stackoverflow.com/questions/9529078/how-do-i-use-git-reset-hard-head-to-revert-to-a-previous-commit>

Revert (reset) a single file. This will checkout the file from HEAD, overwriting your change.

    git checkout filename
    
Reference - <http://www.norbauer.com/rails-consulting/notes/git-revert-reset-a-single-file.html>

## Configure git

    git config --global user.email "nuwanlanka@gmail.com"
    git config --global user.name "Nuwan Chamara"

Following link contains more useful git commands

Reference - <https://www.siteground.com/tutorials/git/commands.htm>