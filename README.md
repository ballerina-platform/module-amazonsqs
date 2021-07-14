# Ballerina Amazon SQS Connector

[![Build Status](https://travis-ci.org/ballerina-platform/module-ballerinax-aws.sqs.svg?branch=master)](https://travis-ci.org/ballerina-platform/module-ballerinax-aws.sqs)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/module-ballerinax-aws.sqs.svg)](https://github.com/ballerina-platform/module-ballerinax-aws.sqs/commits/master)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

The `aws.sqs` is a [Ballerina](https://ballerina.io/) connector for Amazon SQS.

[Amazon SQS](https://aws.amazon.com/sqs/) is a message queuing service developed by Amazon.

This connector provides operations for connecting and interacting with Amazon SQS endpoints over the network. 
For more information about configuration and operations, go to the module. 
- [`aws.sqs`](https://docs.central.ballerina.io/ballerinax/aws.sqs/latest).

# Building from the Source
## Setting Up the Prerequisites

1. Download and install Java SE Development Kit (JDK) version 11 (from one of the following locations).

   * [Oracle](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html)

   * [OpenJDK](https://adoptopenjdk.net/)

        > **Note:** Set the JAVA_HOME environment variable to the path name of the directory into which you installed JDK.

2. Download and install [Ballerina Beta 2](https://ballerina.io/). 

## Building the Source
Execute the commands below to build from the source after installing Ballerina SL Beta 2 version.

1. To build the package:
    ```    
    bal build -c ./sqs
    ```
2. To run the without tests:
    ```
    bal build -c --skip-tests ./sqs
    ```
# Contributing to Ballerina
As an open source project, Ballerina welcomes contributions from the community. 

For more information, go to the [contribution guidelines](https://github.com/ballerina-platform/ballerina-lang/blob/main/CONTRIBUTING.md).

# Code of Conduct
All contributors are encouraged to read the [Ballerina Code of Conduct](https://ballerina.io/code-of-conduct).

# Useful Links
* Discuss about code changes of the Ballerina project in [ballerina-dev@googlegroups.com](mailto:ballerina-dev@googlegroups.com).
* Chat live with us via our [Slack channel](https://ballerina.io/community/slack/).
* Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
