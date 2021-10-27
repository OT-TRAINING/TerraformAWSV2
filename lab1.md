## Introduction to AWS Basics

In this lab, we will try to create the complete infrastructure manually in AWS to see the problems in manual infrastructure creation.

  - Create a VPC network with the name team_name-vpc
    - 10.0.0.0/20
  - Create two public subnetworks in VPC, with a range
    - 10.0.0.0/22
    - 10.0.4.0/22
  - Create a Nat Gateway in your newly created VPC
  - Create two private subnetworks
    - 10.192.0.0/11
    - 10.224.0.0/12
  - Create routing for private subnets to send traffic through nat gateway
  - Create one VM inside your public subnet   using Nginx image

## Before You Begin

### Prerequisites 

* AWS Account
* Ask your instructor to create a AWS account for your team leader

#### Login into your AWS account using the credentials provided by the instructor.

#### Create a VPC network with the name {YOUR_TEAM_NAME}-vpc

<p> We will first try to acheive the task through AWS Managment Console. Now, Let us create a VPC first. In the console navigate the service VPC. This will open VPC dashboard, after that click on  "your VPC". On the right side "create VPC" option available click on that. It's a time to create VPC, choose the name of VPC, CIDR block, tenancy and tags. </p>

![](https://github.com/OT-TRAINING/TerraformAWSV2/blob/images/lab1/1.png)

![](https://github.com/OT-TRAINING/TerraformAWSV2/blob/images/lab1/2.png)

![](https://github.com/OT-TRAINING/TerraformAWSV2/blob/images/lab1/3.png)

![](https://github.com/OT-TRAINING/TerraformAWSV2/blob/images/lab1/4.png)

![](https://github.com/OT-TRAINING/TerraformAWSV2/blob/images/lab1/5.png)

</p> Now, the VPC has been created. We can proceed to Subnets. Subnet section is available on the left hand pasge of VPC dashboard. Select subnets and create subnet. Now choose the VPC ID in which you want to create subnets. Give the name to a subnet, select the availibilty zone and put CIDR block and tags (optional). This will create the subnet, If you want to create more subnet you can click on "add new subnet", follow the same process as we did for subnet-1. </p>