# VeriPark Terraform Azure PoC

## Architecture
Secure 3-tier Azure architecture using Private Link.

Internet → Application Gateway → Backend Webapi → Middleware → SQL

## Key Features
- Private Endpoints for all services
- SQL encrypted with CMK (Key Vault)
- No public access to backend resources
- NSG for traffic control
- Private DNS integration

## Design Decisions
- Focused on secure workload deployment
- Modular Terraform for reusability

## Future Enhancements
- Hub-Spoke Landing Zone
- Azure Firewall
- CI/CD pipeline
- VPN to connect on-prem
- Appservice integration with Appgw


1.	Name the concept where you position the applications/workloads in Azure/Cloud.
   
    N-tier architecture with workload isolation
  	
3.	What would be the name of the networking structure we should use in the architecture above.
   
    Hub-Spoke network model would be apt for this.
