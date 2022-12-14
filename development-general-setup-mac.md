# Development guide for Mac users

:rotating_light: Note that the new Macbook M1/M2 chipset could interfere with the setup. 

If there is more, please update this document so its even easier for the next developer in line :)

## Installtion guide
This guide will run the commands under and install the following programs and tools to help you get ready for development. Except for auth (ssh and aws).

You may need to change the file to be executable

`sudo chmod +x runDevelopmentInstall.sh`

run the script `./runDevelopmentInstall.sh`

You need to press Enter to procced then;
find yourself a coffe while the script do your job :coffee:



### Basics
- [Development guide for Mac users](#development-guide-for-mac-users)
  - [Installtion guide](#installtion-guide)
    - [Basics](#basics)
    - [Development Tools](#development-tools)
    - [Auth](#auth)
  - [Brew](#brew)
  - [Git](#git)
  - [Visual Studio](#visual-studio)
  - [Docker](#docker)
  - [Docker compose](#docker-compose)
  - [MongoDB Compass](#mongodb-compass)
  - [Nvm](#nvm)
  - [Node](#node)
  - [ssh (not in script)](#ssh-not-in-script)
  - [AWS cli](#aws-cli)
  - [Docker services](#docker-services)

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

## Docker compose
Start services and applications. [source](https://formulae.brew.sh/formula/docker-compose)
`brew install docker-compose`

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

## Docker services
To get some of the applications running, you need MongoDB and Redis services running on localhost. This can be done with docker-compose and some data. 

You can add this docker-compose file to get your services up and running. Its recommended to use Docker CLI to help you see the status on the services. 

``` yml
version: '3.7'

services:
  mongo:
    image: mongo:4.2.23
    ports:
      - "27017:27017"
    volumes:
      - ./dbdata:/data/db
    restart: always
    environment:
      - MONGO_INITDB_ROOT_USERNAME=user
      - MONGO_INITDB_ROOT_PASSWORD=password

  redis:
    image: redis:5.0.7
    ports:
      - "6379:6379"
    restart: always

```

If you studie the docker-compose file thats written in yml it has a volume. This needs to be populated with a test-database from Koer.

Start the services with `-d`is to be detached (less logg).
`docker-compose up -d`

This will start the services MongoDB and Redis. 

To check if the containers is running use 
`docker ps`
This will list the containers running. Copy the ID from the mongoDB container.
You need to give access to the file mongodump-koerdb for the container. 
 `docker cp mongodump-koerdb <containerID>:mongodump-koerdb`

Next you need to interact with the container
`docker exec -it <containerID> bash `

To see that your inside the container, the username will change to "root@<containerID>". Use mongorestore with username and password to get the mongodump-koerdb file inserted into the database. 
`mongorestore -u user -p password --archive=mongodump-koerdb `

This should end up with around 20 000 documents in the database.