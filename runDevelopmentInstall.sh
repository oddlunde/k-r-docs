/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install NONINTERACTIVE=1 --cask visual-studio-code
brew install NONINTERACTIVE=1 --cask docker
brew install NONINTERACTIVE=1 docker-compose
brew install NONINTERACTIVE=1 --cask mongodb-compass

## Dev tools
brew install NONINTERACTIVE=1 nvm
nvm install node
nvm install 12
nvm install 14
nvm install 16

brew install awscli
