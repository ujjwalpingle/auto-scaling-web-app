
---

### **Auto Scaling Web Application on AWS**

This project shows how to set up a scalable web application on AWS. It uses Auto Scaling, EC2 instances, Load Balancers, and CloudWatch for monitoring and automatically adjusts the number of instances based on traffic.

### **Features**
- **Auto Scaling**: Changes the number of EC2 instances based on CPU usage.
- **Elastic Load Balancer**: Distributes traffic across EC2 instances.
- **Health Check**: Replaces unhealthy EC2 instances automatically.
- **CloudWatch Monitoring**: Triggers scaling actions based on CPU usage.

### **Steps to Deploy**

1. **Clone the Repository**

```bash
git clone https://github.com/ujjwalpingle/auto-scaling-web-app.git
cd auto-scaling-web-app
```

2. **Modify CloudFormation Template**
   - Replace the **AMI ID** and **Key Pair Name** in the template.

3. **Create CloudFormation Stack**
   - In AWS Console, navigate to **CloudFormation**, create a new stack using the updated YAML file.
   - Configure the stack with necessary parameters like AMI ID and Key Pair.

4. **CloudFormation Resources**
   - Creates VPC, Subnet, Internet Gateway, EC2 Instances, Auto Scaling Group, Load Balancer, and CloudWatch Alarms.

5. **How Auto Scaling Works**
   - Automatically increases EC2 instances if CPU utilization > 70% and decreases when utilization is low.

6. **Health Checks and Instance Replacement**
   - Replaces unhealthy EC2 instances to maintain availability.

7. **Load Balancer Configuration**
   - Distributes incoming traffic across healthy instances.

8. **Scaling Policy**
   - Adjusts the number of instances based on load.

9. **Verify the Web Application**
   - Access the web app via the Load Balancer URL and test auto-scaling by increasing traffic.

---

### **Technologies Used**
- **Amazon EC2**
- **Auto Scaling**
- **Elastic Load Balancer**
- **CloudWatch**
- **CloudFormation**

---

### **License**
MIT License. See [LICENSE](LICENSE) for more details.

---

