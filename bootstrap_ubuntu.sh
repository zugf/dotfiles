# https://github.com/cli/cli/blob/trunk/docs/install_linux.md
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh
# run
# GITHUB_TOKEN=""
# gh auth login
# set HTTPS and authenticate Git, GithubToken


if [ "$(uname)" == "Darwin" ]; then
  # Nushell MacOS hack
  ln -s $DOTFILEDIR/.config/nushell "$HOME/Library/Application Support"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  # Ensure that fish is installed under Linux
  echo $(which fish)
  # apt-get update && export DEBIAN_FRONTEND=noninteractive \
  #     && apt-get -y install --no-install-recommends fish
  # wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh && chmod +x /usr/local/bin/oh-my-posh
fi


