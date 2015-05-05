function setProxies {
  # NPM
  npm config set proxy $proxy
  npm config set https-proxy $proxy

  # Ruby
  export http_proxy="$proxy"
  export ALL_PROXY="$proxy"

  # Git
  git config --global http.proxy $proxy
}

function unsetProxies {
  # NPM
  npm config delete proxy
  npm config delete https-proxy

  # Ruby
  unset http_proxy
  unset ALL_PROXY

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
