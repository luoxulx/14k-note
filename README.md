oihoin
uikjguhnlok
# Install some prerequisites needed by adding GPG public keys
sudo apt-get install gnupg ca-certificates curl

# Import our GPG key. Notice the hyphen at the end of line.
curl -sSL https://raw.fastgit.org/Qv2ray/debian/master/pubkey.gpg | sudo apt-key add -

# Add the our official APT repository:
# Stable release of Debian / LTS release of Ubuntu:
echo "deb [arch=amd64] https://raw.fastgit.org/Qv2ray/debian/master/ stable main" | sudo tee /etc/apt/sources.list.d/qv2ray-fastgit.list
# Debian testing/unstable and Ubuntu 20.10+
# echo "deb [arch=amd64] https://raw.fastgit.org/Qv2ray/debian/master/ unstable main" | sudo tee /etc/apt/sources.list.d/qv2ray-fastgit.list
# To update the APT index:
sudo apt-get update

# You can install Qv2ray from APT now:
sudo apt-get install qv2ray
