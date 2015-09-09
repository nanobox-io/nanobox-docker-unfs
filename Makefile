all: image tag

image:
	@vagrant up
	@vagrant ssh -c "sudo docker build -t nanobox/nfs /vagrant"

tag:
	@vagrant ssh -c "sudo docker tag -f nanobox/nfs nanobox/nfs:0.9"
	@vagrant ssh -c "sudo docker tag -f nanobox/nfs nanobox/nfs:0.9-stable"
	@vagrant ssh -c "sudo docker tag -f nanobox/nfs nanobox/nfs:0.9-beta"
	@vagrant ssh -c "sudo docker tag -f nanobox/nfs nanobox/nfs:0.9-alpha"
	@vagrant ssh -c "sudo docker tag -f nanobox/nfs nanobox/nfs:stable"
	@vagrant ssh -c "sudo docker tag -f nanobox/nfs nanobox/nfs:beta"
	@vagrant ssh -c "sudo docker tag -f nanobox/nfs nanobox/nfs:alpha"

publish: push_09_stable

push_09_stable: push_09_beta
	@vagrant ssh -c "sudo docker push nanobox/nfs"
	@vagrant ssh -c "sudo docker push nanobox/nfs:0.9"
	@vagrant ssh -c "sudo docker push nanobox/nfs:0.9-stable"
	@vagrant ssh -c "sudo docker push nanobox/nfs:stable"

push_09_beta: push_09_alpha
	@vagrant ssh -c "sudo docker push nanobox/nfs:0.9-beta"
	@vagrant ssh -c "sudo docker push nanobox/nfs:beta"

push_09_alpha:
	@vagrant ssh -c "sudo docker push nanobox/nfs:0.9-alpha"
	@vagrant ssh -c "sudo docker push nanobox/nfs:alpha"

clean:
	@vagrant destroy -f
