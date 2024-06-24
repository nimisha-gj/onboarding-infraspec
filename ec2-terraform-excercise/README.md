## Providers
|Name|Version|
|---|--|
|aws|5.55.0|

## Resources

| Name | Type |
|------|------|
| [aws_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource|

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| AMI Id | Id of the AMI for the EC2 instance | `string` | n/a | yes 
| instance_type | | `string` |  | no |
| instance_name | | `string` |  | no |
| user | Name of the User creating the instance | `string` |  | no |
| region | regoin where the instance is to be created | `string` |  | no |

## Outputs
|Name| Description|
|----|------------|
|instance Id |The ID of the instance|
|instance public IP|The public IP address assigned to the instance. NOTE: If you are using an aws_eip with your instance|



