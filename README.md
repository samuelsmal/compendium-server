# COMPENDIUM - A Sphinx-over-git-server using docker

## Purpose of this thingy here

It is a Docker image which fetches via `git` an external repository, which is
assumed to a Sphinx documentation (including a Makefile), builds it every few
minutes and serves it's content.

## Setup

1. Make build the documentation somewhere else.
2. Push the documentation to a git repository.
3. Build this image (`make build-image`).
4. Generate some ssh deployment keys for this server.
5. Run the container (`make run`).

## SSH deployment keys

You'll need to store them in `./git_repo_key`. Currently nothing else is
supported.  This key will then be given to the container on run-time as a
environment variable. (See `Makefile` for more information)

## Server settings

The server runs per default on `localhost:8000`. Check the `Makefile` if you
need to adjust something.

## How to setup the documentation

Check `doc` for an example regarding the actual documentation.

I adjusted the default build path for the html. You'll probably want to adjust
this. It currently is setup (in the container) like this:

```
root
└── app
    └── content
        ├── <HTML BUILD DIRECTORY>
        └── <CONTENT FOLDER OF GIT DOC REPO>
```

This can be adjusted in the `Makefile` of this repo. But it has to be aligned
with the `Makefile` of the Sphinx documentation.

## Credits

Thanks for Zalando Team for providing me with basic idea how get this running
(https://github.com/zalando/docker-sphinx-doc).
