 #!/bin/bash

MACHINE_HOST_IP="$(hostname -I | cut -d " " -f 2)"
echo "${MACHINE_HOST_IP}"