# If not running interactively, don't do anything
[ -z "$PS1" ] && return

shopt -s checkwinsize
PS1="\e[\033[0;92;1;92m\] (\h) Å:\[\033[0m\] "

# Activate SSH-agent
eval `ssh-agent`

# Aind all RSA-keys in SSH_KEYS_PATH and add those keys to the SSH-agent
chmod -R 0700 ${RSA_KEYS_PATH} \
&& grep -rl 'BEGIN RSA PRIVATE KEY' ${RSA_KEYS_PATH} | xargs ssh-add 2>&1 > /dev/null
