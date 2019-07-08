FROM ubuntu:18.10
#
RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    acl \
    apache2 \
    asciidoc \
    bzip2 \
    cdbs \
    curl \
    debhelper \
    debianutils \
    devscripts \
    docbook-xml \
    dpkg-dev \
    fakeroot \
    gawk \
    gcc \
    git \
    iproute2 \
    libffi-dev \
    libssl-dev \
    libxml2-utils \
    locales \
    lsb-release \
    make \
    mercurial \
    mysql-server \
    openssh-client \
    openssh-server \
    python-cryptography \
    python-dev \
    pass \
    python-dbus \
    python-httplib2 \
    python-jinja2 \
    python-keyczar \
    python-lxml \
    python-mock \
    python-mysqldb \
    python-nose \
    python-paramiko \
    python-passlib \
    python-pip \
    python-setuptools \
    python-virtualenv \
    python-wheel \
    python-yaml \
    reprepro \
    rsync \
    ruby \
    sshpass \
    subversion \
    sudo \
    tzdata \
    unzip \
    virtualenv \
    xsltproc \
    zip \
    vim \
    iputils-ping \
    net-tools \
    && \
    apt-get clean

# ansible & F5 dependencies
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-add-repository --yes --update ppa:ansible/ansible
RUN apt-get -y install ansible
RUN pip install f5-sdk bigsuds netaddr deepdiff 'ansible[azure]'
#
RUN rm /etc/apt/apt.conf.d/docker-clean
# RUN mkdir /etc/ansible/
RUN /bin/echo -e "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts
RUN locale-gen en_US.UTF-8
# Install az CLI 
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
ENV container=docker
WORKDIR /root/azure
