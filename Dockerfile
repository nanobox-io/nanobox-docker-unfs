FROM nanobox/runit

# Create directories
RUN mkdir -p /var/log/gonano

# Copy files
ADD hookit/. /opt/gonano/hookit/mod/
ADD files/. /

# TEMP
RUN apt-get update -qq && \
    apt-get install -y rpcbind nfs-common && \
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/*

RUN curl -s http://pkgsrc.nanobox.io/nanobox/base/Linux/bootstrap.tar.gz | tar -C / -zxf -
RUN echo "http://pkgsrc.nanobox.io/nanobox/base/Linux/" > /data/etc/pkgin/repositories.conf
RUN mkdir -p /data/var/db && \
    /data/sbin/pkg_admin rebuild && \
    rm -rf /data/var/db/pkgin && /data/bin/pkgin -y up && \
    /data/bin/pkgin -y in unfs3 flex # rpcbind nfs-common

# Cleanup disk
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /data/var/db/pkgin

# Run runit automatically
CMD /opt/gonano/bin/nanoinit
