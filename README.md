# Developing while under a proxy
##Node JS
npm config set proxy http://proxy.company.com:8080
npm config set https-proxy http://proxy.company.com:8080

npm config unset proxy http://proxy.company.com:8080
npm config unset https-proxy http://proxy.company.com:8080

##Ruby
gem install --http-proxy http://proxy.company.com:8080 *one time use*
export http_proxy="http://example.proxy_name.com:80"
export ALL_PROXY="http://example.proxy_name.com:80"

unset http_proxy
unset ALL_PROXY

##Git
git config --global http.proxy http://proxy.company.com:8080

git config --unset --global http.proxy

##Curl
curl -x http://proxy.ccsd.net:8080 <command> *one time use*
proxy = example.proxy_name.com:80 *Add this to your ~/.curlrc file*

remove proxy = example.proxy_name:80 from your ~/.curlrc file

##Bower
"search": [
    "http://localhost:8000",
    "https://bower.herokuapp.com"
  ] *add this to your .json file*
