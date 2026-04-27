# Poema IX

## 介紹 | Introduction
Poema IX 是一個非營利的分布式[虛擬 IX](Virtual-IXP.md) ，各站點之間由 [vxlan-controller](https://github.com/PoemaIX/vxlan-controller) 互連  
同時作為一個BGP實驗交流和學習的平台  

這個 IX 比較特別之處，首先是內網只使用 **IPv6 link local** 地址  
`RFC4291` 規定了此網段不可被路由，藉此避免了 IX Lan 網段被非 IX 成員攻擊  

但 `RFC4291` 只規範了 ipv6 ，ipv4 無此限制  
因此再藉由 **Multiprotocol BGP (MP-BGP)** ，搭配 **Extended next hop** 技術來廣播 IPv4 路由  

目前為止沒有別的 IX 這樣做，這些技術明明存在，為什麼不用呢?  
作為實驗性質的 IX ，沒有道理不把這些都用上  

再來是給BGP配網的`業餘/有興趣/新手`一個練習的地方，可以放心實驗  
同時提供一個平台，給大家熟悉IX環境。畢竟DN42和公網環境差距不只是一點點  

IX 服務模式為提供 **MTU 1422** 之OSI第二層之交換服務(Ethernet Switching)  
針對Switching內網，以下稱呼為 **IX LAN**  

PeeringDB: [https://www.peeringdb.com/ix/3792](https://www.peeringdb.com/ix/3792)  
IXPDB: [https://ixpdb.euro-ix.net/en/ixpdb/ixp/1061/](https://ixpdb.euro-ix.net/en/ixpdb/ixp/1061/)  

本 IX 架設開發之軟體，皆以 MIT Licence 授權形式提供

* [vxlan-controller](https://github.com/PoemaIX/vxlan-controller): IX LAN 內網控制器
* [arouteserver](https://github.com/PoemaIX/arouteserver): 魔改版本的 arouteserver ，使其支援 IPv6 Link-Local 地址 + MP-BGP + Extended next hop
* [pvefw-neo](https://github.com/PoemaIX/pvefw-neo): 給 IX VM 用的改進版 PVE 防火牆
* [IX-BIRD-RS-Generator](https://github.com/PoemaIX/IX-BIRD-RS-Generator): IX Route Server 的 bird.conf 自動生成 + 偵測有效路由 + 推送 AS-SET + 推送 peeringdb 的腳本


Poema IX is a non-profit distributed [Virtual IXP](https://bgp.tools/kb/virtual-ixp) interconnected by [vxlan-controller](https://github.com/PoemaIX/vxlan-controller) that serves as a platform for BGP experimental exchange and learning in Taiwan.  

What makes this IX unique is, first and foremost, its internal network uses only IPv6 link-local addresses. `RFC 4291` stipulates that this address block is non-routable, thereby preventing the IX LAN segment from being attacked by non-IX members.  
However, `RFC 4291` only regulates IPv6; IPv4 has no such inherent restriction. Therefore, we utilize **Multiprotocol BGP (MP-BGP)** in conjunction with **Extended Next Hop** technology to advertise IPv4 routes.  

To date, no other IX operates this way. Even though these technologies exist, why aren't they being used?  
As an experimental IX, there is no reason not to utilize all of them.  

This IX provides OSI Layer 2 Ethernet Switching service with **MTU 1422**.  
For the switching network, we refer to `IX LAN`, `IX peering LAN` or `Peering LAN` in the following sections.  


PeeringDB: [https://www.peeringdb.com/ix/3792](https://www.peeringdb.com/ix/3792)  
IXPDB: [https://ixpdb.euro-ix.net/en/ixpdb/ixp/1061/](https://ixpdb.euro-ix.net/en/ixpdb/ixp/1061/)  

All software developed for this IX is provided under the MIT License.

* [vxlan-controller](https://github.com/PoemaIX/vxlan-controller): IX LAN intranet controller
* [arouteserver](https://github.com/PoemaIX/arouteserver): A modified version of arouteserver that supports IPv6 Link-Local addresses, MP-BGP, and Extended next hop.
* [pvefw-neo](https://github.com/PoemaIX/pvefw-neo): An improved PVE firewall for IX VMs.
* [IX-BIRD-RS-Generator](https://github.com/PoemaIX/IX-BIRD-RS-Generator): A script for automatically generating the bird.conf file for the IX Route Server, detecting valid routes, pushing to AS-SETs, and pushing to peeringdb.