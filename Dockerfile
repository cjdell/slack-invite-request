#
# Slack Invite Request Dockerfile
#
# https://github.com/cjdell/slack-invite-request
#

# Pull base image.
FROM ubuntu:14.04

# Install Slack Invite Request
RUN \
  apt-get update && \
  apt-get install -y git nodejs npm && \
  cd / && \
  git clone https://github.com/cjdell/slack-invite-request.git && \
  cd /slack-invite-request && \
  git pull && \
  npm install

# Add files.
ADD start.bash /sir-start

# Set environment variables.
ENV NODE_ENV production

# Define working directory.
WORKDIR /slack-invite-request

# Define default command.
CMD ["bash", "/sir-start"]

# Expose ports.
EXPOSE 3000
