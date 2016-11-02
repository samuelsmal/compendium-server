#!/bin/bash
if [ -z "${GIT_REPO_SSH_KEY}" ]; then
    echo "Need to specify SSH key for accessing repo"
fi

echo "${GIT_REPO_SSH_KEY}" > /root/.ssh/id_rsa

chmod 600 /root/.ssh/id_rsa

echo "Retrieving content from: ${GIT_REPO}"
echo "Servering content from: ${CONTENT_FOLDER}"

supervisord -c /app/sphinx-supervisord.conf
