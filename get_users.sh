#!/bin/bash -eu
ldapsearch -H ldap://ldap.jumpcloud.com:389 -ZZ -x -b "ou=Users,o=5ccd64a9cc5781152cabfc74,dc=jumpcloud,dc=com" -D "uid=cloud1,ou=Users,o=5ccd64a9cc5781152cabfc74,dc=jumpcloud,dc=com" -w `cat passwd.txt` "(objectClass=inetOrgPerson)" 
