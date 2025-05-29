## ovn 修改隧道使用的端口

    https://github.com/ovn-org/ovn/issues/255


    for i in $(ovn-sbctl --bare --columns _uuid list encap); do ovn-sbctl set encap $i options:dst_port=6083; done


    # 单个设置
    ovn-sbctl set encap 1f8c6722-574a-4acf-bd6b-26f6e4d61531 options:dst_port=6083


    # 此是指 还没有实现
    ovs-vsctl set open . external_ids:ovn-encap-port=6081

##
    https://blog.faizahmed.in/tuntap-devices-using-open-vswitch#heading-create-bridge

    ovs-vsctl add-br br0
    ovs-vsctl add-port br0 vSwitch0
    ovs-vsctl set Interface vSwitch0 type=internal
    ovs-vsctl add-port br0 eno1

    ip tuntap add mode tap vport0
    ovs-vsctl add-port br0 vport0

    ip addr add 172.168.1.1/24 dev vSwitch0

