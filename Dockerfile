FROM golang:alpine3.6

COPY . /slack8s

RUN apk update && \
    apk upgrade && \
    apk add git

RUN REPO_PATH="github.com/ultimateboy/slack8s" \
  && mkdir -p $GOPATH/src/${REPO_PATH} \
  && cp -r /slack8s/. $GOPATH/src/${REPO_PATH} \
  && rm -r /slack8s \
  && cd $GOPATH/src/${REPO_PATH} \
  && go get github.com/nlopes/slack \
  && go install


CMD slack8s