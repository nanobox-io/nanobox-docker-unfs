
# IMPORTANT NOTE: docker container must be run with --priviledged="true"

# set up persistance 
# TODO: does this work? Are our docker containers restart ready?
# TODO: may not work with --net="host", nor matter with docker
file "/etc/network/interfaces.d/eth00" do
  content <<-EOF
iface eth0:0 inet static
address #{payload[:service][:ips][:default]}
netmask 255.255.0.0
  EOF
end

# bring up interface
execute "bring up vip" do
  command <<-EOF
    ifconfig eth0:0 #{payload[:service][:ips][:default]}
  EOF
end 
