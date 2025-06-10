## SDN

SDN网络有3大特征, 分别是[6]:

1) 集中式控制.

2) 控制功能与转发功能分离.

3) 可编程.

「控制与转发分离」。
「逻辑上的集中控制」。
「控制平面与转发平面之间提供可编程接口」。

管理平面 控制平面 数据平面

## IPSEC over geneve

1. GENEVE 代表“通用网络虚拟化封装”
2. MAC-in-IP 封装 mac in udp
3. IPSec over GENEVE 只是因为私网流量从隧道转发，将策略应用在了Tunnel接口下

- L2TP over IPsec: looks like a big overhead to me, ie 128 bytes of headers
- OpenVPN tap: well OpenVPN is very slow compared to IPSec / Wireguard, and I would like to achieve as much bandwidth
  and low latency as I may get. So OpenVPN is the fallback if I don't get anything to work
- VxLAN (or GENEVE, or GRETAP) over Wireguard: looks promising ?
- Tinc ?
- Zerotier ?
- IPIP
- GRE

SDN 关注于网络控制面和转发面的分离
NFV 关注网络转发功能的虚拟化和通用化.

Geneve：通用网络虚拟化封装草案
https://datatracker.ietf.org/doc/draft-ietf-nvo3-geneve/16/

BFD（Bidirectional Forwarding Detection，双向转发检测）

ECMP（Equal-Cost Multipath Routing，等价多路径路由）

## Centralized vs. Distributed

## IPv6 Address Auto Configuration

https://l8liliang.github.io/2022/01/05/ipv6-address-autoconfig.html

## 路由

https://en.m.wikipedia.org/wiki/Routing#Delivery_schemes

## OVN

https://www.cnblogs.com/jingjingxyk/category/2201785.html

## ovn-architecture cn

    https://github.com/oilbeater/ovn-doc-cn/blob/master/ovn-architecture.md

## install ovn

    https://github.com/ovn-org/ovn/blob/main/Documentation/intro/install/general.rst

## ovn conf dir

```bash

#/usr/local/etc/openvswitch
#/usr/local/etc/ovn

```

## debian 环境下 安装 OVN

```bash

# apt -o Acquire::Check-Valid-Until=false -y update
# echo 'Acquire::Check-Valid-Until no;' > /etc/apt/apt.conf.d/10no--check-valid-until


apt update -y && apt install -y socat libssl-dev ca-certificates curl

bash install-ovn-ovs.sh

bash install-ovn-ovs.sh --proxy socks5h://127.0.0.1:2000

bash install-ovn-ovs.sh --proxy http://127.0.0.1:8016

bash install-ovn-ovs.sh --proxy http://127.0.0.1:8016  --mirror china


curl -fSL https://github.com/jingjingxyk/swoole-cli/blob/new_dev/sapi/quickstart/linux/SDN/install-ovn-ovs.sh?raw=true | bash

curl -fSL https://github.com/jingjingxyk/swoole-cli/blob/new_dev/sapi/quickstart/linux/SDN/install-ovn-ovs.sh?raw=true | bash -s --  --install-deps

curl -fSL https://gitee.com/jingjingxyk/swoole-cli/raw/new_dev/sapi/quickstart/linux/debian-init-minimal.sh | bash -s -- --mirror china

curl -fSL https://gitee.com/jingjingxyk/swoole-cli/raw/new_dev/sapi/quickstart/linux/SDN/install-ovn-ovs.sh | bash -s -- --proxy http://127.0.0.1:8016

curl -fSL https://gitee.com/jingjingxyk/swoole-cli/raw/new_dev/sapi/quickstart/linux/SDN/install-ovn-ovs.sh | bash -s -- --mirror china --install-deps

curl -fSL https://gitee.com/jingjingxyk/swoole-cli/raw/new_dev/sapi/quickstart/linux/SDN/install-ovn-ovs.sh | bash -s --  --install-deps

curl -fSL https://gitee.com/jingjingxyk/swoole-cli/raw/new_dev/sapi/quickstart/linux/install-docker.sh | bash -s -- --mirror china

curl -fSL https://github.com/jingjingxyk/swoole-cli/blob/new_dev/sapi/quickstart/linux/install-docker.sh?raw=true | bash


docker run --rm --name demo  -ti --init debian:12

```

[ovn-controller](OVS/ovn-controller)

## IGMP 组播协议

## OVN command

    OVN-IC 北向数据库端口，默认为 6645
    OVN-IC 南向数据库端口，默认为 6646

    OVN 北向数据库端口，默认为 6641
    OVN 南向数据库端口，默认为 6642

    ovn-controller 节点 Geneve协议使用 6081 端口

    mac in UDP

    geneve  UDP port 6081
    VXLAN   UDP port 4789
    STT     UDP port 7471


    northbound databases  TCP ports 6641
    southbound databases  TCP ports 6642

