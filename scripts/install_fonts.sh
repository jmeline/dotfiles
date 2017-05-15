# install font
dotfile_path=$(pwd)
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Sauce Code Pro Black Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SourceCodePro/Black/complete/Sauce%20Code%20Pro%20Black%20Nerd%20Font%20Complete.ttf
cd $dotfile_path
