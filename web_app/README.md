# Static Website Hosting on AWS S3 + CloudFront

# Project Overview

This project demonstrates how to host a static website using AWS S3 and distribute it globally with Amazon CloudFront.

The setup provides:

- Static website hosting
- Global content delivery (CDN)
- HTTPS support
- Faster website performance
- Scalable and low-cost hosting

---

# Architecture

```text
User → CloudFront → S3 Static Website
```

---

# Technologies Used

- AWS S3
- Amazon CloudFront
- HTML/CSS/JavaScript
- AWS IAM
- AWS Console

---

# Project Structure

```text
my-static-site/
│
├── index.html
├── style.css
├── script.js
└── images/
```

---

# Features

- Static website hosting using Amazon S3
- Secure content delivery using CloudFront
- HTTPS-enabled website access
- Global edge caching
- Easy deployment and scalability

---

# Steps

## Step 1 — Create an S3 Bucket
1. Open the AWS S3 Console
2. Click **Create bucket**
3. Enter a globally unique bucket name
4. Select your preferred AWS region
5. Disable:
   ```
   Block all public access
   ```
6. Create the bucket

---

## Step 2 — Upload Website Files
Upload your static website files:

- index.html
- CSS files
- JavaScript files
- images

---

## Step 3 — Enable Static Website Hosting
Navigate to:

```text
Bucket → Properties → Static website hosting
```

Enable:

```text
Static website hosting
```

Set:

```text
Index document: index.html
```

Save the configuration.

---

## Step 4 — Configure Bucket Policy
Go to:

```text
Bucket → Permissions → Bucket Policy
```

Add the following policy:

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "s3WebHosting",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::netflix-files-yoousuph/*"
        }
    ]
}

```

Replace:
```text
YOUR-BUCKET-NAME
```
with your actual bucket name.

---

## Step 5 — Test the S3 Website Endpoint
After enabling static hosting, AWS generates a website endpoint:
```text
http://netflix-files-yoousuph.s3-website-us-east-1.amazonaws.com
```
Open the endpoint in your browser to confirm the website is working.

---

## Step 6 — Create a CloudFront Distribution
1. Open the AWS CloudFront Console
2. Click **Create Distribution**
3. Under **Origin Domain**, select the S3 website endpoint
4. Configure the following settings:
* Recommended Settings

### Viewer Protocol Policy
```text
Redirect HTTP to HTTPS
```

### Allowed HTTP Methods
```text
GET, HEAD
```

### Default Root Object
```text
index.html
```

5. Create the distribution

Deployment may take several minutes.

---

## Step 7 — Access the Website Through CloudFront

CloudFront generates a domain such as:

```text
https://dxxxxxxxx.cloudfront.net
```

Open the URL to view the deployed website.

---

# CloudFront Benefits
- Low latency content delivery
- HTTPS support
- Edge caching
- Better scalability
- Improved website performance

---

---

# Common Issues and Fixes

## Access Denied Error
Possible causes:
- Public access block still enabled
- Incorrect bucket policy

---

## 403 Forbidden from CloudFront
Possible causes:
- Wrong origin selected
- Using S3 bucket endpoint instead of S3 website endpoint

---

## Website Changes Not Updating
CloudFront caches content.

Create an invalidation:

```text
/*
```

---

# Future Improvements
- Add a custom domain using Route 53
- Configure SSL certificates using ACM
- Automate deployment using GitHub Actions
- Secure bucket access using Origin Access Control (OAC)
- Add monitoring with CloudWatch

---

# Learning Outcomes
By completing this project, you gain experience with:

- AWS S3
- Amazon CloudFront
- Static website hosting
- CDN architecture
- Cloud security basics
- Web deployment workflows

---

# Conclusion
This project demonstrates the deployment of a scalable and secure static website using AWS S3 and Amazon CloudFront. By integrating object storage with a global Content Delivery Network (CDN), the solution delivers fast, reliable, and highly available web content over HTTPS.

Through this implementation, key cloud engineering concepts such as static website hosting, edge caching, content distribution, access management, and web delivery optimization were explored using AWS services.

This project also serves as a strong foundation for more advanced cloud solutions involving custom domains, CI/CD pipelines, serverless architectures, and cloud security best practices.

# Author

Yuusf Kehinde

- IT Infrastructure Engr., Cloud Engineer.
