#!/bin/bash

# define port
SSH=22000
HTTP=80,443

# initialize

iptables -F
iptables -X 
iptables -Z 
iptables -P INPUT   ACCEPT
iptables -P OUTPUT  ACCEPT
iptables -P FORWARD ACCEPT

# default policy

iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP


# interface
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT ! -i lo -d 127.0.0.1/8 -j REJECT

#iptables -A INPUT -p tcp -s 192.168.1.2 -j ACCEPT

# tcp state

iptables -A INPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT

# drop broadcast, multicast
iptables -A INPUT -d 255.255.255.255 -j DROP
iptables -A INPUT -s 244.0.0.0/4 -j DROP

# service accept

iptables -A INPUT -p icmp -j ACCEPT
iptables -A INPUT -p tcp -m multiport --dports $HTTP -j ACCEPT
iptables -A INPUT -p tcp -m multiport --dports $SSH -j ACCEPT


iptables-save > /etc/iptables/rules.v4

