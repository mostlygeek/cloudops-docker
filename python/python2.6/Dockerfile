FROM testfs
MAINTAINER Benson Wong <@mostlygeek>

ADD pyrun2.6 /usr/bin/pyrun2.6

RUN cd /usr/bin && ln -s pyrun2.6 python && \
    mkdir -p /usr/lib/python2.6/site-packages && \
    cd /tmp && \
    curl -O https://pypi.python.org/packages/source/s/setuptools/setuptools-2.1.2.tar.gz && \
    curl -O https://pypi.python.org/packages/source/p/pip/pip-1.4.1.tar.gz && \
    gunzip -c setuptools-2.1.2.tar.gz | tar xvf - && \
    gunzip -c pip-1.4.1.tar.gz | tar xvf - && \
    cd setuptools-2.1.2 && python setup.py install && cd .. && \
    cd pip-1.4.1 && python setup.py install && cd .. &&  \
    rm -rf /tmp/*

CMD ["/bin/sh"]
