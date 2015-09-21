# Test nfs after build
set -e
docker run --privileged --name=nfs-test -d nanobox/nfs
docker exec -it nfs-test /bin/bash
curl localhost:5540/hooks/configure -d '{"logtap_host":"10.0.2.15:6361","uid":"db1"}'
sleep 2
mkdir /mnt/data
mount -v -o vers=3 localhost:/datas /mnt/data
sv status storage
exit
docker kill nfs-test
