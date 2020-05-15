PYENV_ROOT="${HOME}/.pyenv"
echo $PYENV_ROOT

rm -fr $HOME/.pyenv

shell="$1"
if [ -z "$shell" ]; then
shell="$(ps c -p "$PPID" -o 'ucomm=' 2>/dev/null || true)"
shell="${shell##-}"
shell="${shell%% *}"
shell="$(basename "${shell:-$SHELL}")"
fi

case "$shell" in
bash )
    profile="$HOME/.bashrc"
    ;;
zsh )
    profile="$HOME/.zshrc"
    ;;
ksh )
    profile="$HOME/.profile"
    ;;
fish )
    profile="$HOME/.config/fish/config.fish"
    ;;
esac

case "$shell" in
fish )
sed -i '/set -x PATH \""$PYENV_ROOT"/bin\" \$PATH/d' ${profile}
sed -i "/status --is-interactive; and . (pyenv init -|psub)/d" ${profile}
sed -i "/status --is-interactive; and . (pyenv virtualenv-init -|psub)/d" ${profile}
;;
* )
sed -i '/export PATH=\""$PYENV_ROOT"\/bin:\$PATH\"/d' $HOME/.bashrc
sed -i "/eval \"\$(pyenv init -)\"/d" ${profile}
sed -i "/eval \"\$(pyenv virtualenv-init -)\"/d" ${profile}
;;
esac
