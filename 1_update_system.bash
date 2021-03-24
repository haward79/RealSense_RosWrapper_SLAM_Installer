
echo -e "\n"$gkSetTitleColor'# apt update cache'$gkClearColor"\n"
sudo apt update

echo -e "\n"$gkSetTitleColor'# apt upgrade software'$gkClearColor"\n"
sudo apt upgrade -y
sudo apt dist-upgrade -y

echo -e "\n"$gkSetTitleColor'# Backup "~/.bashrc" to "~/.bashrc.bak"'$gkClearColor"\n"
cp ~/.bashrc ~/.bashrc.bak
echo '# This script is backuped by realsense_roswrapper_installer at '$(date) >> ~/.bashrc.bak

