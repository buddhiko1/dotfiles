# abbr

function audio --description 'audio'
  pavucontrol
end

function disk --description 'disk'
  ncdu $argv
end

# docker
function du --description 'docker compose up -d'
  docker compose up -d
end

function ds --description 'docker compose stop'
  docker compose stop
end

function dr --description 'docker compose restart'
  docker compose restart 
end

function dd --description 'docker compose rm'
  docker compose rm
end

# emerge 
function es --description 'emerge search'
  sudo emerge --search $argv
end

function ei --description 'emerge install'
  sudo emerge --ask $argv
end

function ed --description 'emerge uninstall'
  sudo emerge --deselect $argv
end

function edep --description 'list package dependent on'
  sudo equery d $argv
end

function eu --description 'emerge update'
  sudo emerge --update --deep --newuse @world --exclude nodejs --exclude gentoo-sources --exclude grub
end

function ec --description 'emerge deep clean'
  sudo emerge --ask --depclean
end

function el --description 'list installed packages'
  sudo qlist -IRv $argv
end

function en --description 'read news'
  sudo eselect news read
end

function ef --description 'emerge use flag'
  sudo emerge --info | grep ^USE
end

function esync --description 'emerge sync'
  sudo emerge --sync
end

# file manager
function f --description 'file manager'
  nnn
end

# git
function gc --description 'git clone'
  git clone $argv
end

function gp --description 'git push '
  git push
end

function gui --description 'gitui'
  ssh-add ~/.ssh/id_ed25519 && gitui
end

# image
function iv --description 'image viewer'
  swayimg $argv
end

function ic --description 'screenshot'
  grimshot save area ~/Pictures/last.png
end

function ie --description 'edit screenshot'
  swappy -f ~/Pictures/last.png -o ~/Pictures/last.png
end

# key name
function kn --description 'get key name'
  wev 
end

# angular 
function ns --description 'pnpm run start'
  pkill node && pnpm run start
end

# pnpm
function pi --description 'pnpm install'
  pnpm install $argv
end

function pa --description 'pnpm add'
  pnpm add $argv
end

function pu --description 'pnpm update'
  pnpm add $argv
end

function pr --description 'pnpm run'
  pnpm run $argv
end

function pe --description 'pnpm exec'
  pnpm exec $argv
end

function pd --description 'pnpm rm'
  pnpm rm $argv
end

function pc --description 'pnpm store prune'
  pnpm store prune $argv
end

# ssh
function ssh --description 'ssh'
  TERM=xterm-256color /usr/bin/ssh $argv
end

# system
function ss --description 'print system summary'
  neofetch
end

function si --description 'print system info'
  btop $argv
end

function sl --description 'check system boot error'
  journalctl -b 0 -p 4
end

# supper user
function sr --description 'su -m root'
  su -m root
end

# theme tool
function tl --description 'switch to light theme'
  $HOME/.config/helix/to_light.sh
end

function td --description 'switch to dark theme'
  $HOME/.config/helix/to_dark.sh
end

# usb
function um --description 'mount usb'
  udisksctl mount -b /dev/sdb1
end

function uu --description 'unmount usb'
  udisksctl unmount -b /dev/sdb1
end

#nvim
function svim --description 'nvim'
  sudo -E nvim $argv
end

function vim --description 'nvim'
  nvim $argv
end

# working directory
function wpw --description 'pali-web'
  cd ~/pali-web
end

# function wps --description 'pali-server'
#   cd ~/pali-server
# end

function wd --description 'download'
  cd ~/Downloads
end

# zypper
function zs --description 'zypper search'
  sudo zypper search $argv
end

function zi --description 'zypper install'
  sudo zypper in $argv
end

function zd --description 'zypper uninstall'
  sudo zypper rm  $argv
end

function zu --description 'zypper update'
  sudo zypper update
end

function zl --description 'list installed packages'
  sudo zypper packages -i
end

function zr --description 'zypper refresh'
  sudo zypper refresh
end

function zq --description 'zypper info'
  sudo zypper info $argv
end
