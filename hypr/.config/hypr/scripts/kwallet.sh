#!/bin/bash
if [ -f ~/.dotfiles/hypr/.config/hypr/scripts/kwallet.sh ]; then
	source ~/.dotfiles/hypr/.config/hypr/scripts/kwallet.sh
fi

export $(dbus-launch)
echo "$KWALLET_PASSWORD" | kwalletcli --kwallet kwallet.kwl --unlock
