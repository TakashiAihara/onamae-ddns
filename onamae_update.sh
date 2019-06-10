#!/bin/bash

function update {

  expect -c "
  spawn env LANG=C openssl s_client -connect ddnsclient.onamae.com:65010 -quiet
  
  send \"LOGIN\n\"
  send \"USERID:${ONAMAE_USERID}\n\"
  send \"PASSWORD:${ONAMAE_PASSWORD}\n\"
  send \".\n\"
  
  expect \"000 COMMAND SUCCESSFUL\" {
     send \"MODIP\n\"
     send \"HOSTNAME:${ONAMAE_HOST}\n\"
     send \"DOMNAME:${ONAMAE_DOMAIN}\n\"
     send \"IPV4:${ONAMAE_IPADDRESS}\n\"
     send \".\n\"
     expect \"000 COMMAND SUCCESSFUL\" {
        send \"LOGOUT\n\"
        send \".\n\"
        exit 0
     }
     exit 0
  }
  "

}

#
# show usage
#

function usage {
        echo "Usage :"
        echo "        ${PROG} [-u username] [-p password] [-h hostname] [-d domain] ipaddress"
}

while getopts u:p:h:d: OPT
do
    case $OPT in
        u)  ONAMAE_USERID=$OPTARG
            ;;
        p)  ONAMAE_PASSWORD=$OPTARG
            ;;
        h)  ONAMAE_HOST=$OPTARG
            ;;
        d)  ONAMAE_DOMAIN=$OPTARG
            ;;
        \?) usage
            ;;
    esac
done
shift $((OPTIND - 1))

ONAMAE_IPADDRESS=$1
update
