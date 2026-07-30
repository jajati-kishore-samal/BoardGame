#!/bin/bash
set -e

echo "========================================"
echo " Kubernetes Installation Script"
echo " Ubuntu 22.04 / 24.04"
echo "========================================"

# Check root
if [ "$EUID" -ne 0 ]; then
  echo "Run as root:"
  echo "sudo ./install-k8s.sh"
  exit 1
fi

echo "Updating system..."
apt-get update -y
apt-get upgrade -y

echo "Disabling swap..."
swapoff -a
sed -i '/ swap / s/^/#/' /etc/fstab

echo "Loading kernel modules..."
cat <<EOF >/etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF

modprobe overlay
modprobe br_netfilter

echo "Configuring sysctl..."
cat <<EOF >/etc/sysctl.d/kubernetes.conf
net.bridge.bridge-nf-call-iptables=1
net.bridge.bridge-nf-call-ip6tables=1
net.ipv4.ip_forward=1
EOF

sysctl --system

echo "Installing dependencies..."
apt-get install -y \
apt-transport-https \
ca-certificates \
curl \
gpg \
software-properties-common

echo "Installing containerd..."
apt-get install -y containerd

mkdir -p /etc/containerd
containerd config default >/etc/containerd/config.toml

sed -i 's/SystemdCgroup = false/SystemdCgroup = true/' \
/etc/containerd/config.toml

systemctl restart containerd
systemctl enable containerd

echo "Adding Kubernetes repository..."
mkdir -p /etc/apt/keyrings

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key \
| gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /" \
> /etc/apt/sources.list.d/kubernetes.list

apt-get update

echo "Installing Kubernetes..."
apt-get install -y kubelet kubeadm kubectl

apt-mark hold kubelet kubeadm kubectl

systemctl enable kubelet

echo
echo "========================================"
echo "Installation Completed Successfully"
echo "========================================"

echo
echo "Versions:"
kubeadm version
kubectl version --client
containerd --version

echo
echo "If this is MASTER run:"
echo
echo "sudo kubeadm init --pod-network-cidr=192.168.0.0/16"
echo
echo "Then execute:"
echo
echo "mkdir -p \$HOME/.kube"
echo "sudo cp /etc/kubernetes/admin.conf \$HOME/.kube/config"
echo "sudo chown \$(id -u):\$(id -g) \$HOME/.kube/config"
echo
echo "kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.28.0/manifests/calico.yaml"
echo
echo "Generate worker join command:"
echo "kubeadm token create --print-join-command"
