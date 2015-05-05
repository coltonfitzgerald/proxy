function setProxies {
  # NPM
  npm config set proxy $proxy
  npm config set https-proxy $proxy

  if [ -f "$HOME/.zshrc" ]; then
    echo "export ALL_PROXY=\"$proxy\"" >> ~/.zshrc
    sed -i '/unset HTTP_PROXY/d' ~/.zshrc
    sed -i '/unset http_proxy/d' ~/.zshrc
    sed -i '/unset ALL_PROXY/d' ~/.zshrc
    echo "Added to ~/.zshrc"
  else
    echo "export ALL_PROXY=\"$proxy\"" >> ~/.bashrc
    sed -i '/unset HTTP_PROXY/d' ~/.bashrc
    sed -i '/unset http_proxy/d' ~/.bashrc
    sed -i '/unset ALL_PROXY/d' ~/.bashrc
    echo "Added to ~/.bashrc"
  fi

  # Git
  git config --global http.proxy $proxy
}

function unsetProxies {
  # NPM
  npm config delete proxy
  npm config delete https-proxy

  # Ruby
  if [ -f "$HOME/.zshrc" ]; then
    sed -i '/export ALL_PROXY/d' ~/.zshrc
    echo "unset HTTP_PROXY" >> ~/.zshrc
    echo "unset http_proxy" >> ~/.zshrc
    echo "unset ALL_proxy" >> ~/.zshrc
    echo "Removed From ~/.zshrc"
  else
    sed -i '/export ALL_PROXY/d' ~/.bashrc
    echo "unset HTTP_PROXY" >> ~/.bashrc
    echo "unset http_proxy" >> ~/.bashrc
    echo "unset ALL_proxy" >> ~/.bashrc
    echo "Removed From ~/.bashrc"
  fi

  # Git
  git config --unset --global http.proxy
}

function options {
  echo -n "Enter your Proxy URL (example: proxy.ccsd.net) > "
  read url
  echo -n "Enter your port number (example: 80) > "
  read port

  proxy="http://$url:$port"

  echo "You entered: $proxy"

  read -p "Is this correct? (y/n)" choice
  case "$choice" in
    y|Y ) setProxies;;
    n|N ) options;;
    * ) echo "invalid";;
  esac
}


PS3='What would you like to do?'
options=("Set Proxies" "Unset Proxies" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Set Proxies")
            options; break
            ;;
        "Unset Proxies")
            unsetProxies; break
            ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done
