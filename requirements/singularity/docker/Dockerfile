ADD file:5ed435208da6621b45db657dd6549ee132cde58c4b6763920030794c2f31fbc0 in / 

RUN /bin/sh -c set -xe 		&& echo '#!/bin/sh' > /usr/sbin/policy-rc.d 	&& echo 'exit 101' >> /usr/sbin/policy-rc.d 	&& chmod +x /usr/sbin/policy-rc.d 		&& dpkg-divert --local --rename --add /sbin/initctl 	&& cp -a /usr/sbin/policy-rc.d /sbin/initctl 	&& sed -i 's/^exit.*/exit 0/' /sbin/initctl 		&& echo 'force-unsafe-io' > /etc/dpkg/dpkg.cfg.d/docker-apt-speedup 		&& echo 'DPkg::Post-Invoke { "rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin || true"; };' > /etc/apt/apt.conf.d/docker-clean 	&& echo 'APT::Update::Post-Invoke { "rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin || true"; };' >> /etc/apt/apt.conf.d/docker-clean 	&& echo 'Dir::Cache::pkgcache ""; Dir::Cache::srcpkgcache "";' >> /etc/apt/apt.conf.d/docker-clean 		&& echo 'Acquire::Languages "none";' > /etc/apt/apt.conf.d/docker-no-languages 		&& echo 'Acquire::GzipIndexes "true"; Acquire::CompressionTypes::Order:: "gz";' > /etc/apt/apt.conf.d/docker-gzip-indexes 		&& echo 'Apt::AutoRemove::SuggestsImportant "false";' > /etc/apt/apt.conf.d/docker-autoremove-suggests

RUN /bin/sh -c rm -rf /var/lib/apt/lists/*

RUN /bin/sh -c sed -i 's/^#\s*\(deb.*universe\)$/\1/g' /etc/apt/sources.list

RUN /bin/sh -c mkdir -p /run/systemd && echo 'docker' > /run/systemd/container

CMD ["/bin/bash"]

RUN /bin/sh -c apt-get update && apt-get install -y libopenmpi-dev bc cmake gfortran libxml2-dev wget perl gcc g++ git tar gzip ssh ca-certificates zlib1g-dev

RUN /bin/bash

RUN /bin/bash

