 #!/bin/bash

MACHINE_HOST_IP="$(ipconfig getifaddr en0)"
echo "${MACHINE_HOST_IP}"