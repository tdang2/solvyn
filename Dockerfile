# [START docker]
# Using the desired version of the docker python images https://hub.docker.com/_/python
FROM --platform=linux/amd64 python:3.11

# Configure git for SSH
RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
RUN git config --global url.ssh://git@github.com/.insteadOf https://github.com/

WORKDIR /app
ADD . /app
RUN echo $(python --version)
RUN pip install 'poetry==1.8.3'

RUN --mount=type=ssh,id=github_ssh_key poetry install
# [END docker]