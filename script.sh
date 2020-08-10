#!/bin/bash

export VAULT_ADDR=http://54.159.10.80:8200
vault status
curl --header "X-Vault-Token: s.pwVC5h9x1e34RHTma269d7lt" http://54.159.10.80:8200/v1/sys/mounts | jq
vault kv get -field=key kv-v1/eng/apikey/Google
vault kv get -field=cert kv-v1/prod/cert/mysql
