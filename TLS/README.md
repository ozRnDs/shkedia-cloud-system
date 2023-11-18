# Overview
This section deals with the process of designing and implementing all the Private TLS certificates

# Creating Self-Signed Certificates
Run the bash script from [devopscube](https://devopscube.com/create-self-signed-certificates-openssl/).
```bash
bash ssl.sh [ip/domain]
```

# Testing

# Using the certificates
## Server Side
For FastAPI nginx container should be used to handle all the SSL/TLS Process.
1. Get the image:
    ```bash
    docker pull nginx:latest
    ```
2. Update the nginx sever.config file as needed
    Use the [nginx beginners guide](https://nginx.org/en/docs/beginners_guide.html#conf_structure) and [HTTPS explanation](https://nginx.org/en/docs/http/configuring_https_servers.html)
3. Build the component image
    ```bash
    docker build . -t shkedia_tls_component:0.1.0
    ```
## Client Side
### Chrome in windows
Use the [following guide](https://docs.vmware.com/en/VMware-Adapter-for-SAP-Landscape-Management/2.1.0/Installation-and-Administration-Guide-for-VLA-Administrators/GUID-D60F08AD-6E54-4959-A272-458D08B8B038.html) to add the certificate to the client's browser.