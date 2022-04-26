#!/bin/env bash

curl -sS https://accounts.magento.cloud/cli/installer | php

# BEGIN SNIPPET: Magento Cloud CLI configuration
echo 'export PATH="$HOME/".magento-cloud/bin:"$PATH"' >>/root/.bashrc
echo 'if [ -f "$HOME/.magento-cloud/shell-config.rc" ]; then . "$HOME/.magento-cloud/shell-config.rc"; fi' >>/root/.bashrc
source /root/.bashrc
