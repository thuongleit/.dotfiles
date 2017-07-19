echo "---------- Cloning zprezto ----------"
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
echo "---------- Cloning config -----------"
git clone https://github.com/amilehu/my-macos-setup.git ~/.zsh

echo "---------- Setting up ----------"
ln -s ~/.zprezto/runcoms/zlogin ~/.zlogin
ln -s ~/.zprezto/runcoms/zlogout ~/.zlogout
ln -s ~/.zprezto/runcoms/zpreztorc ~/.zpreztorc
ln -s ~/.zprezto/runcoms/zprofile ~/.zprofile
ln -s ~/.zprezto/runcoms/zshenv ~/.zshenv
ln -s ~/.zsh/.zshrc ~/.zshrc
chsh -s $(which zsh)
source ~/.zshrc
echo "---------- YAY! Enjoy your ENV ----------"
