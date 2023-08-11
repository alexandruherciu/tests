FROM alpine:3.16.2

# Install packages
RUN apk update && apk add --update --no-cache \
    curl \
    nodejs \
    npm \
    yarn \
    git

# AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm awscliv2.zip

# NPM
RUN npm config set unsafe-perm true && \
    npm update -g && \
    npm i -g esbuild

# CDK
RUN npm install -g aws-cdk

# Mount local dir with docker run -v .:/vams ...
WORKDIR /vams
COPY ./deploy-vams.sh /tmp/

ENTRYPOINT ["/tmp/deploy-vams.sh"]
