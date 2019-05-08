import os

#from oauthenticator.google import GoogleOAuthenticator
#c.JupyterHub.authenticator_class = GoogleOAuthenticator
#c.GoogleOAuthenticator.hosted_domain = ['net-targets.com']
#c.GoogleOAuthenticator.oauth_callback_url = 'http://hub.net-targets.com:8000/hub/oauth_callback'
#c.GoogleOAuthenticator.client_id = os.environ['CLIENT_ID']
#c.GoogleOAuthenticator.client_secret = os.environ['CLIENT_SECRET']
#c.GoogleOAuthenticator.username_map = { 'jehoon.song': 'jehoons', 'minkyu.shim': 'm_shim', }
#c.Authenticator.admin_users = {'jehoon_song'}
#
c.LocalAuthenticator.create_system_users = True
c.SystemdSpawner.dynamic_users = True
c.Spawner.default_url = '/lab'
c.Spawner.cmd = ['jupyter-labhub']
 
# from ldapauthenticator import LDAPAuthenticator
#c.JupyterHub.authenticator_class = 'ldapauthenticator.LDAPAuthenticator'
#LDAPAuthenticator.server_address = 'jumpcloud.com'
#c.LDAPAuthenticator.bind_dn_template = [
#    "uid=jehoons,ou=Users,o=5ccd64a9cc5781152cabfc74,dc=jumpcloud,dc=com"
#]
#
#LDAPAuthenticator.lookup_dn_search_user=
#LDAPAuthenticator.lookup_dn_search_password=
