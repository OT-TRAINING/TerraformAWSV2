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

![](https://github.com/OT-TRAINING/TerraformAWSV2/blob/images/lab1/1.png)

![](https://github.com/OT-TRAINING/TerraformAWSV2/blob/images/lab1/2.png)