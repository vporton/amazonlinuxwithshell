FROM public.ecr.aws/amazonlinux/amazonlinux:latest

# RUN yum update -y
RUN yum install -y basesystem coreutils sudo passwd initscripts

# RUN --mount=type=tmpfs,target=/dev --mount=type=tmpfs,target=/run
# RUN rm /usr/lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup.service

# CMD /bin/bash -c "/bin/bash --login"
# ENTRYPOINT /bin/bash -c "/bin/bash --login"
CMD /bin/bash --login
ENTRYPOINT /bin/bash --login
# CMD ["/usr/sbin/init", "/bin/bash", "--login"] # does not work because of cgroups
