FROM ubuntu:14.04

RUN sudo apt-get update -y && sudo apt-get install -y wget \
 software-properties-common \
 python-software-properties
RUN wget https://apt.puppetlabs.com/puppet5-release-trusty.deb
RUN dpkg -i puppet5-release-trusty.deb
RUN apt-get update -y && sudo apt-get install -y puppet-agent

RUN /opt/puppetlabs/bin/puppet module install puppetlabs-stdlib
RUN /opt/puppetlabs/bin/puppet module install puppetlabs-apt

ENV PATH /opt/puppetlabs/bin:$PATH

CMD ["/bin/bash"]
