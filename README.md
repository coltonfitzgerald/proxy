# Developing while under a proxy
## Node JS / NPM
### Setting
```sh
$ npm config set proxy http://proxy.company.com:8080
$ npm config set https-proxy http://proxy.company.com:8080
```

### Removing

```sh
$ npm config unset proxy http://proxy.company.com:8080
$ npm config unset https-proxy http://proxy.company.com:8080
```

## Ruby
### Quick Use
```sh
$ gem install --http-proxy http://proxy.company.com:8080
```
### Setting
```sh
$ export http_proxy="http://example.proxy_name.com:80"
$ export ALL_PROXY="http://example.proxy_name.com:80"
```
### Removing
```sh
$ unset http_proxy
$ unset ALL_PROXY
```

## Git
### Setting
```sh
$ git config --global http.proxy http://proxy.company.com:8080
```

### Removing
```sh
$ git config --unset --global http.proxy
```

## Curl
### One Time Use
```sh
$ curl -x http://proxy.ccsd.net:8080 <command>
```

### Setting (Add to ~/.curlrc)
```sh
proxy = example.proxy_name.com:80
```

### Removing (Delete this line from ~/.curlrc)
```sh
proxy = example.proxy_name:80
```

##Bower (Add to bower.json)
```js
"search": [
    "http://localhost:8000",
    "https://bower.herokuapp.com"
  ]
```
