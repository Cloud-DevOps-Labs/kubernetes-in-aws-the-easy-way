# Secondary roles used in the workshop

These roles are defined and in the workshop

## eks-blueprints-for-terraform-workshop-admin

### Trust relationship
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": [
                    "codebuild.amazonaws.com",
                    "ec2.amazonaws.com"
                ]
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
```

### AdministratorAccess
arn:aws:iam::aws:policy/AdministratorAccess

## TeamRole

### Trust relationship
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": [
                    "codebuild.amazonaws.com",
                    "ec2.amazonaws.com"
                ]
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
```

### Limit policy
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Allow",
            "Effect": "Allow",
            "Action": [
                "cloud9:*",
                "lambda:*",
                "ecr:*",
                "codebuild:*",
                "cloudformation:*",
                "cloudwatch:*",
                "ec2:*",
                "elasticloadbalancing:*",
                "eks:*",
                "ecs:*",
                "kms:*",
                "logs:*",
                "s3:*",
                "ssm:*",
                "dynamodb:*",
                "iam:*",
                "autoscaling:*",
                "appmesh:*",
                "xray:*",
                "sns:*",
                "codepipeline:*",
                "fis:*",
                "schemas:ListDiscoverers",
                "sqs:*"
            ],
            "Resource": "*"
        },
        {
            "Sid": "Deny",
            "Effect": "Deny",
            "Action": [
                "iam:*AccessKey",
                "iam:*User*",
                "iam:*User",
                "ec2:Purchase*",
                "ec2:*CapacityReservation"
            ],
            "Resource": "*"
        }
    ]
}
```

### Team Default policy
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowIAMRO",
            "Effect": "Allow",
            "Action": [
                "iam:List*",
                "iam:Get*",
                "iam:Generate*",
                "sts:GetCallerIdentity"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "iam:CreateServiceLinkedRole",
            "Resource": "arn:aws:iam::*:role/aws-service-role/*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "iam:PassRole"
            ],
            "Resource": "arn:aws:iam::223350738655:role/TeamRole"
        },
        {
            "Sid": "DenyBlocklist",
            "Effect": "Deny",
            "Action": [
                "route53domains:*",
                "ec2:ModifyReservedInstances",
                "ec2:PurchaseHostReservation",
                "ec2:PurchaseReservedInstancesOffering",
                "ec2:PurchaseScheduledInstances",
                "rds:PurchaseReservedDBInstancesOffering",
                "dynamodb:PurchaseReservedCapacityOfferings",
                "s3:PutObjectLegalHold"
            ],
            "Resource": "*"
        },
        {
            "Sid": "DenyAllOutsideAllowedRegions",
            "Effect": "Deny",
            "NotAction": [
                "iam:*",
                "sts:*",
                "s3:*",
                "ds:*",
                "artifact:Get",
                "artifact:DownloadAgreement",
                "lightsail:*",
                "networkmanager:*",
                "braket:*",
                "quicksight:*",
                "cloudfront:*",
                "route53:*",
                "route53-recovery-cluster:*",
                "route53-recovery-control-config:*",
                "route53-recovery-readiness:*",
                "servicediscovery:*",
                "waf:*",
                "waf-regional:*",
                "wafv2:*",
                "cloudwatch:DescribeAlarms",
                "cloudwatch:PutMetricAlarm",
                "cloudwatch:DeleteAlarms",
                "cloudwatch:GetMetricStatistics",
                "ec2:Describe*",
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchGetImage",
                "ecr:BatchCheckLayerAvailability",
                "ecr:GetAuthorizationToken",
                "globalaccelerator:*",
                "acm:List*",
                "acm:Describe*",
                "kms:Describe*",
                "kms:ReEncrypt*",
                "kms:GenerateDataKey*",
                "kms:Get*",
                "kms:List*",
                "kms:CreateGrant",
                "kms:RevokeGrant",
                "ssm:List*",
                "directconnect:*"
            ],
            "Resource": "*",
            "Condition": {
                "StringNotEquals": {
                    "aws:RequestedRegion": [
                        "us-east-1"
                    ]
                }
            }
        }
    ]
}
```

### CFN Deny policy
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "cloudformation:CancelUpdateStack",
                "cloudformation:ContinueUpdateRollback",
                "cloudformation:CreateChangeSet",
                "cloudformation:DeleteStack",
                "cloudformation:GetTemplate",
                "cloudformation:GetTemplateSummary",
                "cloudformation:SetStackPolicy",
                "cloudformation:UpdateStack",
                "cloudformation:UpdateTerminationProtection"
            ],
            "Effect": "Deny",
            "Resource": "arn:aws:cloudformation:us-east-1:223350738655:stack/mod-3f05fe2b344a49cd/f2cdb560-daa5-11ed-b2af-1227c5ceb4fb"
        }
    ]
}
```

## OpsRole

### AdministratorAccess
arn:aws:iam::aws:policy/AdministratorAccess

### ops-default-policy
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "DenyBlocklist",
            "Effect": "Deny",
            "Action": [
                "route53domains:*",
                "ec2:ModifyReservedInstances",
                "ec2:PurchaseHostReservation",
                "ec2:PurchaseReservedInstancesOffering",
                "ec2:PurchaseScheduledInstances",
                "rds:PurchaseReservedDBInstancesOffering",
                "dynamodb:PurchaseReservedCapacityOfferings",
                "s3:PutObjectLegalHold"
            ],
            "Resource": "*"
        },
        {
            "Sid": "DenyAllOutsideAllowedRegions",
            "Effect": "Deny",
            "NotAction": [
                "iam:*",
                "sts:*",
                "s3:*",
                "ds:*",
                "artifact:Get",
                "artifact:DownloadAgreement",
                "lightsail:*",
                "networkmanager:*",
                "braket:*",
                "quicksight:*",
                "cloudfront:*",
                "route53:*",
                "route53-recovery-cluster:*",
                "route53-recovery-control-config:*",
                "route53-recovery-readiness:*",
                "servicediscovery:*",
                "waf:*",
                "waf-regional:*",
                "wafv2:*",
                "cloudwatch:DescribeAlarms",
                "cloudwatch:PutMetricAlarm",
                "cloudwatch:DeleteAlarms",
                "cloudwatch:GetMetricStatistics",
                "ec2:Describe*",
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchGetImage",
                "ecr:BatchCheckLayerAvailability",
                "ecr:GetAuthorizationToken",
                "globalaccelerator:*",
                "acm:List*",
                "acm:Describe*",
                "kms:Describe*",
                "kms:ReEncrypt*",
                "kms:GenerateDataKey*",
                "kms:Get*",
                "kms:List*",
                "kms:CreateGrant",
                "kms:RevokeGrant",
                "ssm:List*",
                "directconnect:*"
            ],
            "Resource": "*",
            "Condition": {
                "StringNotEquals": {
                    "aws:RequestedRegion": [
                        "us-east-1"
                    ]
                }
            }
        }
    ]
}
```

