GAE/Go Project Template
======================================================================

## Requirements

* Google Cloud SDK

## Setup

```
$ git clone https://github.com/takumakei/gae-go-project-template.git
$ cd gae-go-project-template
$ make go-get # 'go get -u' packages that are not under control of glide
$ make glide  # 'glide up' packages that are under control of glide
```

## Workflows

### Development

```
$ make run     # 'dev_appserver.py ...'
$ make test    # 'go test ...'
```

### Deployment

```
$ export PROJECT_ID="..."
$ make deploy  # 'gcloud app deploy --no-promote ...'
$ make promote # 'gcloud app deploy --promote ...'
```

## Exec a command with project enviroments

```
$ bin/env.sh go test -v ./src/...
```

or

```
$ eval $(bin/env.sh)
$ go test -v ./src/...
```

## Print make targets

```
$ make
    help: show this message
     run: run local dev server
    test: go test
  deploy: deploy --no-promote
 promote: deploy --promote
   glide: glide update
  go-get: go get -u (no-glide packages)
```

## LICENSE

MIT
