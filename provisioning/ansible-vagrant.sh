#!/bin/sh

# ejecutar ansible-playbook sobre la maquina de vagrant
# para usar
#   ./ansible-playbook-vagrant.sh playbook.yml [args]
export ANSIBLE_HOST_KEY_CHECKING=False
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

ansible-playbook $DIR/playbook.yml \
    $1 $2 $3 $4 \
    --inventory-file=$DIR/../.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory \
    --private-key=$DIR/../.vagrant/machines/default/virtualbox/private_key \
    --user=vagrant \
    --connection=ssh
