#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

# Check If Zsh Has Been Installed
if [ -f /home/vagrant/.zshrc ]
then
    echo "Zsh already installed."
    exit 0
fi

sudo apt install -y zsh

cd /home/vagrant

echo -e "vagrant" | sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

sed -i -- "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"agnoster\"/g" /home/vagrant/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions

git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

sed -i -- "s/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions history-substring-search)/g" /home/vagrant/.zshrc

git clone https://github.com/agnoster/agnoster-zsh-theme.git
mv agnoster-zsh-theme/agnoster.zsh-theme ~/.oh-my-zsh/themes
rm -rf agnoster-zsh-theme

source ~/.zshrc