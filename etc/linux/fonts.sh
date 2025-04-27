mkdir -p ~/.local/share/fonts

cd /tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip
unzip CascadiaMono.zip -d CascadiaFont
cp CascadiaFont/*.ttf ~/.local/share/fonts
rm -rf CascadiaMono.zip CascadiaFont

wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/IntelOneMono.zip
unzip IntelOneMono.zip -d IntelOneMono
cp IntelOneMono/*.ttf ~/.local/share/fonts
rm -rf IntelOneMono.zip IntelOneMono

fc-cache
cd -
