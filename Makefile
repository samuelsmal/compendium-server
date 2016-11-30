IMAGE_NAME="compendium"
CONTAINER_NAME="compendium-server"

GIT_REPO="git@bitbucket.org:contovista/compendium.git"
HTML_DIRECTORY="build/html"
CONTENT_DIRECTORY="doc"

HOSTPORT=9999

.PHONY: build-image
build-image:
	docker build -t ${IMAGE_NAME} .

.PHONY: run
run:
	docker run -d -p ${HOSTPORT}:8000 \
		-e "GIT_REPO_SSH_KEY=`cat ./git_repo_key/id_rsa`" \
		-e "GIT_REPO=${GIT_REPO}" \
		-e "HTML_DIRECTORY=${HTML_DIRECTORY}" \
		-e "CONTENT_DIRECTORY=${CONTENT_DIRECTORY}" \
		--name ${CONTAINER_NAME} \
		${IMAGE_NAME}
