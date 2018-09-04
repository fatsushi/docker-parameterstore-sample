#!/bin/bash

export CONNECTION_STRING=$(aws ssm get-parameters --name ${OPTION_CONNECTION_STRING_PATH} --with-decryption | jq -r '.Parameters[].Value')
echo "export CONNECTION_STRING=${CONNECTION_STRING}" >>/etc/apache2/envvars

apache2 -DFOREGROUND

