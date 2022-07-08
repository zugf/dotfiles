set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "$CHECKOUT/bin" $fish_user_paths
set -x DOCKER_DEFAULT_PLATFORM linux/amd64
oh-my-posh init fish --config ~/.config/poshtheme.omp.json | source

if status is-interactive
    envsource ~/.splunkbuild.env

    if test -z (pgrep ssh-agent | string collect)
        eval (ssh-agent -c)
        set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
        set -Ux SSH_AGENT_PID $SSH_AGENT_PID
    end
end