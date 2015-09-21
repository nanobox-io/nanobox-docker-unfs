
# TODO: assuming we can scp backups to a backup container
execute "send data to backup container" do
  command "tar -C / -czf - /datas | ssh #{payload[:backup][:local_ip]} > /datas/#{payload[:backup][:backup_id]}.tgz"
end
