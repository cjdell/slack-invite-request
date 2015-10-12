#
# Slack Invite Request Dockerfile
#
# https://github.com/cjdell/slack-invite-request
#

# Pull base image.
FROM dockerfile/ubuntu

# Install Slack Invite Request
RUN \
  curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash - && \
  apt-get update && \
  apt-get install -y git nodejs && \
  cd / && \
  git clone https://github.com/cjdell/slack-invite-request.git

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
