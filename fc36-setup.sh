#!/bin/bash

echo "Before appending the file"
cat /etc/dnf/dnf.conf

echo "fastestmirror=True">> /etc/dnf/dnf.conf
echo "max_parallel_downloads=10">> /etc/dnf/dnf.conf
echo "defaultyes=True">> /etc/dnf/dnf.conf
echo "After appending the file"
sudo cat /etc/dnf/dnf.conf

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

sudo dnf groupupdate core -y

sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
sudo dnf groupupdate sound-and-video -y

sudo dnf update -y

