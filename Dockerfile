#
# Slack Invite Request Dockerfile
#
# https://github.com/cjdell/slack-invite-request
#

# Pull base image.
FROM dockerfile/nodejs

# Install Slack Invite Request
RUN \
  apt-get update && \
  apt-get install git && \
  cd / && \
  git clone git@github.com:cjdell/slack-invite-request.git

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
