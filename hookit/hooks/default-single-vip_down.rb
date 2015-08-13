
execute "bring down vip" do
  command "ifconfig eth0:0 down"
end 

execute "remove persistance" do
  command "rm /etc/network/interfaces.d/eth00"
end
