#!/bin/bash
export NAME=pedrops
export NAME_CLUSTER=$NAME.k8s.local
export KOPS_STATE_STORE=s3://$NAME
export bucket_name=pedrops-kops-state-store
##
aws s3api create-bucket \
--bucket ${bucket_name} \
--region us-east-1
##
aws s3api put-bucket-vxersioning --bucket ${bucket_name} --versioning-configuration Status=Enabled
##
kops create cluster \
--node-count=2 \
--node-size=t2.medium \
--zones=us-east-2a \
--name=${KOPS_CLUSTER_NAME}
