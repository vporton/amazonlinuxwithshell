FROM public.ecr.aws/amazonlinux/amazonlinux:latest

# RUN yum update -y
# RUN yum install -y basesystem coreutils sudo passwd initscripts bash sshd
RUN yum install -y basesystem coreutils initscripts sudo passwd bash openssh-server

# RUN --mount=type=tmpfs,target=/dev --mount=type=tmpfs,target=/run
# RUN rm /usr/lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup.service

RUN /usr/bin/ssh-keygen -A

COPY init.sh /etc/local/init.sh
RUN chmod a+x /etc/local/init.sh

CMD /etc/local/init.sh
ENTRYPOINT /etc/local/init.sh
# CMD /bin/bash --login
# ENTRYPOINT /bin/bash --login
# CMD ["/usr/sbin/init", "/bin/bash", "--login"] # does not work because of cgroups
