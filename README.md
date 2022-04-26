# Magento Cloud Cli for Ci/Cd

Using latest PHP 7.4 on Alpine Linux

```yaml
  image: searge/magento-cloud-ci
  variables:
    DEPLOY_ENV: $CI_MERGE_REQUEST_TARGET_BRANCH_NAME

  before_script:
    - |
      # Variables:
      source /root/.bashrc
      DATE_=$(date +%d%m_%H%M)

      export MAGENTO_CLOUD_CLI_TOKEN="${MAGENTO_CLOUD_TOKEN}"

  script:
    - |
      # Dump from environment:
      echo "START THE DUMP"
      magento-cloud db:dump -z -f "${DEPLOY_ENV}-${DATE_}".sql.gz -p ${PROJECT} -e ${DEPLOY_ENV} -v
```
