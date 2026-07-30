vim install-k8s.sh
chmod +x install-k8s.sh
./install-k8s.sh
sudo kubeadm init --pod-network-cidr=192.168.0.0/16
mkdir -p $HOME/.kube
sudo cp /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.28.0/manifests/calico.yaml
kubectl get nodes
docker ps
sudo apt update
sudo apt install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] \
https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo systemctl enable docker
sudo systemctl start docker
docker --version
vim shopify-install.sh
chmod +x shopify-install.sh
./shopify-install.sh
wget https://github.com/Shopify/kubeaudit/releases/latest
VERSION=v0.22.0
wget https://github.com/Shopify/kubeaudit/releases/download/${VERSION}/kubeaudit_${VERSION#v}_linux_amd64.tar.gz
curl -sSfL https://raw.githubusercontent.com/Shopify/kubeaudit/main/scripts/install.sh | bash
wget <release-download-url>
tar -xzf <downloaded-file>
chmod +x kubeaudit
sudo mv kubeaudit /usr/local/bin/
kubeaudit version
wget https://github.com/Shopify/kubeaudit/releases/latest
go install github.com/Shopify/kubeaudit@latest
export PATH=$PATH:$(go env GOPATH)/bin
kubeaudit version
sudo apt update
sudo apt install -y golang-go
go install github.com/Shopify/kubeaudit@latest
export PATH=$PATH:$(go env GOPATH)/bin
kubeaudit version
git clone https://github.com/Shopify/kubeaudit.git
cd kubeaudit
ls
find . -name main.go
kubeaudit version
sudo apt update
sudo apt install -y golang-go git
go version
git clone https://github.com/Shopify/kubeaudit.git
cd kubeaudit
go version
go mod tidy
go build -o kubeaudit ./cmd
ls -l kubeaudit
-rwxr-xr-x 1 root root 40M Jul 30 kubeaudit
sudo mv kubeaudit /usr/local/bin/
sudo chmod +x /usr/local/bin/kubeaudit
kubeaudit version
kubectl get nodes
kubeaudit all
clear
cd ..
https://github.com/shopify/kubeaudit/releases
git clone https://github.com/Shopify/kubeaudit.git
tar -xvzf kubeaudit_0.22.2_linux_amd64.tar.gz
sudo mv kubeaudit /usr/local/bin/
kubeaudit version
kubeaudit all
which kubeaudit
file $(which kubeaudit)
kubeaudit all
/usr/local/bin/kubeaudit
sudo rm -f /usr/local/bin/kubeaudit
which kubeaudit
rm -rf ~/kubeaudit
ls ~
go clean -cache -modcache -testcache
kubeaudit version
cd ~
git clone https://github.com/Shopify/kubeaudit.git
cd kubeaudit
go version
which kubeaudit
cd ..
which kubeaudit
ls
vim shopify-install.sh
chmod +x shopify-install.sh
./shopify-install.sh
ls -ld kubeaudit
mv kubeaudit kubeaudit-backup
tar -xzf kubeaudit_0.22.0_linux_amd64.tar.gz
chmod +x kubeaudit
sudo mv kubeaudit /usr/local/bin/
which kubeaudit
kubeaudit version
rm -f kubeaudit
tar -xzf kubeaudit_0.22.0_linux_amd64.tar.gz
chmod +x kubeaudit
sudo mv kubeaudit /usr/local/bin/
ls -ld kubeaudit
kubeaudit version
ls
docker ps
ls
kubectl get nodes
vim namespace.yml
vim svc-acc.yml
kubectl -f namespace.yml svc-acc.yml
kubectl apply -f namespace.yml svc-acc.yml
kubectl apply -f namespace.yml
kubectl apply -f svc-acc.yml
vim svc-acc.yml
kubectl apply -f svc-acc.yml
kubectl apply -f namespace.yml
vim namespace.yml
kubectl apply -f namespace.yml
vim namespace.yml
