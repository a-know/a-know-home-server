#!/bin/bash
# Copyright 2014 Google Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# Install and start the Google monitoring agent.
#
# Usage:
#
#   curl -O https://.../stack-install.sh
#   bash stack-install.sh [--api-key=...]
#
# The API key can be omitted on a GCE instance if it is available in the
# project metadata as the value of "stackdriver-agent-key".
#
# This script does the following:
#
#   1. Configure the required apt-get or yum repository.
#   2. Install the agent package.
#   3. Invoke /opt/stackdriver/stack-config to do the following:
#      a. Optionally configure the agent with the API key.
#      b. Start the agent services.
#

REPO_HOST=repo.stackdriver.com
APP_HOST=app.stackdriver.com

# Recent systems provide /etc/os-release. The ID variable defined therein
# is particularly useful for identifying Amazon Linux.
if [[ -f /etc/os-release ]]; then
  . /etc/os-release
fi

install_for_debian() {
  local CODENAME="$(lsb_release -sc)"

  curl -s -S -f -o /etc/apt/sources.list.d/stackdriver.list "https://${REPO_HOST}/${CODENAME}.list"
  curl -s -f https://${APP_HOST}/RPM-GPG-KEY-stackdriver | apt-key add -

  apt-get -q update

  # Install the agent package, without prompting for an API key.
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y -q install stackdriver-agent
}

install_for_redhat() {
  local VERSION_PRINTER='import platform; print(platform.dist()[1].split(".")[0])'
  local MAJOR_VERSION=$(python -c "${VERSION_PRINTER}")
  local REPO_URL="https://${REPO_HOST}/stackdriver-el${MAJOR_VERSION}.repo"

  curl -s -S -f -o /etc/yum.repos.d/stackdriver.repo "${REPO_URL}"
  yum -y -q install stackdriver-agent
}

install_for_amazon_linux() {
  local REPO_URL="https://${REPO_HOST}/stackdriver-amzn.repo"

  curl -s -S -f -o /etc/yum.repos.d/stackdriver.repo "${REPO_URL}"
  yum -y -q install stackdriver-agent
}

install() {
  case "${ID:-}" in
    amzn)
      echo 'Installing agents for Amazon Linux.'
      install_for_amazon_linux
      ;;
    debian|ubuntu)
      echo 'Installing agents for Debian or Ubuntu.'
      install_for_debian
      ;;
    rhel|centos)
      echo 'Installing agents for RHEL or CentOS.'
      install_for_redhat
      ;;
    *)
      # Fallback for systems lacking /etc/os-release.
      if [[ -f /etc/debian_version ]]; then
        echo 'Installing agents for Debian.'
        install_for_debian
      elif [[ -f /etc/redhat-release ]]; then
        echo 'Installing agents for Red Hat.'
        install_for_redhat
      else
        echo >&2 'Unidentifiable or unsupported platform.'
        exit 1
      fi
  esac
}

main() {
  if ! install; then
    echo >&2 'Installation failed.'
    exit 1
  fi

  /opt/stackdriver/stack-config "$@"
}

main "$@"
