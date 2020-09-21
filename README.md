# DNS Forwarder VM

Copied from https://github.com/Azure/azure-quickstart-templates/tree/master/301-dns-forwarder

How to run? <br/>
az group create --name mts-dns-forwarder --location canadacentral #use this command when you need to create a new resource group for your deployment <br/>
az group deployment create --resource-group mts-dns-forwarder --template-file azuredeploy.json <br/>

This template shows how to create a DNS server that forwards queries to Azure's internal DNS servers so that hostnames for VMs in the virtual network can be resolved from outside the network.  As illustrated below, this is useful for doing hostname resolution between virtual networks or from on-premise machines to Azure. See [Name resolution using your own DNS server](https://azure.microsoft.com/documentation/articles/virtual-networks-name-resolution-for-vms-and-role-instances/#name-resolution-using-your-own-dns-server) for more details of how DNS resolution work in Azure.

![Inter-vnet DNS](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/301-dns-forwarder/images/inter-vnet-dns.png)


After Installation <br/>


In order to access domain name from your local browser: <br/>

1) Connect to point to site VPN <br/>
2) Add DNS in Macbook from Settings -> Network -> Advanced... -> DNS -> Add DNSProxy server's private IP here (get it from azure portal). <br/>
3) Create private DNS Zone in azure and add virtual netwok link (mts-VNET) <br/>
4) Add A record to private DNS zone of any VM (has to be in same VNET). Value will be VM's private IP. <br/>
5) Access DNS from browser.

<br/>

Follow this guide to integrate it with k8s private IP: https://github.com/kubernetes-sigs/external-dns/blob/master/docs/tutorials/azure-private-dns.md