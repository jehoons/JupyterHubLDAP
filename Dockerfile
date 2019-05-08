# Option 1:
# FROM jupyterhub/jupyterhub:latest
# And put your configuration file jupyterhub_config.py in /srv/jupyterhub/jupyterhub_config.py.
# Option 2:
# Or you can create your jupyterhub config and database on the host machine, and mount it with:
# docker run -v $PWD:/srv/jupyterhub -t jupyterhub/jupyterhub
# NOTE
# If you base on jupyterhub/jupyterhub-onbuild
# your jupyterhub_config.py will be added automatically
# from your docker directory.
FROM jupyterhub/jupyterhub:latest

RUN apt update && apt install nano -y 

# jupyterhub auth 
RUN pip install oauthenticator
RUN pip install notebook
RUN pip install jupyterlab
RUN jupyter labextension install @jupyterlab/hub-extension
RUN pip install jupyterhub-ldapauthenticator
RUN apt update && apt install ldap-utils -y 

ENV JUPYTERHUB_HOME=/srv/jupyterhub

# for LDAP 
RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y nano openssh-server openssh-client sudo git wget curl whiptail
RUN DEBIAN_FRONTEND=noninteractive apt-get install libpam-ldap nscd -y

# file copy and permission: 
COPY jupyterhub_config.py /srv/jupyterhub/jupyterhub_config.py
COPY lets-ldap /usr/local/bin/lets-ldap
RUN chmod 700 /usr/local/bin/lets-ldap
RUN chown root:root /usr/local/bin/lets-ldap
RUN export DEBIAN_FRONTEND=gtk
COPY startup.sh $JUPYTERHUB_HOME/startup.sh
RUN chmod +x $JUPYTERHUB_HOME/startup.sh

WORKDIR $JUPYTERHUB_HOME

USER root

ENTRYPOINT ["/srv/jupyterhub/startup.sh"]
