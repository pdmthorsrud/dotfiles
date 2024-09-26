#!/usr/bin/env bash
prov() {
	cd $MINERVADIR
	cd 'docker/provisioner'
	docker-compose run minerva-provisioner
}
prov