```bash
ovn-nbctl ls-list

ovn-nbctl lr-policy-list lr1
ovn-nbctl lr-route-list lr1
ovn-nbctl lr-nat-list lr1
ovn-nbctl lr-lb-list lr1


ovn-nbctl list gateway_chassis
ovn-sbctl list chassis
ovn-nbctl find NAT type=snat
ovn-nbctl find Logical_Router name=lr1

CIDR_IPV4_UUID=$(ovn-nbctl --bare --columns=_uuid find dhcp_options cidr="10.1.20.0/24")


ovn-nbctl list dhcp_options | grep _uuid | awk '{print $3}' | xargs -i ovn-nbctl dhcp-options-del {}

ipv4_num=$(ovn-nbctl --bare --columns=_uuid find dhcp_options cidr="10.1.20.0/24" | wc -l )


```

网卡 混杂模式（promiscuous mode）

```text
# https://patchwork.ozlabs.org/project/openvswitch/patch/20180312112344.13768-1-ligs@dtdream.com/

ovs-vsctl --inactivity-probe=30000 set-manager tcp:<CONTROLLER IP>:6640
ovs-vsctl --inactivity-probe=30000 set-controller tcp:<CONTROLLER IP>:6641
vtep-ctl  --inactivity-probe=30000 set-manager tcp:<CONTROLLER IP>:6640
ovn-nbctl --inactivity-probe=30000 set-connection ptcp:6641:0.0.0.0
ovn-sbctl --inactivity-probe=30000 set-connection ptcp:6642:0.0.0.0

ovn-nbctl set NB_GLOBAL . options:northd_probe_interval=180000
ovn-nbctl set connection . inactivity_probe=180000
ovs-vsctl set open . external_ids:ovn-openflow-probe-interval=180
ovs-vsctl set open . external_ids:ovn-remote-probe-interval=180000
ovn-sbctl set connection . inactivity_probe=180000


# https://mail.openvswitch.org/pipermail/ovs-discuss/2020-August/050554.html

```

# 使用UDP协议交互数据

nc -v -u -l 0.0.0.0 6081
nc -u -v 8.137.54.132 6081

# SD-WAN 系列（5）SD-WAN = SDN + Internet线路 +专线 + WAN加速 + IPsec + DPI + ？

    https://blog.csdn.net/zhengmx100/article/details/103565072

## 期待

1. DPDK支持
1. eBPF集成
1. BGP支持
1. 集群互联
1. 流量镜像
1. QoS 选项
1. IPSec, wireguard 等加密方式支持

OVN有三种NAT：
DNAT：改变了数据包的目的地址
SNAT：改变了一个包的源地址
SNAT-DNAT：外部IP映射到内部IP，反之亦然。

Linux中的conntrack模块被整合到OVS中以提供有状态匹配
OVN实现了DHCPv4支持

snapshot + cloudinit
安装系统过程，是直接启动一个预配置镜像
kvm libvirt qemu ovs

## 判断linux 系统使用何种网络管理工具

```
systemctl status NetworkManager
systemctl status networking
systemctl status networkd

cat /etc/network/interfaces
ls -lh /etc/NetworkManager/system-connections/
cat /etc/NetworkManager/NetworkManager.conf
ls -lh /etc/netplan/*.yaml

NetworkManager
nmcli device status
nmcli connection show --active
nmcli -p connection show
nmcli -t device show
nmcli general status

apt install network-manager
systemctl enable --now NetworkManager
```

```text
# 查看接口 mtu
netstat -i

Get bridge MTU: ovs-vsctl get Bridge <bridge_name> MTU
List bridge ports: ovs-vsctl list-ports <bridge_name>
Set port MTU: ovs-vsctl set Port <port_name> MTU=<value>

ovs-vsctl set port br-int mtu=1442
ovs-vsctl set Interface br-int mtu_request=1442

ip link set dev vm1 mtu 1442
ip netns exec vm1 ip link set dev vm1 mtu 1442

# set interface eth0 mtu_request=1450
# ovn-nbctl set Logical_Switch_Port <port_name> options:mtu=1500

mtu 1442

MTU配置说明

https://help.aliyun.com/zh/vpn/sub-product-ipsec-vpn/user-guide/set-mtu-values

用户MTU
公网接口MTU
路径MTU  通常以太网的路径MTU默认为1500字节

用户MTU的最大值=min{公网接口MTU,路径MTU}-101    # 101是IPsec协议为数据包加密后占用的最大字节数。

 Overlay 子网下 Pod 网卡 MTU 为主机网卡 MTU - 100，Underlay 子网下，Pod 网卡和主机网卡有相同 MTU。
 mtu=1333
```
