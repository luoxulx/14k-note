oihoin
uikjguhnlok

sudo apt-get install gnupg ca-certificates curl

curl -sSL https://raw.fastgit.org/Qv2ray/debian/master/pubkey.gpg | sudo apt-key add -


echo "deb [arch=amd64] https://raw.fastgit.org/Qv2ray/debian/master/ stable main" | sudo tee /etc/apt/sources.list.d/qv2ray-fastgit.list

sudo apt-get update

sudo apt-get install qv2ray

---
89  sudo apt-get install qv2ray
   90  sudo apt-get install gnupg ca-certificates curl
   91  curl -sSL https://raw.fastgit.org/Qv2ray/debian/master/pubkey.gpg | sudo apt-key add -
   92  echo "deb [arch=amd64] https://raw.fastgit.org/Qv2ray/debian/master/ stable main" | sudo tee /etc/apt/sources.list.d/qv2ray-fastgit.list
   93  sudo apt-get update
   94  sudo apt-get install qv2ray
   95  sudo apt update
   96  sudo apt install wget unzip -y
   97  cd ~/.config/qv2ray/
   98  sudo wget https://github/v2ray/v2ray-core/releases/download/v4.27.5/v2ray-linux-64.zip
   99  ll
  100  sudo unzip v2ray-linux-64.zip -d vcore
  101  rm v2ray-linux-64.zip 
  102  ll
  103  cp v2ray-linux-64.zip ~/.config/qv2ray/
