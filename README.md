# Amazon Linux with Shell
**Not enough tested!**, but seems already a useful software.

Amazon Linux variant to be used in a container. On start launches a shell.

It is intended to be used as your admin console in AWS (as an alternative to Amazon Cloud Console).
Run it and then use the shell.

## Usage

When running for the first time, set enviroment variable `root_key` to output of `cat ~/.ssh/id_rsa.pub` (or other `.pub` key)
for an administrative user account (of your local machine) in order to set the file `/root/.ssh/authorized_keys` to an appropriate value.

You also can set enviroment variable `force_change_root_key` to non-empty value to update root's public key
from `root_key` even if it was already set earlier.
