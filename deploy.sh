action=$1

# light boot straping
# action variable required
# to trigger create or update

# set cfn action
if [ "$action" == "create" ]
then
    cfn_action='create-stack'
elif [ "$action" == "update" ]
then
    cfn_action='update-stack'
fi

stackname="code-build-lambda"
reponame="aws-sample-$stackname"

aws cloudformation $cfn_action \
    --stack-name $stackname \
    --template-body file://resources.yaml \
    --capabilities CAPABILITY_IAM \
    --parameters file://parameters.json