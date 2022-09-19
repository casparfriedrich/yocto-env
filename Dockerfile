FROM crops/poky:ubuntu-20.04

USER root

# ST requirements: https://wiki.st.com/stm32mpu/wiki/PC_prerequisites#Installing_extra_packages
RUN apt-get -y install build-essential libncurses5 libssl-dev

# kas requirements
RUN apt-get -y install python3 python3-pip python3-newt
RUN pip3 install kas

# meta-matter requirements
RUN apt-get -y install nodejs npm

RUN ssh-keyscan -p 7999 git.viessmann.com >> /etc/ssh/ssh_known_hosts
RUN ssh-keyscan gitlab.kelle.grp >> /etc/ssh/ssh_known_hosts

RUN update-alternatives --install $(which python) python $(which python3) 0

USER usersetup
