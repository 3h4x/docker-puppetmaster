FROM e1337h4xx/saltwheezy
MAINTAINER 3h4x "ochach@gmail.com"
ADD puppetlabs.list /etc/apt/sources.list.d/puppetlabs.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 4BD6EC30
RUN apt-get -qq update
RUN apt-get install -y puppetmaster
RUN apt-get upgrade -y
RUN rm -rf /etc/puppet
RUN git clone https://github.com/e1337h4xx/puppet.git /etc/puppet/
RUN echo '*' > /etc/puppet/autosign.conf
RUN echo 'certname=172.17.0.2' >> /etc/puppet/puppet.conf
EXPOSE 8140
CMD (/etc/init.d/puppetmaster start && sleep 5 && tailf /var/log/puppet/masterhttp.log)
