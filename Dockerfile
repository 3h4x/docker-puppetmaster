FROM e1337h4xx/saltwheezy
MAINTAINER 31337 +3r0rr "ochach@gmail.com"
RUN apt-get -qq update
RUN apt-get install -y apt-utils
ADD puppetlabs.list /etc/apt/source.list.d/puppetlabs.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 4BD6EC30
RUN apt-get -qq update
RUN apt-get upgrade -y
RUN apt-get install -y puppetmaster
EXPOSE 8140
CMD (/etc/init.d/puppetmaster start && sleep 5 && tailf /var/log/puppet/masterhttp.log)
