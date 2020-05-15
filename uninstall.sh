#!/usr/bin/env bash

# Remove local .pyenv
rm -fr $HOME/.pyenv

# Remove environment variables in shell conf 
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
sed -i "/\.pyenv\/bin/d" ${profile}
sed -i "/status --is-interactive; and . (pyenv init -|psub)/d" ${profile}
sed -i "/status --is-interactive; and . (pyenv virtualenv-init -|psub)/d" ${profile}
;;
* )
sed -i "/\.pyenv\/bin/d" ${profile}
sed -i "/eval \"\$(pyenv init -)\"/d" ${profile}
sed -i "/eval \"\$(pyenv virtualenv-init -)\"/d" ${profile}
;;
esac

colorize() {
  if [ -t 1 ]; then printf "\e[%sm%s\e[m" "$1" "$2"
  else echo -n "$2"
  fi
}

{ echo
  colorize 1 "Restart the terminal or run 'exec \$SHELL'"
  echo
} >&2
