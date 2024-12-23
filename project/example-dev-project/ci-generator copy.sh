#!/bin/bash

# dir=$(find . -type d)

# check argument
if [ $# -ne 1 ]
then
  echo "Please check folder argumnet"
  echo "Usage: $0 <path>"
  exit 1
fi

ls | grep $1 >> /dev/null

# check correct path
if [ $? -eq 0 ]
then
  echo "Creating ci file below $1 folder"
else
  echo "Please check folder path that you want to create ci file"
  exit 1
fi

# creating ci file in each folder
dir=$(find $1 -type d)

for folder in $dir
do
if [ -e "$(find $folder -maxdepth 1 -name '*.tfvars')" ]
then

echo "Create gitlab-ci.yaml in $folder"
cat << EOF > $folder/.gitlab-ci.yml

# 공통 이미지 및 scripte 내용
default:
  image: 
    name: 'wotnek90/terraform-aws-cli:v1.3.7'
    entrypoint:
      - '/usr/bin/env'
      - 'PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'

# 공통 anchor 설정 
.aws-configure: &aws-configure-profile
  - mkdir ~/.aws/
  - printf "[default]\naws_access_key_id = %s\naws_secret_access_key = %s\n" \$AWS_ACCESS_KEY_ID \$AWS_SECRET_ACCESS_KEY > ~/.aws/credentials
  - printf "[default]\nregion = %s\noutput = json\n" \$AWS_DEFAULT_REGION > ~/.aws/config


.terraform-init: &terraform-init-module 
  - cd \${TF_DIR}
  - terraform init -reconfigure -get=true -upgrade

.common-feature: &common-feature
  # only:
  #   refs:
  #     - main
  allow_failure: false
  tags :
  #  - shared-runner
   - sdh-runner

.use-cache: &global_cache
  cache:
    - key: terraform
      paths:
        - \${TF_DIR}.terraform
      policy: pull-push
    

###############
# 공통 변수 값 설정
###############

variables:
  TF_DIR : "$folder"
  # TAGS   : "shared-runner"
  TAGS   : "sdh-runner"

###############
# CI Pipeline
###############

stages:
  - refresh
  - validate
  - plan
  - apply
  - destroy-plan
  - destroy

refresh:
  stage: refresh
  <<: *common-feature
  <<: *global_cache
  
  
  before_script:
    - *terraform-init-module
  script:
    - terraform refresh
  when: manual
  
  # allow_failure: false
  # only:
  #   refs:
  #     - main
  # tags:
  #   - '${TAGS}'

validate:
  stage: validate
  <<: *common-feature
  <<: *global_cache
  

  before_script:
    - *terraform-init-module
    - env
    - pwd
  script:
    - echo "$folder terraform validate"
    - terraform validate
  after_script:
    - ls \${TF_DIR}/.terraform
  
  # tags:
  #   - '${TAGS}'

plan:
  stage: plan
  <<: *common-feature
  <<: *global_cache
  

  before_script:
    - *terraform-init-module
    - terraform version
  script :
   - |
    echo "$folder terraform plan"
    terraform plan -refresh=false -out=planfile 
  after_script:
    - ls \${TF_DIR}/.terraform
    - pwd
  dependencies:
    - validate
  artifacts:
    paths:
      - \${TF_DIR}/planfile
  
  # tags:
  # - '${TAGS}'

apply:
  stage: apply
  <<: *common-feature
  <<: *global_cache
  

  before_script:
    - *terraform-init-module
  script:
    - terraform apply planfile
  dependencies:
    - plan
  when: manual # 수동으로 승인 시 주석 해제

.destroy-plan:
  stage: destroy-plan
  <<: *common-feature
  <<: *global_cache
  
  before_script:
    - *terraform-init-module
  script:
    - terraform plan -destroy
  dependencies:
    - validate

.destroy:
  stage: destroy
  <<: *common-feature
  <<: *global_cache
  

  before_script:
    - *terraform-init-module
  script:
    - terraform destroy -auto-approve
  needs:
    - destroy-plan
  when: manual
EOF

fi
done