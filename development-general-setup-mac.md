# Development guide for Mac users

	:rotating_light: Note that the new Macbook M1/M2 chipset could interfere with the setup. 

## Installtion guide
This guide will run the commands under and install the following programs and tools to help you get ready for development. Except for auth (ssh and aws).

You may need to change the file to be executable

`sudo chmod +x runDevelopmentInstall.sh`

run the script `./runDevelopmentInstall.sh`

Find yourself a coffe while the script do your job :coffee:


### Basics
  - [Brew](#brew)
  - [Git](#git)
  - [Visual Studio](#visual-studio)
  - [Docker](#docker)
  - [MongoDB Compass](#mongodb-compass)

### Development Tools
- [nvm](#nvm)
- [node](#node)
  
### Auth
- [ssh (not in script)](#ssh-not-in-script)
- [awscli (need to add keys)](#aws-cli)

## Brew 
Brew is a package management system for MacOS

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

## Git
Version control for your source code.

`brew install git`

## Visual Studio
Simple text editor [source](https://formulae.brew.sh/cask/visual-studio-code)

`brew install --cask visual-studio-code`

## Docker
Container service and hub. [source](https://formulae.brew.sh/formula/docker)

`brew install --cask docker `

## MongoDB Compass
Compass is an interactive tool for querying, optimizing, and analyzing your MongoDB data.

`brew install --cask mongodb-compass`

## Nvm
Node version management to use the correct node version for your project. To change node version use `nvm use <number>`

`brew install nvm`

## Node
Server-side JavaScript.

```
nvm install node
nvm install 12
nvm install 14
nvm install 16
```


## ssh (not in script)
Note: This is not in the script.
This step you could skip, if you already have a id/id.pub file to use.

``` bash
cd $HOME
ssh-keygen -t ed25519 -C "your_email@koer.com"
cat .ssh/id_ed25519.pub
```

Copy your .pub content and paste it in [GitLab Security](https://gitlab.com/-/profile/keys) "ssh keys". Then you could pull git-repo without using username/password.

[Add sshkey source](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

## AWS cli
AWS cli helps you login to AWS with commandline.

`brew install awscli`

When its installed (with the script). You need to add Acesskey, SecretKey and Region. To get your keys go to [AWS](https://us-east-1.console.aws.amazon.com/iam/home?region=eu-north-1#/security_credentials
) and "create access key".

You could import them to `.zshrc` to store them on your user.
```bash 
cd $HOME
vim .zshrc
```

Copy the variables into the file:
```
export AWS_ACCESS_KEY_ID=<YOUR-ACCESS-KEY>
export AWS_SECRET_ACCESS_KEY=<YOUR-SECRET>
export AWS_DEFAULT_REGION=eu-north-1
```
If there is more, please update this document so its even easier for the next developer in line :)
