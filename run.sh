#!/bin/bash

# Environmental variables for tcnksm/ghr (passed from wercker.yml)
VERSION="$WERCKER_GHR_VERSION"
INPUT="$WERCKER_GHR_INPUT"
OPT="$WERCKER_GHR_OPT"

# If not version is not supplied,
# we use `pre-release` tag and relase as prelesease on Github Release
if [ -z "${VERSION}" ]; then
    info "no version was supplied; using pre-release as version"
    VERSION="pre-release"
fi

OWNER=${OWNER:-$WERCKER_GIT_OWNER}

$WERCKER_STEP_ROOT/bin/ghr -v

$WERCKER_STEP_ROOT/bin/ghr \
    --replace --delete --prerelase \
    ${VERSION} ${INPUT}
