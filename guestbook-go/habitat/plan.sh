pkg_name=guestbook-go
pkg_origin=moretea
pkg_version=0.1.0
pkg_source="nope.gif"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_description="Facebook example guesbook"
pkg_deps=(core/go core/git)
pkg_expose=(3000)

do_download() {
  return 0
}

do_verify() {
  return 0
}

do_unpack() {
  return 0
}

do_configure() {
  return 0
}

do_build() {
  export GOPATH=`pwd`/gopath
  mkdir -p $GOPATH
  cd $GOPATH

  go get github.com/codegangsta/negroni
  go get github.com/gorilla/mux
  go get github.com/xyproto/simpleredis
  cp $HAB_BUILD_CONTEXT/src/src/main.go .

  go build main.go
}

do_install() {
  mkdir -p $pkg_prefix/bin
  mkdir -p $pkg_prefix/var/web/public
  cp $GOPATH/main $pkg_prefix/bin/guestbook
  cp -r $HAB_BUILD_CONTEXT/src/src/public/* $pkg_prefix/var/web/public
}
