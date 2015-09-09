all: image tag

image:
	@vagrant up
	@vagrant ssh -c "sudo docker build -t nanobox/nfs /vagrant"

tag:
	@vagrant ssh -c "sudo docker tag -f nanobox/nfs nanobox/nfs:0.9"
	@vagrant ssh -c "sudo docker tag -f nanobox/nfs nanobox/nfs:0.9-stable"
	@vagrant ssh -c "sudo docker tag -f nanobox/nfs nanobox/nfs:0.9-beta"
	@vagrant ssh -c "sudo docker tag -f nanobox/nfs nanobox/nfs:0.9-alpha"

publish:
	@vagrant ssh -c "sudo docker push nanobox/nfs"
	@vagrant ssh -c "sudo docker push nanobox/nfs:0.9"
	@vagrant ssh -c "sudo docker push nanobox/nfs:0.9-stable"

push_09_stable:
	@vagrant ssh -c "sudo docker push nanobox/nfs"
	@vagrant ssh -c "sudo docker push nanobox/nfs:0.9"
	@vagrant ssh -c "sudo docker push nanobox/nfs:0.9-stable"

push_09_beta:
	@vagrant ssh -c "sudo docker push nanobox/nfs:0.9-beta"

push_09_alpha:
	@vagrant ssh -c "sudo docker push nanobox/nfs:0.9-alpha"

clean:
	@vagrant destroy -f
