# Overview
AWS has an s3 storage with buckets.  
Use the create_bucket.py code inorder to create a bucket.  
[s3 python client Documentation](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/s3.html)

# AWS Credentials
In case the container is on AWS machine, make sure that machine has built in credentials to s3 bucket.  
In order to work with aws repository, with a machine outside the AWS cloud, there should be 2 files maped to the container as follow:
```bash
cat << EOT >> ~/.aws/config
    [default]
    region = <the region of the bucket>
    EOT

cat << EOT >> ~/.aws/credentials
    [default]
    aws_access_key_id = <The application's account access key>
    aws_secret_access_key = <The application's account secret access key>
    EOT
```