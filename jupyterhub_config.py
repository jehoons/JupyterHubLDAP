import os

c.LocalAuthenticator.create_system_users = True

c.SystemdSpawner.dynamic_users = True

c.Spawner.default_url = '/lab'

c.Spawner.cmd = ['jupyter-labhub']

