## Overview
Ballerina connector for Amazon SQS is connecting the Amazon SQS API via Ballerina language easily. It provides capability to perform operations related to queues and messages.

This module supports [Amazon SQS API](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/welcome.html) version 2012-11-05 and only allows to perform functions behalf of the currently logged in user.

This module supports Ballerina Swan Lake Beta 2 version

## Configuring connector
### Prerequisites
- AWS account
- Access to AWS Management Console

### Obtaining tokens

#### Signing Up for AWS

1. Navigate to [Amazon](https://aws.amazon.com), and then click `Create an AWS Account`.  

    **Note**: If you previously signed in to the AWS Management Console using the root user credentials of the AWS account, click `Sign in` to use a different account. If you previously signed in to the console using the IAM credentials, sign in using the credentials of the root account.

2. Click `Create a new AWS account` and follow the given instructions.  

Follow the method explained below to obtain AWS credentials.

#### Obtaining Access Key ID and Secret Access Key

1. Sign in to the AWS Management Console and open the IAM console at https://console.aws.amazon.com/iam/.
2. In the navigation pane, choose `Users`.
3. Choose the name of the user whose access keys you want to create, and then choose the `Security credentials` tab.
4. In the `Access keys` section, choose `Create access key`.
5. To view the new access key pair, choose `Show`. You will not have access to the secret access key again after this dialog box closes. Your credentials will look something like this:
    - Access key ID: AKIAIOSFODNN7EXAMPLE
    - Secret access key: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY  

    For more information please visit https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-setting-up.html 
6. Create Config.toml file in module-ballerinax-aws.sqs with the following configurations and provide appropriate value.
```ballerina
accessKeyId = "testAccessKeyValue"
secretAccessKey = "testSecretAccessKeyValue"
region = "testRegion"
accountNumber = "testAccountNumber"
```

## Quickstart

### Create a queue
#### Step 1: Import Amazon SQS module
First, import the ballerinax/aws.sqs module into the Ballerina project.
```ballerina
import ballerinax/aws.sqs;
```
#### Step 2: Initialize the AWS SQS Client giving necessary credentials

You can now enter the credentials in the SQS client configuration and create SQS client by passing the configuration:

```ballerina
sqs:Configuration configuration = {
    accessKey: "<ACCESS_KEY_ID>",
    secretKey: "<SECRET_ACCESS_KEY>",
    region: "<REGION>",
    accountNumber: "<ACCOUNT_NUMBER>"
};

sqs:Client sqsClient = check new (configuration);
```

#### Step 3: Create SQS Queue

You can create a queue in SQS as follows with `createQueue` method for a preferred queue name and the required set of attributes. Successful creation returns the created queue URL as a string and the error cases returns an `error` object.

```ballerina
map<string> attributes = {};
attributes["VisibilityTimeout"] = "400";
attributes["FifoQueue"] = "true";

string|error response = sqsClient->createQueue("demo.fifo", attributes);
if (response is string) {
    log:printInfo("Created queue URL: " + response);
}
```
## Snippets
Snippets of some operations.

- Create SQS Queue
    ``` ballerina
    map<string> attributes = {};
    attributes["VisibilityTimeout"] = "400";
    attributes["FifoQueue"] = "true";

    string response = check sqsClient->createQueue("demo.fifo", attributes);
    ```

- Send message to a SQS Queue
    ```ballerina
    map<string> attributes = {};
    attributes["MessageDeduplicationId"] = "duplicationID1";
    attributes["MessageGroupId"] = "groupID1";
    attributes["MessageAttribute.1.Name"] = "Name1";
    attributes["MessageAttribute.1.Value.StringValue"] = "Value1";
    attributes["MessageAttribute.1.Value.DataType"] = "String";
    attributes["MessageAttribute.2.Name"] = "Name2";
    attributes["MessageAttribute.2.Value.StringValue"] = "Value2";
    attributes["MessageAttribute.2.Value.DataType"] = "String";
    string queueUrl = "";

    sqs:OutboundMessage response = check sqsClient->sendMessage("Sample text message.", "/123456789012/demo.fifo",
        attributes);
    ```

- Delete SQS Queue
    ```ballerina
    error? response = sqsClient->deleteQueue("/123456789012/demo.fifo");
    ```

### [You can find more samples here](https://github.com/ballerina-platform/module-ballerinax-aws.sqs/tree/master/sqs/samples)
