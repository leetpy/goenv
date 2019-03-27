#!/bin/bash

function check {
    if [ -z "$GOPATH" ]; then
        echo "Please set GOPATH environment"
        exit
    else
        echo $GOPATH
    fi
}

function install_golang_x {
    cd $GOPATH/src
    local x_pkg=(
        "tools"
        "lint"
        "net"
        "sys"
        "crypto"
        "text"
        "image"
        "oauth2"
    ) 

    for p in ${x_pkg[@]}
    do
        if [ ! -d $GOPATH/src/golang.org/x/$p ]; then
            git clone --depth 1 https://github.com/golang/$p.git golang.org/x/$p
            go install golang.org/x/$p
        fi
    done
}

function install {
    cd $GOPATH/src

    # golang_pkgs=(
    #     "golang.org/x/tools/cmd/guru"
    #     "golang.org/x/tools/cmd/gorename"
    #     "golang.org/x/tools/cmd/godoc"
    #     "golang.org/x/tools/cmd/goimports"
    #     "honnef.co/go/tools/..."
    # )

    github_pkg=(
        "github.com/nsf/gocode"
        "github.com/uudashr/gopkgs/cmd/gopkgs"
        "github.com/ramya-rao-a/go-outline"
        "github.com/acroca/go-symbols"
        "github.com/rogpeppe/godef"
        "github.com/zmb3/gogetdoc"
        "github.com/sqs/goreturns"
        "github.com/golang/lint/golint"
        "github.com/alecthomas/gometalinter"
        "github.com/derekparker/delve/cmd/dlv"
        "github.com/haya14busa/goplay/cmd/goplay"
        "github.com/josharian/impl"
        "github.com/tylerb/gotype-live"
        "github.com/cweill/gotests/..."
        "github.com/sourcegraph/go-langserver"
        "github.com/davidrjenni/reftools/cmd/fillstruct"
        "github.com/fatih/gomodifytags"
    )

    for p in ${github_pkg[@]}
    do
        go get -u -v $p
    done

}


check
install_golang_x
install
