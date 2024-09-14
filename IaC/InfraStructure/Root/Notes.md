# WHAT IS DATA BLOCK
- The Primary function of DATA BLOCK is to Fetch 
  and Retrive Information about Existing Resource.
- This information can be used to inform and configure
  other resources within terraform configuration.
- It only reads information from existing Infrastructure.

# WHAT IS RESOURCE BLOCK
- It is use to define and manage infrastructure component

- Key Element of Resource Block
    - TYPE
    - NAME
    - ARGUMENT

- Lifecycle and Meta-Arguments
  Resource blocks can also include lifecycle and meta-arguments to control their behavior.

- Meta Arguments for AWS resources

  depends_on
  count
  for_each
  provider
  lifecycle
  provisioner
  connection

  # WHAT IS MODULE AND ROOT MODULE
  Module is a self-contained unit of Terraform configuration that encapsulates related resources, the root module serves as the entry point and orchestrator for the entire Terraform project, defining the primary infrastructure components and configurations.

  In my project module folder is in TERRAFORM/Module and my root module is in TERRAFORM/Website

  # RESOURCES

    - VPC
    In my vpc module first i have created a data block for  Availability Zone which will fetch list of availability zones for my subnet.

    Then i created Resource Block type "aws_vpc" with name "vpc" with attributes like

      - cidr_block
      In this i have to declare my cider range to define on which ip range my vpc will run.

      - instance_tendancy
      here i have to mention weather i need a dedicated instance, dedicated host or shared physical server is fine

      - enable_dns_hostnames
      This attributes enables or disables DNS Host Name.
      DNS hostnames, or Domain Name System hostnames, are human-readable names assigned to network devices or resources on the internet

    - SUBNET
    Subnet is the logical partition of our Virtual private network and in this project i have created 2 Subnets Private and Public.
    
    In Private and Public Subnet resource block attributrs which i have mentioned are

        - vpc_id
        vpc id is used to indentify on which vpc this subnet have to run

        - cider_block
        So once we know on which vpc i have to run after that we have to define a cidr range in vpc for this Private and Public Subnet.

        - availability_zone
        Here we fetch availability zone from the data block of this availability zone

        - map_public_ip_on_launch 
        It controls whether instances launched within the subnet are automatically assigned public IP addresses when they are launched.

        In case of this project any instance launch in private will not be assigned any ip automatically, and in case of Public Subnet it will

    - SECURITY GROUP
    Security Group allows Inbound and Outbound Traffic at Instance level and each instance can have one or more security group, it is a stateful resource.
    If inbound traffic for a specific port is allowed then automatically corrosponding outbound traffic is also allowed

    In Here i have mention 2 Resource Block

        - aws_security_group
        In this i have mention attributes like name, description for better understanding of this security group and vpc_id which tells to which vpc this security group belongs.

        - aws_security_group_rule
        This are the detailed instruction of the Inbound and Outbound traffic and it have attributes like
    
        - type
        There are two type of traffic
        - Ingress - Inbound Traffic
        - Egress - Outbound Traffic

        - cidr_blocks
        This defines from which ip address or cidr range traffic is allowed

        - protocol
        protocol enables application programs and computing devices to exchange messages over a network. 
        Here in this project i have mention 'tcp' protocol for
        all rules

        - from_port  | - to_port
        In this we define port range to which the rule apply
        
        - security_group_id
        It defines to which security group this rule belong too

    - S3
    s3 are containers for storing s3 object.
    Here i created 2 Resource Block
        - aws_s3_bucket
        - aws_vpc_endpoint 
        when vpc endpoint is created we establish a private connection between vpc and the service .. so in our case we are connecting with s3.
        VPC can be managed using VPC endpoints, IAM policies, and bucket policies.
    
    - ROUTE TABLE
    In here we define thorugh which route our traffic will flow, i have created 6 resource for routing.

    2 Route Table
      - In this block we define in which vpc route are created by adding vpc_id attribute

    2 Route
      - In this block we are defining the flow of traffic
        with attributes like 
          - route_table_id
          - destination_cider_block
          - gateway_id or nat_gateway_id

    2 Route Table Association
      - In this block we define association between
        route table and subnet
    
    So my public subnet is accessing traffic from internet gateway and private subnet form nat gateway

    - NAT GATEWAY
    This works as Internet gateway for my Private Subnet, and 
    for creating a nat we must have Elastic Ip for it, so for my nat gateway i have created 2 Resource Block ie Elastic Ip Block and Nat Gateway Block.

    In Elastip IP Resource we have to mention under attribute instance to which resource this IP belong, and 
    In Nat Gateway Resource we have to mention to which subnet it is connected to and which Elestic Ip it have

    - NACL
    NACL works withing VPC at Subnet level, in this NACL i have allow inbound and ourbound through port 22, 80 and 443 for ssh , http and https respectively.

    In NACL resource block we have to mention within which vpc our nacl work for that we mntion vpc_id and

    In aws_network_acl_rule we specify which type of traffic we need to allow with protocols like
      - egress : can be true or false
      - rule_number
      - protocol
      - rule_action : can be allow or deny
      - cidr_block
      - from_port
      - to_port
      - network_acl_id
      
    We can have 20 rules to control inbound traffic and 20 rules to control outbound traffic.

    - EC2
    In EC2 there are few Blocks are working with each other and that is Data Block for AMI, Resource Block for EC2 and Keypair that include 2 Resource block that is tls_private_key and aws_key_pair.

    - Internet Gateway
    In this we have created 2 resource one for Internet gateway and other resource for attachment of Ig with the VPC


    - ECR
      This file will contain the configuration for managing your AWS ECR repositories.
    
    - Task Defination
      This defines literally how everythings going to run

    - ECS
      This tells where and how it need to run