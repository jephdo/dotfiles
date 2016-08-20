/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update && brew upgrade
brew tap caskroom/cask
brew install brew-cask

brew install Caskroom/cask/xquartz
brew cask install java

# https://www.r-bloggers.com/installing-r-on-os-x-100-homebrew-edition/
brew tap homebrew/science
brew install R
 
brew install Caskroom/cask/rstudio

brew install s3cmd

brew install libsvg curl libxml2 gdal geos boost
brew install freetype
brew install gfortran


# http://nerderati.com/2014/09/03/installing-matplotlib-numpy-scipy-nltk-and-pandas-on-os-x-without-going-crazy/
xcode-select --install
brew install python # to update the latest python
brew install python3

# mkvirtualenv test
# workon scientific: Switches you to the (already created) scientific environment.
# workon: When you don't specify an environment, this will print all existing environments available.
# rmvirtualenv statistics: Completely remove the statistics environment.
pip install virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

mkvirtualenv scientific
pip install numpy scipy matplotlib pandas nltk ipython jupyter



# http://stackoverflow.com/questions/27381531/how-to-install-sublime-text-3-using-homebrew
brew tap caskroom/versions
brew cask install sublime-text3
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl

brew install tmux

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


# monokai terminal
# https://github.com/stephenway/monokai.terminal

# Creates a new ssh key, using the provided email as a label
# ssh-keygen -t rsa -b 4096 -C "your_email@example.com"


brew cask install google-chrome firefox google-hangouts

# configure git
brew install git
echo "Configuring git settings..."
gitusername=$(git config --global user.name; exit 0) # exit 0 in case no user.name exists
gituseremail=$(git config --global user.email; exit 0) # exit 0 in case no user.name exists
if [[ -z "$gitusername" || -z "$gituseremail" ]]; then
  read -p "What name should go on your commits? " -er gitusername < $input
  read -p "What is your git email address? " -er gituseremail < $input
  git config --global push.default simple
  git config --global user.name "$gitusername"
  git config --global user.email "$gituseremail"
  git config --global credential.helper osxkeychain
fi