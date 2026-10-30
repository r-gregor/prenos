#! /usr/bin/env bash
# from: bash_auto_install_scripts_20241016.txt

cmd=(dialog --title "DasGeek Installer" --separate-output --checklist "Please Select Software You Want To Install:" 22 80 16)
options=(
	#A "<----Category: Software Repositories---->" on
		1_repos "	Install Flatpak Repository" off
		2_repos "	Install Snaps Repository" off
	#B "<----Category: Notes---->" on
		1_notes "	Simplenote (Flatpak)" off
		2_notes "	Standard Notes (Flatpak)" off
	#C "<----Category: Social---->" on
		1_social "	Mumble Client" off
		2_social "	Zoom Meeting Client (Flatpak)" off
		3_social "	Telegram (Flatpak)" off
		4_social "	Discord (Flatpak)" off
		5_social "	Hexchat" off
		6_social "	Signal (Flatpak)" off
		7_social "	Element/Matrix (Flatpak)" off
	#D "<----Category: Tweaks---->" on
		1_tweak "	Elementary Tweaks" off
		2_tweak "	Ubuntu Restricted Extras" off
		3_tweak "	Gnome Tweak Tool" off
		4_tweak "	Xfce Monitor Move Script" off
		5_tweak "	Midnight Commander" off
		6_tweak "	Install i3wm DE" off
	#E "<----Category: Media---->" on
		1_media "	SM Player Media Player" off
		2_media "	Pithos (Pandora)" off
		3_media "	Google Desktop Player (Flatpak)" off
	#F "<----Category: Internet---->" on
		1_internet "	Google Chrome(Flatpak)" off
		2_internet "	Vivaldi" off
		3_internet "	Firefox Browser" off
		4_internet "	Chromium (Flatpak)" off
	#G "<----Category: Video, Audio & Pic Editing---->" on
		1_edit "	Kdenlive" off
		2_edit "	Shotwell" off
		3_edit "	GIMP" off
		4_edit "	OBS-Studio (Flatpak)" off
		5_edit "	OBS-Studio (SNAP)" off
		6_edit "	Audacity" off
		7_edit "	ffmpeg" off
		8_edit "	OcenAudio" off
	#H "<----Category: Security---->" on
		1_security " Mullvad VPN" off
	#I "<----Category: Utility---->" on
		1_utility "	Virtualbox" off
		2_utility "	Fedora Media Writer (Flatpak)" off
		3_utility "	Tilix" off
		4_utility "	Terminator" off
		5_utility "	Synology NAS Backup (Flatpak)" off
		6_utility "	Gnome-do (Search Tool)" off
		7_utility "	Catfish - (File Search)" off
		8_utility "	Guvcview (webcam settings)" off
		9_utility "	Cheese" off
		10_utility "	Fish (command line shell)" off
		11_utility "	KVM" off
		12_utility " Docker(CE)" off
	#J "<----Category: Coding & FTP---->" on
		1_coding "	Pycharm Pro (Pycharm Tools Flatpak)" off
		2_coding "	Sublime Text(Flatpak)" off # any option can be set to default to "on"
		3_coding "	Putty" off
		4_coding "	VS Codium(Flatpak)" off
		5_coding "	Gedit" off
		6_coding "	Filezilla" off
		7_coding "	Snapcraft (For Snap Dev)" off
	#K "<----Category: Gaming & Fun---->" on
		1_gaming "	Steam (Valve)" off
		2_gaming "	Lutris" off
		3_gaming "	DOSBox-X (Flatpak)" off
		4_gaming "	ScummVM (Flatpak)" off
		5_gaming "	Gnome Twitch Client" off
		6_gaming "	Kisak-mesa PPA Latest AMD Drivers (Risky)" off
		L        "	Post Install Auto Clean Up & Update" off
)

choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
clear
echo ""
for choice in $choices; do
	echo "choice: $choice"
done
