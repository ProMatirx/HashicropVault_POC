#!/bin/bash


export VAULT_ADDR=http://34.238.150.94:8200
vault login s.pwVC5h9x1e34RHTma269d7lt
curl --header "X-Vault-Token: s.pwVC5h9x1e34RHTma269d7lt" http://34.238.150.94:8200/v1/sys/mounts | jq
vault kv get -field=key kv-sec/openssl/secrets/pem >.cert.pem
vault kv get -field=self kv-sec/openssl/selfsigned/cert >.selfsigned.key
