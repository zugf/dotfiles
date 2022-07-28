# zugf: add credential manager
# https://code.visualstudio.com/docs/remote/containers#_sharing-git-credentials-with-your-container
if [ -z "$SSH_AUTH_SOCK" ]; then
   # Check for a currently running instance of the agent
   RUNNING_AGENT="`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'`"
   if [ "$RUNNING_AGENT" = "0" ]; then
        # Launch a new instance of the agent
        ssh-agent -s &> $HOME/.ssh/ssh-agent
   fi
   eval `cat $HOME/.ssh/ssh-agent`
   ssh-add
fi

echo "exec .bash_profile"

# zugf: pyenv
if [ -x "$(command -v pyenv)" ]; then
   export PYENV_ROOT="$HOME/.pyenv"
   command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
   eval "$(pyenv init -)"
fi

# Created by `pipx` on 2022-06-27 12:57:34
export PATH="$PATH:$HOME/.local/bin"

