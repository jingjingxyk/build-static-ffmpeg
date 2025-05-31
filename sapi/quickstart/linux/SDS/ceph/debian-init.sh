apt install -y  python3 podman lvm2

apt install -y sudo wget curl libssl-dev ca-certificates
apt install -y net-tools iproute2
apt install -y ipvsadm conntrack iptables ebtables ethtool socat
apt install -y python3 python3-pip
apt install -y xz-utils  lzip zip unzip p7zip
apt install -y ntp ntpsec

ntpq -pn

# timedatectl set-timezone UTC
# https://docs.ceph.com/en/latest/cephadm/install/#cephadm-deploying-new-cluster

# CEPH_RELEASE=19.2.2
# curl --silent --remote-name --location https://download.ceph.com/rpm-${CEPH_RELEASE}/el9/noarch/cephadm
