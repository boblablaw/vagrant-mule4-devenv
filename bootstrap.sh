echo deb http://http.debian.net/debian stretch main >> /etc/apt/sources.list
echo deb http://deb.nodesource.com/node_10.x stretch main >> /etc/apt/sources.list
echo deb-src http://deb.nodesource.com/node_10.x stretch main >> /etc/apt/sources.list

# Update and fetch new packages.
sudo echo "Updating..."
sudo apt-get update
sudo apt-get -y upgrade

# Install desktop environment.
sudo echo "Installing LXDE..."
sudo apt-get install -y lxde
sudo apt-get install -y curl
sudo apt-get install -y gvfs-bin
sudo apt-get install -y vim

# Install Chromium web browser.
sudo echo "Installing chromium..."
sudo apt-get install -y chromium

# Install libwebkitgtk (Anypoint Studio needs this to connect to Anypoint Exchange).
sudo echo "Installing libwebkitgtk..."
sudo apt-get install -y libwebkitgtk-1.0.0

# Install JDK 8.
sudo echo "Installing JDK8..."
sudo apt-get install -y default-jre
sudo apt-get install -y default-jdk

# Install maven.susu
sudo echo "Installing maven..."
sudo apt-get install -y --no-install-recommends -t stretch maven

# Install GIT.
sudo echo "Installing GIT..."
sudo apt-get install -y git-all

# Install NodeJS (NPM)
sudo echo "Installing NodeJS with NPM"
sudo apt-get install --allow-unauthenticated -y -t stretch nodejs

# Install Mule

# Download Anypoint Studio 7.3.1 Update Site 1 64bit
# Release Notes: https://docs.mulesoft.com/release-notes/studio/anypoint-studio-7.3-with-4.1-update-site-1-runtime-release-notes
# Downloads: https://www.mulesoft.com/ty/dl/studio-linux
sudo echo "Downloading Anypoint Studio..."
#sudo wget -O AnypointStudio.tar.gz -nv -nc https://mule-studio.s3.amazonaws.com/7.3.1-U1/AnypointStudio-for-linux-64bit-7.3.1-201811211926.tar.gz
#sudo tar xvzf AnypointStudio.tar.gz
#sudo rm -f AnypointStudio.tar.gz

#Install Postman
sudo echo "Downloading Postman..."
#sudo wget --no-check-certificate https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
#sudo tar xvzf postman.tar.gz -C /opt
#sudo rm -f postman.tar.gz
#sudo ln -s /opt/Postman/Postman /usr/bin/Postman

#Install Atom Editor
sudo echo "Downloading Atom..."
#sudo wget --no-check-certificate https://atom.io/download/deb -O atom.deb
#sudo dpkg -i atom.deb
#sudo rm -f atom.deb

#Install API Workbench extension for ATOM
sudo echo "Downloading API workbench..."
#sudo wget --no-check-certificate https://github.com/mulesoft/api-workbench/archive/v0.8.48.tar.gz -O api-workbench.tar.gz
#sudo mkdir -p ./sources/atom
#sudo apm link ./sources/atom
#sudo tar xvzf api-workbench.tar.gz -C .atom/packages
#sudo mv .atom/packages/api-workbench-0.8.48 .atom/packages/api-workbench
#sudo npm install .atom/packages/api-workbench
#sudo rm -f api-workbench-0.8.48.tar.gz
apm config set strict-ssl false
apm install api-workbench
apm install linter
apm install linter-ui-default
apm install intentions
apm install busy-signal

sudo cp -r /root/.atom/packages .atom

cat > /usr/share/applications/postman.desktop <<EOL
[Desktop Entry]
Encoding=UTF-8
Name=Postman
Exec=postman
Icon=/opt/Postman/app/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
EOL

cat >/usr/share/applications/anypoint.desktop <<EOL
[Desktop Entry]
Encoding=UTF-8
Name=AnypointStudio
Exec=/home/vagrant/AnypointStudio/AnypointStudio
Icon=/home/vagrant/AnypointStudio/icon.xpm
Terminal=false
Type=Application
Categories=Development;
EOL
