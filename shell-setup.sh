#!/bin/zsh


echo "Installing oh-my-zsh"
echo "INFO: RERUN THIS SCRIPT AFTER INSTALLING OH-MY-ZSH!!!!"
bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &&

echo "Enabling some zsh plugins"
sed -i.bu -e '/^plugins=(/a\'$'\n''osx\
aws\
docker\
git-extras\
gitignore\
helm\
history-substring-search\
iterm2\
kops\
kubectl\
rvm\
ssh-agent\
terraform\
thefuck\
vscode\
git-flow\
colorize\
zsh-syntax-highlighting\
encode64\
' ~/.zshrc

echo "Installing spaceship prompt"
git clone https://github.com/denysdovhan/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt
ln -s ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/themes/spaceship.zsh-theme
sed -i.bu 's/ZSH_THEME="robbyrussell"/ZSH_THEME="spaceship"/g' ~/.zshrc
sed -i.bu 's/# COMPLETION_WAITING_DOTS="true"/COMPLETION_WAITING_DOTS="true"/g' ~/.zshrc

touch ~/.oh-my-zsh/source.zsh
echo 'source ~/.oh-my-zsh/source.zsh' >> ~/.zshrc

echo "Installing alis-tips"
git clone https://github.com/djui/alias-tips.git ~/.oh-my-zsh/custom/plugins/alias-tips
#sed -i.bu -e '/plugins=(/a\'$'\n''alias-tips' ~/.zshrc
echo 'source ~/.oh-my-zsh/custom/plugins/alias-tips/alias-tips.plugin.zsh' >> ~/.oh-my-zsh/source.zsh

echo "Install zsh docker completion"
mkdir -p ~/.oh-my-zsh/custom/completion
curl -L https://raw.githubusercontent.com/docker/compose/1.23.1/contrib/completion/zsh/_docker-compose > ~/.oh-my-zsh/custom/completion/_docker-compose

echo 'fpath=(~/.zsh/completion $fpath)' >> ~/.oh-my-zsh/source.zsh
echo 'autoload -Uz compinit && compinit -i' >> ~/.oh-my-zsh/source.zsh

#git clone https://github.com/unixorn/git-extra-commands.git ~/.oh-my-zsh/custom/plugins/git-extra-commands
#echo 'source ~/.oh-my-zsh/custom/plugins/git-extra-commands/git-extra-commands.plugin.zsh' >> ~/.oh-my-zsh/source.zsh

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo 'source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.oh-my-zsh/source.zsh

git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
rm -f ~/.zcompdump
echo 'source ~/.oh-my-zsh/custom/plugins/zsh-completions/zsh-completions.plugin.zsh' >> ~/.oh-my-zsh/source.zsh


echo "setting up iterm2"
curl -o ~/Downloads/solarized.itermcolors https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Dark.itermcolors
git clone https://github.com/powerline/fonts.git ~/Downloads/fonts && cd ~/Downloads/fonts && ./install.sh && rm -rf ~/Downloads/fonts


echo 'DISABLE_UPDATE_PROMPT=true' >> ~/.zshrc
