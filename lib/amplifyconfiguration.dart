const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "api": {
        "plugins": {
            "awsAPIPlugin": {
                "amplifyDatasource": {
                    "endpointType": "GraphQL",
                    "endpoint": "https://3jgd4tz3qjeinkkushsyzb2oiu.appsync-api.ca-central-1.amazonaws.com/graphql",
                    "region": "ca-central-1",
                    "authorizationType": "API_KEY",
                    "apiKey": "da2-6c472emc6ne2rgrqtpfcsg6zzm"
                }
            }
        }
    },
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "AppSync": {
                    "Default": {
                        "ApiUrl": "https://3jgd4tz3qjeinkkushsyzb2oiu.appsync-api.ca-central-1.amazonaws.com/graphql",
                        "Region": "ca-central-1",
                        "AuthMode": "API_KEY",
                        "ApiKey": "da2-6c472emc6ne2rgrqtpfcsg6zzm",
                        "ClientDatabasePrefix": "amplifyDatasource_API_KEY"
                    }
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "ca-central-1:ec48d393-18b4-4aa3-8eb8-3517e12a5aca",
                            "Region": "ca-central-1"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "ca-central-1_LuH5RKQ6D",
                        "AppClientId": "4kb5ev3kf4t7s6u036k7m6k6ur",
                        "Region": "ca-central-1"
                    }
                },
                "Auth": {
                    "Default": {
                        "authenticationFlowType": "USER_SRP_AUTH"
                    }
                }
            }
        }
    }
}''';