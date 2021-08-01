FROM public.ecr.aws/amazonlinux/amazonlinux:latest

# RUN yum update -y
RUN yum install -y basesystem coreutils sudo passwd initscripts

CMD /bin/bash -c "/bin/bash --login"
ENTRYPOINT /bin/bash -c "/bin/bash --login"
# CMD ["/usr/sbin/init", "/bin/bash", "--login"]
