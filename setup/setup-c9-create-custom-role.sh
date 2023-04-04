

ROLENAME=eks-blueprints-for-terraform-workshop-admin

aws iam create-role \
    --role-name $ROLENAME

aws iam attach-role-policy \
    --policy-arn arn:aws:iam::aws:policy/AdministratorAccess \
    --role-name $ROLENAME
    


