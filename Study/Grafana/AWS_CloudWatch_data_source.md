# AWS CloudWatch data source

- Main URL: [Grafana Labs: AWS CloudWatch data source](https://grafana.com/docs/grafana/v8.4/datasources/aws-cloudwatch/)

<br>


### 선요약:

- **Grafana 는 GetMetricData API 를 통해, custom namespaces 를 갖고 오지 못한다고함**


<br>

## AWS CloudWatch data source


<br>

### Examples of IAM Policy:

- Metrics only
- Logs only
- Metrics and Logs

<br>


#### Metrics only

<br>



```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowReadingMetricsFromCloudWatch",
      "Effect": "Allow",
      "Action": [
        "cloudwatch:DescribeAlarmsForMetric",
        "cloudwatch:DescribeAlarmHistory",
        "cloudwatch:DescribeAlarms",
        "cloudwatch:ListMetrics",
        "cloudwatch:GetMetricData",
        "cloudwatch:GetInsightRuleReport"
      ],
      "Resource": "*"
    },
    {
      "Sid": "AllowReadingTagsInstancesRegionsFromEC2",
      "Effect": "Allow",
      "Action": ["ec2:DescribeTags", "ec2:DescribeInstances", "ec2:DescribeRegions"],
      "Resource": "*"
    },
    {
      "Sid": "AllowReadingResourcesForTags",
      "Effect": "Allow",
      "Action": "tag:GetResources",
      "Resource": "*"
    }
  ]
}
```


<br>


## Namespaces of Custom Metrics

- Grafana is not able to load custom namespaces through the GetMetricData API. 
- If you still want your custom metrics to show up in the fields in the query editor, you can specify the names of the namespaces containing the custom metrics in the Namespaces of Custom Metrics field. 
- The field accepts a multiple namespaces, separated by a comma.