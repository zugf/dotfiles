if test -z "$SSH_ENV"
    set -xg SSH_ENV $HOME/.ssh/ssh-agent
end

if not __ssh_agent_is_started
    __ssh_agent_start
end