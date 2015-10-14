
execute "send diff data to new member" do
  command "rsync --delete -a /data/var/db/nfs/. #{payload[:new_member][:local_ip]}:/data/var/db/nfs/"
end
