#!/bin/sh -x

# Simple script to:
#     - build VAMS front end
#     - build VAMS infrastructure
#     - deploy VAMS to AWS 
# 
# Expected setttings:
#
#     AWS_REGION=us-east-1
#     AWS_SECRET_ACCESS_KEY=<your-secret-key>
#     AWS_ACCESS_KEY_ID=<your-access-key>
#     STACK_NAME=test-1
#     ADMIN_EMAIL=<your-email-address>

VAMS_CONTAINER_DIR=/vams

# Validate required input variables
# (except AWS*SECRET_KEY* vars to avoid exposure)
function validate_env_vars() {
    if [[ -z "${AWS_REGION}" || \
          -z "${STACK_NAME}" || \
          -z "${ADMIN_EMAIL}" \
        ]]; then
        echo "One or more environment variables are undefined. Please set AWS_REGION, STACK_NAME, and ADMIN_EMAIL."
        exit 1
    fi
}

validate_env_vars


# Build VAMS front end
cd ${VAMS_CONTAINER_DIR}
npm run build

# Build VAMS infrastructure
cd ${VAMS_CONTAINER_DIR}/infra && \
npm install && \
cd ${VAMS_CONTAINER_DIR}

# Deploy VAMS to AWS.
npm run deploy.dev adminEmailAddress=${ADMIN_EMAIL}
# one

