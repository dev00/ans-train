#!/bin/bash

if [[ $EUID == 0 ]]; then
  rpm -i https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
  yum update -y
  yum install git weechat vim tmux ansible -y
fi

git config --global user.name ""
git config --global user.email ""
git config --global credential.helper cache

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cat <<EOF > ~/.vimrc
execute pathogen#infect()
syntax on
set background=dark
colorscheme solarized
EOF

rm -rf ans-train
git clone https://github.com/dev00/ans-train.git
ln -s dep-install ~/ans-train/dep-install
