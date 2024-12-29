Here's the **README.md** content with the full code for your GitHub project. The README is simplified, with clear explanations of each component, and includes all necessary sections for easy understanding.

```markdown
# Auto Scaling Web Application on AWS

This project demonstrates how to create a highly scalable web application on AWS using services like Auto Scaling, EC2, Load Balancer, and CloudWatch for monitoring. It automatically adjusts the number of instances based on the traffic load and scales the application dynamically.

## Features
- **Auto Scaling**: Adjusts the number of EC2 instances based on CPU utilization metrics.
- **Elastic Load Balancer**: Distributes traffic across multiple EC2 instances to ensure high availability.
- **Health Check**: Automatically replaces unhealthy EC2 instances.
- **CloudWatch Monitoring**: Triggers scaling actions based on CPU usage.

## Steps to Deploy

### 1. **Clone the Repository**

First, clone this repository to your local machine:

```bash
git clone https://github.com/ujjwalpingle/auto-scaling-web-app.git
cd auto-scaling-web-app
```

### 2. **Modify CloudFormation Template**

Before deploying, update the CloudFormation template:

- **AMI ID**: Replace the `ami-0c55b159cbfafe1f0` value with your specific AMI ID.
- **Key Pair Name**: Replace `"my-key-pair"` with the name of your SSH key pair.

### 3. **Create a CloudFormation Stack**

- Open **AWS Management Console**.
- Navigate to **CloudFormation** and click on **Create Stack**.
- Upload the `auto-scaling-web-app.yaml` template file.
- Follow the wizard to configure the stack and provide necessary parameters, including the modified AMI ID and Key Pair.

### 4. **CloudFormation Resources**

CloudFormation will create the following resources:

1. **VPC**: The network within which your EC2 instances will operate.
2. **Subnet**: Subnet for deploying EC2 instances.
3. **Internet Gateway**: Provides internet access to EC2 instances.
4. **EC2 Instances**: The virtual servers to run the web application.
5. **Auto Scaling Group**: Automatically adjusts the number of EC2 instances based on traffic.
6. **Elastic Load Balancer**: Distributes incoming traffic to multiple EC2 instances.
7. **CloudWatch Alarms**: Monitors CPU utilization and triggers scaling actions.

### 5. **How Auto Scaling Works**

- The **Auto Scaling Group (ASG)** adjusts the number of EC2 instances based on **CPU utilization**.
  - If CPU utilization exceeds 70%, more EC2 instances are launched.
  - If the CPU utilization is low, unnecessary instances are terminated.

Example of how CloudWatch alarm is set for CPU utilization:

```yaml
CpuAlarm:
  Type: AWS::CloudWatch::Alarm
  Properties:
    MetricName: "CPUUtilization"
    Dimensions:
      - Name: "AutoScalingGroupName"
        Value: !Ref AutoScalingGroup
    Statistic: "Average"
    Threshold: 70
    ComparisonOperator: "GreaterThanThreshold"
    AlarmActions:
      - Ref: ScalingPolicy
```

### 6. **Health Checks and Instance Replacement**

If an EC2 instance becomes unhealthy (e.g., an HTTP check fails), the Auto Scaling Group will replace the unhealthy instance with a new one. This ensures your application remains highly available.

### 7. **Load Balancer Configuration**

The **Elastic Load Balancer (ELB)** automatically distributes incoming traffic across healthy EC2 instances, ensuring that no single instance is overwhelmed.

Example configuration of the Load Balancer:

```yaml
LoadBalancer:
  Type: AWS::ElasticLoadBalancingV2::LoadBalancer
  Properties:
    Scheme: "internet-facing"
    Subnets: 
      - !Ref Subnet
    SecurityGroups: 
      - !Ref InstanceSecurityGroup
```

### 8. **Scaling Policy**

The **Scaling Policy** adjusts the capacity of the Auto Scaling group. The `ScalingAdjustment` property defines how many instances to add or remove.

Example configuration for the scaling policy:

```yaml
ScalingPolicy:
  Type: AWS::AutoScaling::ScalingPolicy
  Properties:
    ScalingAdjustment: 1
    AdjustmentType: ChangeInCapacity
    AutoScalingGroupName: !Ref AutoScalingGroup
```

### 9. **Verify the Web Application**

After deployment, you can access the web application via the **Load Balancer URL**. The application will display an HTTP server running, and if CPU utilization increases, new instances will automatically spin up to handle the load.

You can also manually simulate traffic to test auto-scaling by accessing the application several times. This will cause CloudWatch alarms to trigger and scale the application accordingly.

---

## Technologies Used

- **Amazon EC2**: Virtual servers to run the application.
- **Auto Scaling**: Automatically adjusts the number of instances based on load.
- **Elastic Load Balancer**: Distributes traffic evenly across instances.
- **CloudWatch**: Monitors metrics like CPU utilization for scaling actions.
- **CloudFormation**: Automates the setup of all resources in AWS.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

```

---
# auto-scaling-web-app
