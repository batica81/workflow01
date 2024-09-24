# Step 1: Choose a base image (Ubuntu in this case)
FROM ubuntu:24.04

# Step 2: Update the package list and install any packages you need
RUN apt-get update && \
    apt-get install -y curl vim git python3.12 pip\
    && apt-get clean

# Step 3: Set environment variables (optional)
ENV DEBIAN_FRONTEND_TEST=noninteractive

# Step 4: (Optional) Add any custom scripts, files, or configurations
COPY my_script.sh /usr/local/bin/my_script.sh
RUN chmod +x /usr/local/bin/my_script.sh

# Step 5: Set the default command (optional)
CMD ["bash"]

ENV NODE_VERSION=20.14.0
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
RUN node --version
RUN npm --version

RUN pip3 install serial --break-system-packages

RUN mkdir samplerepo

COPY package.json /samplerepo/package.json
COPY yarn.lock /samplerepo/yarn.lock

RUN npm install yarn -g

WORKDIR samplerepo
RUN yarn install
