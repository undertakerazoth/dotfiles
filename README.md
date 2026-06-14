copy iso configuration network



# install yay

sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

git clone https://github.com/USERNAME/dotfiles.git

yay -S zen-browser-bin

sudo pacman -S mako btop

# ttf-jetbrains-mono-nerd 47)
sudo pacman -S yazi ffmpegthumbnailer p7zip jq poppler fd ripgrep fzf zoxide

sudo pacman -S networkmanager blueman cliphist

sudo pacman -S hyprpolkitagent

yay -S vscodium

sudo pacman -S qt5ct qt6ct

yay -S bibata-cursor-theme

hyprctl setcursor Bibata-Modern-Classic 24

gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic'

gsettings set org.gnome.desktop.interface cursor-size 24

sudo pacman -S qt5ct qt6ct kvantum kvantum-qt5

yay -S tela-icon-theme

qt6ct
qt5ct
kvantummanager



sudo pacman -S waybar playerctl pavucontrol



chmod +x ~/.config/waybar/scripts/mako-status.sh

sudo pacman -S hyprpaper

sudo pacman -S fastfetch

sudo pacman -S chafa

sudo pacman -S hyprpicker wl-clipboard libnotify

sudo pacman -S wireplumber brightnessctl playerctl

sudo pacman -S pipewire pipewire-pulse pipewire-alsa wireplumber alsa-utils sof-firmware pavucontrol

systemctl --user enable --now pipewire pipewire-pulse wireplumber
systemctl --user restart pipewire pipewire-pulse wireplumber

chmod +x ~/.config/rofi/scripts/app-categories.sh

sudo pacman -Rns dolphin

yay -S wlogout

sudo pacman -S hyprlock

chmod +x ~/.config/wlogout/launch.sh

sudo pacman -S hypridle

sudo pacman -S greetd greetd-tuigreet

sudo mkdir -p /etc/greetd
sudo nano /etc/greetd/config.toml

[terminal]
vt = 1

[default_session]
user = "greeter"
command = "tuigreet --time --remember --remember-session --asterisks --greeting 'FORGE NODE AUTHENTICATION' --theme 'border=red;text=white;prompt=red;time=red;action=red;button=yellow;container=black;input=red' --cmd start-hyprland"

sudo systemctl disable sddm

sudo systemctl enable greetd

cd ~
mkdir dotfiles
cd dotfiles

git init

ls ~/.ssh

ssh-keygen -t ed25519 -C "your_email@example.com"

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

cat ~/.ssh/id_ed25519.pub

GitHub → Settings → SSH and GPG keys → New SSH key

ssh -T git@github.com

cd ~/dotfiles
git remote -v

git remote set-url origin git@github.com:YOUR_USERNAME/YOUR_REPO.git

git pull --rebase origin main

git add .
git commit -m "Add dotfiles"

git push -u origin main

