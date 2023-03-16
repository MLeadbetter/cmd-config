#[[ -f ~/.Xdefaults ]] && xrdb -merge ~/.Xdefaults
xrdb -merge ~/.Xresources
exec i3
