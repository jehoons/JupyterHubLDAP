import os

c.LocalAuthenticator.create_system_users = True

c.SystemdSpawner.dynamic_users = True

c.Spawner.default_url = '/lab'

c.Spawner.cmd = ['jupyter-labhub']

c.JupyterHub.ssl_key = '/etc/letsencrypt/live/hub.net-targets.com/privkey.pem'
c.JupyterHub.ssl_cert = '/etc/letsencrypt/live/hub.net-targets.com/fullchain.pem'

