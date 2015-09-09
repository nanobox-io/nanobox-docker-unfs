
service 'storage' do
  action :enable
  init :runit
end

ensure_socket 'storage' do
  port '2049'
  action :listening
end
