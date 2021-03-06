// Copyright (c) 2021, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;
import ballerina/jballerina.java as java;
import ballerina/jballerina.java.arrays as jarrays;

# Handles the HTTP response.
#
# + httpResponse - Http response or error
# + return - If successful returns `json` response. Else returns error.
isolated function handleResponse(http:Response|http:PayloadType|error httpResponse) returns @untainted xml|ResponseHandleFailed {
    if (httpResponse is http:Response) {
        if (httpResponse.statusCode == http:STATUS_NO_CONTENT){
            //If status 204, then no response body. So returns json boolean true.
            return error ResponseHandleFailed(NO_CONTENT_SET_WITH_RESPONSE_MSG);
        }
        var xmlResponse = httpResponse.getXmlPayload();
        if (xmlResponse is xml) {
            if (httpResponse.statusCode == http:STATUS_OK) {
                //If status is 200, request is successful. Returns resulting payload.
                return xmlResponse;
            } else {
                //If status is not 200 or 204, request is unsuccessful. Returns error.
                xmlns "http://queue.amazonaws.com/doc/2012-11-05/" as ns;
                string xmlResponseErrorCode = httpResponse.statusCode.toString();
                string responseErrorMessage = (xmlResponse/<ns:'error>/<ns:message>/*).toString();
                string errorMsg = STATUS_CODE + COLON_SYMBOL + xmlResponseErrorCode + 
                    SEMICOLON_SYMBOL + WHITE_SPACE + MESSAGE + COLON_SYMBOL + WHITE_SPACE + 
                    responseErrorMessage;
                return error ResponseHandleFailed(errorMsg);
            }
        } else {
                return error ResponseHandleFailed(RESPONSE_PAYLOAD_IS_NOT_XML_MSG);
        }
    } else if (httpResponse is http:PayloadType) {
        return error ResponseHandleFailed(UNREACHABLE_STATE);
    } else {
        return error ResponseHandleFailed(ERROR_OCCURRED_WHILE_INVOKING_REST_API_MSG, httpResponse);
    }
}

public function splitString(string str, string delimeter, int arrIndex) returns string {
    handle rec = java:fromString(str);
    handle del = java:fromString(delimeter);
    handle arr = split(rec, del);
    handle arrEle =  jarrays:get(arr, arrIndex);
    return arrEle.toString();
}
