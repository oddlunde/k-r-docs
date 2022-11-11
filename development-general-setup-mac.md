# Development guide for Mac users

:alert: Note that the new Macbook M1/M2 chipset could interfere with the setup. 

## Installtion guide
This guide will run all the commands under and install the following programs and tools to help you get ready for development.



You may need to change the file to be executable

`sudo chmod +x runDevelopmentInstall.sh`

run the script `./runDevelopmentInstall.sh`

Find yourself a coffe while the script do your job :coffee:


### Basics
- [Brew](#brew)
- [Visual Code](#visual-studio)
- [Docker](#docker)
- MongoDB Compass
- Git
- ssh (generation)

### Development Tools
- node
- awscli

## Brew 
Brew is a package management system for MacOS

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

## Visual Studio
Simple text editor [source](https://formulae.brew.sh/cask/visual-studio-code)

`brew install --cask visual-studio-code`

## Docker
Container service and hub. [source](https://formulae.brew.sh/formula/docker)

`brew install --cask docker `

## MongoDB Compass
Compass is an interactive tool for querying, optimizing, and analyzing your MongoDB data.

`brew install --cask mongodb-compass`