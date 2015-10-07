
execute "retrieve data from backup container" do
  command "ssh #{payload[:backup][:local_ip]} 'cat /data/var/db/nfs/#{payload[:backup][:backup_id]}.tgz' | tar -C / -zxf -"
end
