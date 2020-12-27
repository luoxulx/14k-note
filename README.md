gjghjgjkghkjgjhfjfjgkjgjkghghjgjhgjhfjfhfjhjgjgjhgjhghjghhkjhkhjkhhhkjhjkhjkhjkhjkghghjgjh
ghjfjfgfgfghfhgfhgfdgfdfdghgghfhjgfhjfjgfhfjhfhghjghjghjgjgjhfjhjhffjighhghgjggjhjkhgjkhghyfjfjfghfghfhgfghfghjghjghjhjkhkhjkghjghjhkjhkjhksadasdas
wdwaddsadasdaadgfjhfhjfgfhgkkjhjkhkjhjhjgjhjghjgjh
sudo apt-get install gnupg ca-certificates curl

curl -sSL https://raw.fastgit.org/Qv2ray/debian/master/pubkey.gpg | sudo apt-key add -


echo "deb [arch=amd64] https://raw.fastgit.org/Qv2ray/debian/master/ stable main" | sudo tee /etc/apt/sources.list.d/qv2ray-fastgit.list

sudo apt-get update

sudo apt-get install qv2ray

---

```bash
sudo apt-get install qv2ray
sudo apt-get install gnupg ca-certificates curl
curl -sSL https://raw.fastgit.org/Qv2ray/debian/master/pubkey.gpg | sudo apt-key add -
echo "deb [arch=amd64] https://raw.fastgit.org/Qv2ray/debian/master/ stable main" | sudo tee /etc/apt/sources.list.d/qv2ray-fastgit.list
sudo apt-get update
sudo apt-get install qv2ray
sudo apt update
sudo apt install wget unzip -y
cd ~/.config/qv2ray/
ll
sudo unzip v2ray-linux-64.zip -d vcore
rm v2ray-linux-64.zip 
ll
cp v2ray-linux-64.zip ~/.config/qv2ray/
```
