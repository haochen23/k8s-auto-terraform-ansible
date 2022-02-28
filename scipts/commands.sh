# on first master node
kubeadm init --apiserver-advertise-address=10.240.0.7 --control-plane-endpoint="40.117.250.63:6443" --pod-network-cidr=10.200.0.0/16 --ignore-preflight-errors=all --upload-certs

kubectl --kubeconfig=/etc/kubernetes/admin.conf create -f https://docs.projectcalico.org/manifests/calico.yaml


# on workers
kubeadm join 40.117.250.63:6443 --token lts70w.0rm00mzmx7rj3mom \
        --discovery-token-ca-cert-hash sha256:490afafb87230e5584ad867af847f57112ee3c8f5c5f746565cbf8a226cc3443


cat <<EOF > /etc/docker/daemon.json
{
    "exec-opts": ["native.cgroupdriver=systemd"]
}
EOF