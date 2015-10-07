
# TODO: assuming we can scp backups to a backup container
execute "send data to backup container" do
  command "tar -C / -czf - /data/var/db/nfs | ssh #{payload[:backup][:local_ip]} > /data/var/db/nfs/#{payload[:backup][:backup_id]}.tgz"
end
