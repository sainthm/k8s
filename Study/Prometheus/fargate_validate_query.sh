
$ awscurl --region  --service aps "https://aps-workspaces.us-west-2.amazonaws.com/workspaces/workspace_id/api/v1/query?query=prometheus_api_remote_read_queries"

# {"status":"success","data":{"resultType":"vector","result":[{"metric":{"__name__":"prometheus_api_remote_read_queries","instance":"localhost:9090","job":"prometheus"},"value":[1648461236.419,"0"]}]}}21
      
