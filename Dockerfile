FROM public.ecr.aws/amazonlinux/amazonlinux:latest

# RUN cat /etc/mtab
# RUN yum update -y
# RUN yum install df
# RUN df -h /var/cache/yum/x86_64/2/amzn2-core
RUN yum install -y basesystem coreutils sudo passwd initscripts

# CMD /bin/bash -c "/bin/bash -i <>/dev/tty0"
# ENTRYPOINT /bin/bash -c "/bin/bash -i <>/dev/tty0"
CMD /bin/bash -c "/bin/bash --login"
ENTRYPOINT /bin/bash -c "/bin/bash --login"
# CMD ["/usr/sbin/init", "/bin/bash"]
