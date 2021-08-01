FROM public.ecr.aws/amazonlinux/amazonlinux:latest

# RUN yum update -y
# RUN yum install -y basesystem coreutils sudo passwd initscripts bash sshd
RUN yum install -y basesystem coreutils sudo passwd bash openssh-server

# RUN --mount=type=tmpfs,target=/dev --mount=type=tmpfs,target=/run
# RUN rm /usr/lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup.service

CMD /sbin/sshd
ENTRYPOINT /usr/sbin/sshd
# ENTRYPOINT /bin/bash --login
# CMD ["/usr/sbin/init", "/bin/bash", "--login"] # does not work because of cgroups
