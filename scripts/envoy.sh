export VAULT_ADDR=https://vault.service.v2.minerva.loc:8200
export VAULT_NAMESPACE=minerva/team2
export VAULT_TOKEN=$(vault login -token-only -method ldap username=$USER password=$VAULT_PASSWORD)
TOKEN=$(vault read consul/creds/tenant-management | awk '$1 ~ /token/' | awk '{split($0, a); print a[2]}')
PORT=$1
SERVICE=$2

docker run -d -it --name $SERVICE-proxy -p $PORT:$PORT -e CONSUL_HTTP_ADDR=https://10.6.130.90:8501 -e CONSUL_GRPC_ADDR=https://10.6.130.90:8502 gitlab-container-registry.minerva.loc/plattform/foundation/devtools/minerva-envoy-proxy:latest management team2 proxy-$SERVICE-pd $SERVICE $PORT $TOKEN
mkdir -p $SCRIPTSDIR/tmp_resources
echo $SERVICE-proxy >> $SCRIPTSDIR/tmp_resources/containers.txt