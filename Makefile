# -*- mode: make; tab-width: 4; -*-
# vim: ts=4 sw=4 ft=make noet
all: build publish

LATEST:=0.9
stability?=latest
version?=$(LATEST)
dockerfile?=Dockerfile-$(version)

login:
	@vagrant ssh -c "docker login"

build:
	@echo "Building 'nfs' image..."
	@vagrant ssh -c "docker build -f /vagrant/Dockerfile-${version} -t nanobox/nfs /vagrant"

publish:
	@echo "Tagging 'nfs:${version}-${stability}' image..."
	@vagrant ssh -c "docker tag -f nanobox/nfs nanobox/nfs:${version}-${stability}"
	@echo "Publishing 'nfs:${version}-${stability}'..."
	@vagrant ssh -c "docker push nanobox/nfs:${version}-${stability}"
ifeq ($(version),$(LATEST))
	@echo "Publishing 'nfs:${stability}'..."
	@vagrant ssh -c "docker tag -f nanobox/nfs nanobox/nfs:${stability}"
	@vagrant ssh -c "docker push nanobox/nfs:${stability}"
endif

clean:
	@echo "Removing all images..."
	@vagrant ssh -c "for image in \$$(docker images -q); do docker rmi -f \$$image; done"