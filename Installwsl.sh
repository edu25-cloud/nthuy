https://cloud-images.ubuntu.com/wsl/releases/24.04/current/ install wslubuntu for win10

Open PowerShell as Administrator
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
check
wsl -l -v
wsl -h
Create wsl folder on C:/ disk with name" Ubuntu2404_server
dowload by PowerShell
D:\
Invoke-WebRequest -Uri https://cloud-images.ubuntu.com/wsl/releases/24.04/current/ubuntu-noble-wsl-amd64-24.04lts.rootfs.tar.gz -OutFile ubuntu-24.04-wsl.tar.gz
Run command import to C:\
wsl --import Ubuntu2404_server C:\Ubuntu2404_server D:\ubuntu-24.04-wsl.tar.gz
downlad and install package

-kubectl 
curl -fsSL -o kubectl "https://dl.k8s.io/release/v1.33.0/bin/linux/amd64/kubectl"
chmod 700 kubectl
mv kubectl /usr/local/bin/
-kustomize
curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash
mv kustomize /usr/local/bin/
kustomize version
-helm
$ curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
$ chmod 700 get_helm.sh
$ ./get_helm.sh
helm version
-git
-make
apt install make  
make
sops
sops-v3.10.2.linux.amd64 "https://github.com/getsops/sops/releases"
chmod +x sops-v3.10.2.linux.amd64
mv sops-v3.10.2.linux.amd64 /usr/local/bin/sops
sopssecretgenerator
https://github.com/goabout/kustomize-sopssecretgenerator/releases/tag/v1.6.0  SopsSecretGenerator_1.6.0_linux_amd64
chmod +x SopsSecretGenerator_1.6.0_linux_amd64
mv SopsSecretGenerator_1.6.0_linux_amd64 /usr/local/bin/SopsSecretGenerator
Setup kubectl for wsl ubuntu

install
mv kubectl.exe /usr/local/bin
cd /usr/local/bin
chmod +x kubectl 
kubectl version
set upfile config
mkdir -p ~/.kube
cp config .kube
set alias and bash for kubectl
alias k=kubectl
echo 'alias k=kubectl' >> .bashrc
source .bashrc
Install bash-completion
apt install bash-completion -y
vi .bashrc

alias k=kubectl
if [ -f /etc/bash_completion ]; then
  ./etc/bash_completion
fi

source .bashrc

kubectl completion bash | sudo tee /etc/bash_completion.dc/kubectl > /dev/null