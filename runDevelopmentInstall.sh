/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install --cask visual-studio-code
brew install --cask docker
brew install docker-compose
brew install --cask mongodb-compass

## Dev tools
brew install nvm
nvm install node
nvm install 12
nvm install 14
nvm install 16

brew install awscli