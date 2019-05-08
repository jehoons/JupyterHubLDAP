# JupyterHubLDAP 

**Step 1. Set env-file**

Copy env-file.example to env-file. then, edit it properly. 

**Step 2. Run update and Start the docker**
```
sudo ./JupyterHubLDAP.sh update [-d]
```

The option `-d` is for daemon mode of the JupyterHub. 

**SSL Certification**

We use letsencrypt to get certification of the hub.net-targets.com. 
letsencrypt is explained well from the following website: 

https://www.linode.com/docs/security/ssl/install-lets-encrypt-to-create-ssl-certificates/

J. 
