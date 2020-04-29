#!/usr/bin/env bash
# Base16 - Gnome Terminal color scheme install script
#
# Exported from terminal.sexy
#
# Tweaked by Chua Hou

[[ -z "$PROFILE_NAME" ]] && PROFILE_NAME="s3r0-mod-ch"
[[ -z "$PROFILE_SLUG" ]] && PROFILE_SLUG="s3r0-mod-ch"
[[ -z "$DCONF" ]] && DCONF=dconf
[[ -z "$UUIDGEN" ]] && UUIDGEN=uuidgen

dset() {
	local key="$1"; shift
	local val="$1"; shift

	if [[ "$type" == "string" ]]; then
		val="'$val'"
	fi

	"$DCONF" write "$PROFILE_KEY/$key" "$val"
}

# because dconf still doesn't have "append"
dlist_append() {
	local key="$1"; shift
	local val="$1"; shift

	local entries="$(
		{
			"$DCONF" read "$key" | tr -d '[]' | tr , "\n" | fgrep -v "$val"
			echo "'$val'"
		} | head -c-1 | tr "\n" ,
	)"

	"$DCONF" write "$key" "[$entries]"
}

# Newest versions of gnome-terminal use dconf
if which "$DCONF" > /dev/null 2>&1; then
	[[ -z "$BASE_KEY_NEW" ]] && BASE_KEY_NEW=/org/gnome/terminal/legacy/profiles:

	if [[ -n "`$DCONF list $BASE_KEY_NEW/`" ]]; then
		if which "$UUIDGEN" > /dev/null 2>&1; then
			PROFILE_SLUG=`uuidgen`
		fi

		if [[ -n "`$DCONF read $BASE_KEY_NEW/default`" ]]; then
			DEFAULT_SLUG=`$DCONF read $BASE_KEY_NEW/default | tr -d \'`
		else
			DEFAULT_SLUG=`$DCONF list $BASE_KEY_NEW/ | grep '^:' | head -n1 | tr -d :/`
		fi

		DEFAULT_KEY="$BASE_KEY_NEW/:$DEFAULT_SLUG"
		PROFILE_KEY="$BASE_KEY_NEW/:$PROFILE_SLUG"

		# copy existing settings from default profile
		$DCONF dump "$DEFAULT_KEY/" | $DCONF load "$PROFILE_KEY/"

		# add new copy to list of profiles
		dlist_append $BASE_KEY_NEW/list "$PROFILE_SLUG"

		# update profile values with theme options
		dset visible-name "'$PROFILE_NAME'"
		dset palette "['#4a3637', '#d17b49', '#7b8748', '#af865a', '#535c5c', '#786869', '#79805c', '#c0b18b', '#4a3637', '#d17b49', '#7b8748', '#af865a', '#535c5c', '#786869', '#79805c', '#c0b18b']"
		dset background-color "'#171916'"
		dset foreground-color "'#bea66a'"
		dset bold-color "'#bea66a'"
		dset bold-color-same-as-fg "true"
		dset use-theme-colors "false"
		dset use-theme-background "false"
		dset allow-bold "false"

		unset PROFILE_NAME
		unset PROFILE_SLUG
		unset DCONF
		unset UUIDGEN
		exit 0
	fi
fi

# Fallback for Gnome 2 and early Gnome 3
[[ -z "$GCONFTOOL" ]] && GCONFTOOL=gconftool
[[ -z "$BASE_KEY" ]] && BASE_KEY=/apps/gnome-terminal/profiles

PROFILE_KEY="$BASE_KEY/$PROFILE_SLUG"

gset() {
	local type="$1"; shift
	local key="$1"; shift
	local val="$1"; shift

	"$GCONFTOOL" --set --type "$type" "$PROFILE_KEY/$key" -- "$val"
}

# Because gconftool doesn't have "append"
glist_append() {
	local type="$1"; shift
	local key="$1"; shift
	local val="$1"; shift

	local entries="$(
		{
			"$GCONFTOOL" --get "$key" | tr -d '[]' | tr , "\n" | fgrep -v "$val"
			echo "$val"
		} | head -c-1 | tr "\n" ,
	)"

	"$GCONFTOOL" --set --type list --list-type $type "$key" "[$entries]"
}

# Append the Base16 profile to the profile list
glist_append string /apps/gnome-terminal/global/profile_list "$PROFILE_SLUG"

gset string visible_name "$PROFILE_NAME"
gset string palette "#4a3637:#d17b49:#7b8748:#af865a:#535c5c:#775759:#6d715e:#c0b18b:#4a3637:#d17b49:#7b8748:#af865a:#535c5c:#775759:#6d715e:#c0b18b"
gset string background_color "#22261f"
gset string foreground_color "#c0b18b"
gset string bold_color "#c0b18b"
gset bool   bold_color_same_as_fg "true"
gset bool   use_theme_colors "false"
gset bool   use_theme_background "false"

unset PROFILE_NAME
unset PROFILE_SLUG
unset DCONF
unset UUIDGEN
