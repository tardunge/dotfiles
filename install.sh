#!/bin/zsh
echo "Creating Symbolic links"
ln -sf $(pwd)/zshrc ~/.zshrc
ln -sf $(pwd)/tmux.conf ~/.tmux.conf
ln -sf $(pwd)/p10k.zsh ~/.p10k.zsh
ln -sf $(pwd)/asdf/tool-versions ~/.tool-versions
ln -sf $(pwd)/asdf/asdfrc ~/.asdfrc
ln -sf $(pwd)/dir_colors ~/.dir_colors
omp_agent_dir="${PI_CODING_AGENT_DIR:-$HOME/.omp/agent}"
mkdir -p "$omp_agent_dir/themes"
ln -sf "$(pwd)/omp/themes/nord.json" "$omp_agent_dir/themes/nord.json"
if command -v omp >/dev/null 2>&1; then
  omp config set theme.dark nord
  omp config set symbolPreset nerd
fi
mkdir -p ~/.config/nvim
ln -sf $(pwd)/vimrc ~/.config/nvim/init.vim
ln -sf $(pwd)/coc-settings.json ~/.config/nvim/coc-settings.json
echo "Linked successfully. Enjoy!!"
