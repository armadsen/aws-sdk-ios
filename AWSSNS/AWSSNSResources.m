//
// Copyright 2010-2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSSNSResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSSNSResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSSNSResources

+ (instancetype)sharedInstance {
    static AWSSNSResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSSNSResources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSDDLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"apiVersion\":\"2010-03-31\",\
    \"endpointPrefix\":\"sns\",\
    \"protocol\":\"query\",\
    \"serviceAbbreviation\":\"Amazon SNS\",\
    \"serviceFullName\":\"Amazon Simple Notification Service\",\
    \"serviceId\":\"SNS\",\
    \"signatureVersion\":\"v4\",\
    \"uid\":\"sns-2010-03-31\",\
    \"xmlNamespace\":\"http://sns.amazonaws.com/doc/2010-03-31/\"\
  },\
  \"operations\":{\
    \"AddPermission\":{\
      \"name\":\"AddPermission\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AddPermissionInput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Adds a statement to a topic's access control policy, granting access for the specified AWS accounts to the specified actions.</p>\"\
    },\
    \"CheckIfPhoneNumberIsOptedOut\":{\
      \"name\":\"CheckIfPhoneNumberIsOptedOut\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CheckIfPhoneNumberIsOptedOutInput\"},\
      \"output\":{\
        \"shape\":\"CheckIfPhoneNumberIsOptedOutResponse\",\
        \"resultWrapper\":\"CheckIfPhoneNumberIsOptedOutResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ThrottledException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"InvalidParameterException\"}\
      ],\
      \"documentation\":\"<p>Accepts a phone number and indicates whether the phone holder has opted out of receiving SMS messages from your account. You cannot send SMS messages to a number that is opted out.</p> <p>To resume sending messages, you can opt in the number by using the <code>OptInPhoneNumber</code> action.</p>\"\
    },\
    \"ConfirmSubscription\":{\
      \"name\":\"ConfirmSubscription\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ConfirmSubscriptionInput\"},\
      \"output\":{\
        \"shape\":\"ConfirmSubscriptionResponse\",\
        \"resultWrapper\":\"ConfirmSubscriptionResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"SubscriptionLimitExceededException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"FilterPolicyLimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Verifies an endpoint owner's intent to receive messages by validating the token sent to the endpoint by an earlier <code>Subscribe</code> action. If the token is valid, the action creates a new subscription and returns its Amazon Resource Name (ARN). This call requires an AWS signature only when the <code>AuthenticateOnUnsubscribe</code> flag is set to \\\"true\\\".</p>\"\
    },\
    \"CreatePlatformApplication\":{\
      \"name\":\"CreatePlatformApplication\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreatePlatformApplicationInput\"},\
      \"output\":{\
        \"shape\":\"CreatePlatformApplicationResponse\",\
        \"resultWrapper\":\"CreatePlatformApplicationResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"}\
      ],\
      \"documentation\":\"<p>Creates a platform application object for one of the supported push notification services, such as APNS and GCM (Firebase Cloud Messaging), to which devices and mobile apps may register. You must specify <code>PlatformPrincipal</code> and <code>PlatformCredential</code> attributes when using the <code>CreatePlatformApplication</code> action.</p> <p> <code>PlatformPrincipal</code> and <code>PlatformCredential</code> are received from the notification service.</p> <ul> <li> <p>For <code>ADM</code>, <code>PlatformPrincipal</code> is <code>client id</code> and <code>PlatformCredential</code> is <code>client secret</code>.</p> </li> <li> <p>For <code>Baidu</code>, <code>PlatformPrincipal</code> is <code>API key</code> and <code>PlatformCredential</code> is <code>secret key</code>.</p> </li> <li> <p>For <code>APNS</code> and <code>APNS_SANDBOX</code>, <code>PlatformPrincipal</code> is <code>SSL certificate</code> and <code>PlatformCredential</code> is <code>private key</code>.</p> </li> <li> <p>For <code>GCM</code> (Firebase Cloud Messaging), there is no <code>PlatformPrincipal</code> and the <code>PlatformCredential</code> is <code>API key</code>.</p> </li> <li> <p>For <code>MPNS</code>, <code>PlatformPrincipal</code> is <code>TLS certificate</code> and <code>PlatformCredential</code> is <code>private key</code>.</p> </li> <li> <p>For <code>WNS</code>, <code>PlatformPrincipal</code> is <code>Package Security Identifier</code> and <code>PlatformCredential</code> is <code>secret key</code>.</p> </li> </ul> <p>You can use the returned <code>PlatformApplicationArn</code> as an attribute for the <code>CreatePlatformEndpoint</code> action.</p>\"\
    },\
    \"CreatePlatformEndpoint\":{\
      \"name\":\"CreatePlatformEndpoint\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreatePlatformEndpointInput\"},\
      \"output\":{\
        \"shape\":\"CreateEndpointResponse\",\
        \"resultWrapper\":\"CreatePlatformEndpointResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Creates an endpoint for a device and mobile app on one of the supported push notification services, such as GCM (Firebase Cloud Messaging) and APNS. <code>CreatePlatformEndpoint</code> requires the <code>PlatformApplicationArn</code> that is returned from <code>CreatePlatformApplication</code>. You can use the returned <code>EndpointArn</code> to send a message to a mobile app or by the <code>Subscribe</code> action for subscription to a topic. The <code>CreatePlatformEndpoint</code> action is idempotent, so if the requester already owns an endpoint with the same device token and attributes, that endpoint's ARN is returned without creating a new endpoint. For more information, see <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html\\\">Using Amazon SNS Mobile Push Notifications</a>. </p> <p>When using <code>CreatePlatformEndpoint</code> with Baidu, two attributes must be provided: ChannelId and UserId. The token field must also contain the ChannelId. For more information, see <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePushBaiduEndpoint.html\\\">Creating an Amazon SNS Endpoint for Baidu</a>. </p>\"\
    },\
    \"CreateTopic\":{\
      \"name\":\"CreateTopic\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateTopicInput\"},\
      \"output\":{\
        \"shape\":\"CreateTopicResponse\",\
        \"resultWrapper\":\"CreateTopicResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TopicLimitExceededException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"InvalidSecurityException\"},\
        {\"shape\":\"TagLimitExceededException\"},\
        {\"shape\":\"StaleTagException\"},\
        {\"shape\":\"TagPolicyException\"},\
        {\"shape\":\"ConcurrentAccessException\"}\
      ],\
      \"documentation\":\"<p>Creates a topic to which notifications can be published. Users can create at most 100,000 standard topics (at most 1,000 FIFO topics). For more information, see <a href=\\\"http://aws.amazon.com/sns/\\\">https://aws.amazon.com/sns</a>. This action is idempotent, so if the requester already owns a topic with the specified name, that topic's ARN is returned without creating a new topic.</p>\"\
    },\
    \"DeleteEndpoint\":{\
      \"name\":\"DeleteEndpoint\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteEndpointInput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"}\
      ],\
      \"documentation\":\"<p>Deletes the endpoint for a device and mobile app from Amazon SNS. This action is idempotent. For more information, see <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html\\\">Using Amazon SNS Mobile Push Notifications</a>. </p> <p>When you delete an endpoint that is also subscribed to a topic, then you must also unsubscribe the endpoint from the topic.</p>\"\
    },\
    \"DeletePlatformApplication\":{\
      \"name\":\"DeletePlatformApplication\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeletePlatformApplicationInput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"}\
      ],\
      \"documentation\":\"<p>Deletes a platform application object for one of the supported push notification services, such as APNS and GCM (Firebase Cloud Messaging). For more information, see <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html\\\">Using Amazon SNS Mobile Push Notifications</a>. </p>\"\
    },\
    \"DeleteTopic\":{\
      \"name\":\"DeleteTopic\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteTopicInput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"StaleTagException\"},\
        {\"shape\":\"TagPolicyException\"},\
        {\"shape\":\"ConcurrentAccessException\"}\
      ],\
      \"documentation\":\"<p>Deletes a topic and all its subscriptions. Deleting a topic might prevent some messages previously sent to the topic from being delivered to subscribers. This action is idempotent, so deleting a topic that does not exist does not result in an error.</p>\"\
    },\
    \"GetEndpointAttributes\":{\
      \"name\":\"GetEndpointAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetEndpointAttributesInput\"},\
      \"output\":{\
        \"shape\":\"GetEndpointAttributesResponse\",\
        \"resultWrapper\":\"GetEndpointAttributesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the endpoint attributes for a device on one of the supported push notification services, such as GCM (Firebase Cloud Messaging) and APNS. For more information, see <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html\\\">Using Amazon SNS Mobile Push Notifications</a>. </p>\"\
    },\
    \"GetPlatformApplicationAttributes\":{\
      \"name\":\"GetPlatformApplicationAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetPlatformApplicationAttributesInput\"},\
      \"output\":{\
        \"shape\":\"GetPlatformApplicationAttributesResponse\",\
        \"resultWrapper\":\"GetPlatformApplicationAttributesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the attributes of the platform application object for the supported push notification services, such as APNS and GCM (Firebase Cloud Messaging). For more information, see <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html\\\">Using Amazon SNS Mobile Push Notifications</a>. </p>\"\
    },\
    \"GetSMSAttributes\":{\
      \"name\":\"GetSMSAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetSMSAttributesInput\"},\
      \"output\":{\
        \"shape\":\"GetSMSAttributesResponse\",\
        \"resultWrapper\":\"GetSMSAttributesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ThrottledException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"InvalidParameterException\"}\
      ],\
      \"documentation\":\"<p>Returns the settings for sending SMS messages from your account.</p> <p>These settings are set with the <code>SetSMSAttributes</code> action.</p>\"\
    },\
    \"GetSubscriptionAttributes\":{\
      \"name\":\"GetSubscriptionAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetSubscriptionAttributesInput\"},\
      \"output\":{\
        \"shape\":\"GetSubscriptionAttributesResponse\",\
        \"resultWrapper\":\"GetSubscriptionAttributesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"AuthorizationErrorException\"}\
      ],\
      \"documentation\":\"<p>Returns all of the properties of a subscription.</p>\"\
    },\
    \"GetTopicAttributes\":{\
      \"name\":\"GetTopicAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetTopicAttributesInput\"},\
      \"output\":{\
        \"shape\":\"GetTopicAttributesResponse\",\
        \"resultWrapper\":\"GetTopicAttributesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"InvalidSecurityException\"}\
      ],\
      \"documentation\":\"<p>Returns all of the properties of a topic. Topic properties returned might differ based on the authorization of the user.</p>\"\
    },\
    \"ListEndpointsByPlatformApplication\":{\
      \"name\":\"ListEndpointsByPlatformApplication\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListEndpointsByPlatformApplicationInput\"},\
      \"output\":{\
        \"shape\":\"ListEndpointsByPlatformApplicationResponse\",\
        \"resultWrapper\":\"ListEndpointsByPlatformApplicationResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Lists the endpoints and endpoint attributes for devices in a supported push notification service, such as GCM (Firebase Cloud Messaging) and APNS. The results for <code>ListEndpointsByPlatformApplication</code> are paginated and return a limited list of endpoints, up to 100. If additional records are available after the first page results, then a NextToken string will be returned. To receive the next page, you call <code>ListEndpointsByPlatformApplication</code> again using the NextToken string received from the previous call. When there are no more records to return, NextToken will be null. For more information, see <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html\\\">Using Amazon SNS Mobile Push Notifications</a>. </p> <p>This action is throttled at 30 transactions per second (TPS).</p>\"\
    },\
    \"ListPhoneNumbersOptedOut\":{\
      \"name\":\"ListPhoneNumbersOptedOut\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListPhoneNumbersOptedOutInput\"},\
      \"output\":{\
        \"shape\":\"ListPhoneNumbersOptedOutResponse\",\
        \"resultWrapper\":\"ListPhoneNumbersOptedOutResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ThrottledException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"InvalidParameterException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of phone numbers that are opted out, meaning you cannot send SMS messages to them.</p> <p>The results for <code>ListPhoneNumbersOptedOut</code> are paginated, and each page returns up to 100 phone numbers. If additional phone numbers are available after the first page of results, then a <code>NextToken</code> string will be returned. To receive the next page, you call <code>ListPhoneNumbersOptedOut</code> again using the <code>NextToken</code> string received from the previous call. When there are no more records to return, <code>NextToken</code> will be null.</p>\"\
    },\
    \"ListPlatformApplications\":{\
      \"name\":\"ListPlatformApplications\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListPlatformApplicationsInput\"},\
      \"output\":{\
        \"shape\":\"ListPlatformApplicationsResponse\",\
        \"resultWrapper\":\"ListPlatformApplicationsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"}\
      ],\
      \"documentation\":\"<p>Lists the platform application objects for the supported push notification services, such as APNS and GCM (Firebase Cloud Messaging). The results for <code>ListPlatformApplications</code> are paginated and return a limited list of applications, up to 100. If additional records are available after the first page results, then a NextToken string will be returned. To receive the next page, you call <code>ListPlatformApplications</code> using the NextToken string received from the previous call. When there are no more records to return, <code>NextToken</code> will be null. For more information, see <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html\\\">Using Amazon SNS Mobile Push Notifications</a>. </p> <p>This action is throttled at 15 transactions per second (TPS).</p>\"\
    },\
    \"ListSubscriptions\":{\
      \"name\":\"ListSubscriptions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListSubscriptionsInput\"},\
      \"output\":{\
        \"shape\":\"ListSubscriptionsResponse\",\
        \"resultWrapper\":\"ListSubscriptionsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of the requester's subscriptions. Each call returns a limited list of subscriptions, up to 100. If there are more subscriptions, a <code>NextToken</code> is also returned. Use the <code>NextToken</code> parameter in a new <code>ListSubscriptions</code> call to get further results.</p> <p>This action is throttled at 30 transactions per second (TPS).</p>\"\
    },\
    \"ListSubscriptionsByTopic\":{\
      \"name\":\"ListSubscriptionsByTopic\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListSubscriptionsByTopicInput\"},\
      \"output\":{\
        \"shape\":\"ListSubscriptionsByTopicResponse\",\
        \"resultWrapper\":\"ListSubscriptionsByTopicResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"AuthorizationErrorException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of the subscriptions to a specific topic. Each call returns a limited list of subscriptions, up to 100. If there are more subscriptions, a <code>NextToken</code> is also returned. Use the <code>NextToken</code> parameter in a new <code>ListSubscriptionsByTopic</code> call to get further results.</p> <p>This action is throttled at 30 transactions per second (TPS).</p>\"\
    },\
    \"ListTagsForResource\":{\
      \"name\":\"ListTagsForResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTagsForResourceRequest\"},\
      \"output\":{\
        \"shape\":\"ListTagsForResourceResponse\",\
        \"resultWrapper\":\"ListTagsForResourceResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TagPolicyException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"ConcurrentAccessException\"}\
      ],\
      \"documentation\":\"<p>List all tags added to the specified Amazon SNS topic. For an overview, see <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/sns-tags.html\\\">Amazon SNS Tags</a> in the <i>Amazon Simple Notification Service Developer Guide</i>.</p>\"\
    },\
    \"ListTopics\":{\
      \"name\":\"ListTopics\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTopicsInput\"},\
      \"output\":{\
        \"shape\":\"ListTopicsResponse\",\
        \"resultWrapper\":\"ListTopicsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of the requester's topics. Each call returns a limited list of topics, up to 100. If there are more topics, a <code>NextToken</code> is also returned. Use the <code>NextToken</code> parameter in a new <code>ListTopics</code> call to get further results.</p> <p>This action is throttled at 30 transactions per second (TPS).</p>\"\
    },\
    \"OptInPhoneNumber\":{\
      \"name\":\"OptInPhoneNumber\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"OptInPhoneNumberInput\"},\
      \"output\":{\
        \"shape\":\"OptInPhoneNumberResponse\",\
        \"resultWrapper\":\"OptInPhoneNumberResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ThrottledException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"InvalidParameterException\"}\
      ],\
      \"documentation\":\"<p>Use this request to opt in a phone number that is opted out, which enables you to resume sending SMS messages to the number.</p> <p>You can opt in a phone number only once every 30 days.</p>\"\
    },\
    \"Publish\":{\
      \"name\":\"Publish\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PublishInput\"},\
      \"output\":{\
        \"shape\":\"PublishResponse\",\
        \"resultWrapper\":\"PublishResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"EndpointDisabledException\"},\
        {\"shape\":\"PlatformApplicationDisabledException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"KMSDisabledException\"},\
        {\"shape\":\"KMSInvalidStateException\"},\
        {\"shape\":\"KMSNotFoundException\"},\
        {\"shape\":\"KMSOptInRequired\"},\
        {\"shape\":\"KMSThrottlingException\"},\
        {\"shape\":\"KMSAccessDeniedException\"},\
        {\"shape\":\"InvalidSecurityException\"}\
      ],\
      \"documentation\":\"<p>Sends a message to an Amazon SNS topic, a text message (SMS message) directly to a phone number, or a message to a mobile platform endpoint (when you specify the <code>TargetArn</code>).</p> <p>If you send a message to a topic, Amazon SNS delivers the message to each endpoint that is subscribed to the topic. The format of the message depends on the notification protocol for each subscribed endpoint.</p> <p>When a <code>messageId</code> is returned, the message has been saved and Amazon SNS will attempt to deliver it shortly.</p> <p>To use the <code>Publish</code> action for sending a message to a mobile endpoint, such as an app on a Kindle device or mobile phone, you must specify the EndpointArn for the TargetArn parameter. The EndpointArn is returned when making a call with the <code>CreatePlatformEndpoint</code> action. </p> <p>For more information about formatting messages, see <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/mobile-push-send-custommessage.html\\\">Send Custom Platform-Specific Payloads in Messages to Mobile Devices</a>. </p> <important> <p>You can publish messages only to topics and endpoints in the same AWS Region.</p> </important>\"\
    },\
    \"RemovePermission\":{\
      \"name\":\"RemovePermission\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RemovePermissionInput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Removes a statement from a topic's access control policy.</p>\"\
    },\
    \"SetEndpointAttributes\":{\
      \"name\":\"SetEndpointAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetEndpointAttributesInput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Sets the attributes for an endpoint for a device on one of the supported push notification services, such as GCM (Firebase Cloud Messaging) and APNS. For more information, see <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html\\\">Using Amazon SNS Mobile Push Notifications</a>. </p>\"\
    },\
    \"SetPlatformApplicationAttributes\":{\
      \"name\":\"SetPlatformApplicationAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetPlatformApplicationAttributesInput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Sets the attributes of the platform application object for the supported push notification services, such as APNS and GCM (Firebase Cloud Messaging). For more information, see <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html\\\">Using Amazon SNS Mobile Push Notifications</a>. For information on configuring attributes for message delivery status, see <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/sns-msg-status.html\\\">Using Amazon SNS Application Attributes for Message Delivery Status</a>. </p>\"\
    },\
    \"SetSMSAttributes\":{\
      \"name\":\"SetSMSAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetSMSAttributesInput\"},\
      \"output\":{\
        \"shape\":\"SetSMSAttributesResponse\",\
        \"resultWrapper\":\"SetSMSAttributesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottledException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"}\
      ],\
      \"documentation\":\"<p>Use this request to set the default settings for sending SMS messages and receiving daily SMS usage reports.</p> <p>You can override some of these settings for a single message when you use the <code>Publish</code> action with the <code>MessageAttributes.entry.N</code> parameter. For more information, see <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/sms_publish-to-phone.html\\\">Publishing to a mobile phone</a> in the <i>Amazon SNS Developer Guide</i>.</p> <note> <p>To use this operation, you must grant the Amazon SNS service principal (<code>sns.amazonaws.com</code>) permission to perform the <code>s3:ListBucket</code> action. </p> </note>\"\
    },\
    \"SetSubscriptionAttributes\":{\
      \"name\":\"SetSubscriptionAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetSubscriptionAttributesInput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"FilterPolicyLimitExceededException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"AuthorizationErrorException\"}\
      ],\
      \"documentation\":\"<p>Allows a subscription owner to set an attribute of the subscription to a new value.</p>\"\
    },\
    \"SetTopicAttributes\":{\
      \"name\":\"SetTopicAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetTopicAttributesInput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"InvalidSecurityException\"}\
      ],\
      \"documentation\":\"<p>Allows a topic owner to set an attribute of the topic to a new value.</p>\"\
    },\
    \"Subscribe\":{\
      \"name\":\"Subscribe\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SubscribeInput\"},\
      \"output\":{\
        \"shape\":\"SubscribeResponse\",\
        \"resultWrapper\":\"SubscribeResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"SubscriptionLimitExceededException\"},\
        {\"shape\":\"FilterPolicyLimitExceededException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"InvalidSecurityException\"}\
      ],\
      \"documentation\":\"<p>Subscribes an endpoint to an Amazon SNS topic. If the endpoint type is HTTP/S or email, or if the endpoint and the topic are not in the same AWS account, the endpoint owner must run the <code>ConfirmSubscription</code> action to confirm the subscription.</p> <p>You call the <code>ConfirmSubscription</code> action with the token from the subscription response. Confirmation tokens are valid for three days.</p> <p>This action is throttled at 100 transactions per second (TPS).</p>\"\
    },\
    \"TagResource\":{\
      \"name\":\"TagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"TagResourceRequest\"},\
      \"output\":{\
        \"shape\":\"TagResourceResponse\",\
        \"resultWrapper\":\"TagResourceResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TagLimitExceededException\"},\
        {\"shape\":\"StaleTagException\"},\
        {\"shape\":\"TagPolicyException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"ConcurrentAccessException\"}\
      ],\
      \"documentation\":\"<p>Add tags to the specified Amazon SNS topic. For an overview, see <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/sns-tags.html\\\">Amazon SNS Tags</a> in the <i>Amazon SNS Developer Guide</i>.</p> <p>When you use topic tags, keep the following guidelines in mind:</p> <ul> <li> <p>Adding more than 50 tags to a topic isn't recommended.</p> </li> <li> <p>Tags don't have any semantic meaning. Amazon SNS interprets tags as character strings.</p> </li> <li> <p>Tags are case-sensitive.</p> </li> <li> <p>A new tag with a key identical to that of an existing tag overwrites the existing tag.</p> </li> <li> <p>Tagging actions are limited to 10 TPS per AWS account, per AWS region. If your application requires a higher throughput, file a <a href=\\\"https://console.aws.amazon.com/support/home#/case/create?issueType=technical\\\">technical support request</a>.</p> </li> </ul>\"\
    },\
    \"Unsubscribe\":{\
      \"name\":\"Unsubscribe\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UnsubscribeInput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InvalidSecurityException\"}\
      ],\
      \"documentation\":\"<p>Deletes a subscription. If the subscription requires authentication for deletion, only the owner of the subscription or the topic's owner can unsubscribe, and an AWS signature is required. If the <code>Unsubscribe</code> call does not require authentication and the requester is not the subscription owner, a final cancellation message is delivered to the endpoint, so that the endpoint owner can easily resubscribe to the topic if the <code>Unsubscribe</code> request was unintended.</p> <p>This action is throttled at 100 transactions per second (TPS).</p>\"\
    },\
    \"UntagResource\":{\
      \"name\":\"UntagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UntagResourceRequest\"},\
      \"output\":{\
        \"shape\":\"UntagResourceResponse\",\
        \"resultWrapper\":\"UntagResourceResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TagLimitExceededException\"},\
        {\"shape\":\"StaleTagException\"},\
        {\"shape\":\"TagPolicyException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"ConcurrentAccessException\"}\
      ],\
      \"documentation\":\"<p>Remove tags from the specified Amazon SNS topic. For an overview, see <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/sns-tags.html\\\">Amazon SNS Tags</a> in the <i>Amazon SNS Developer Guide</i>.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"ActionsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"action\"}\
    },\
    \"AddPermissionInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TopicArn\",\
        \"Label\",\
        \"AWSAccountId\",\
        \"ActionName\"\
      ],\
      \"members\":{\
        \"TopicArn\":{\
          \"shape\":\"topicARN\",\
          \"documentation\":\"<p>The ARN of the topic whose access control policy you wish to modify.</p>\"\
        },\
        \"Label\":{\
          \"shape\":\"label\",\
          \"documentation\":\"<p>A unique identifier for the new policy statement.</p>\"\
        },\
        \"AWSAccountId\":{\
          \"shape\":\"DelegatesList\",\
          \"documentation\":\"<p>The AWS account IDs of the users (principals) who will be given access to the specified actions. The users must have AWS accounts, but do not need to be signed up for this service.</p>\"\
        },\
        \"ActionName\":{\
          \"shape\":\"ActionsList\",\
          \"documentation\":\"<p>The action you want to allow for the specified principal(s).</p> <p>Valid values: Any Amazon SNS action name, for example <code>Publish</code>.</p>\"\
        }\
      }\
    },\
    \"AmazonResourceName\":{\
      \"type\":\"string\",\
      \"max\":1011,\
      \"min\":1\
    },\
    \"AuthorizationErrorException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>Indicates that the user has been denied access to the requested resource.</p>\",\
      \"error\":{\
        \"code\":\"AuthorizationError\",\
        \"httpStatusCode\":403,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"Binary\":{\"type\":\"blob\"},\
    \"CheckIfPhoneNumberIsOptedOutInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"phoneNumber\"],\
      \"members\":{\
        \"phoneNumber\":{\
          \"shape\":\"PhoneNumber\",\
          \"documentation\":\"<p>The phone number for which you want to check the opt out status.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the <code>CheckIfPhoneNumberIsOptedOut</code> action.</p>\"\
    },\
    \"CheckIfPhoneNumberIsOptedOutResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"isOptedOut\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>Indicates whether the phone number is opted out:</p> <ul> <li> <p> <code>true</code> â The phone number is opted out, meaning you cannot publish SMS messages to it.</p> </li> <li> <p> <code>false</code> â The phone number is opted in, meaning you can publish SMS messages to it.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>The response from the <code>CheckIfPhoneNumberIsOptedOut</code> action.</p>\"\
    },\
    \"ConcurrentAccessException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>Can't perform multiple operations on a tag simultaneously. Perform the operations sequentially.</p>\",\
      \"error\":{\
        \"code\":\"ConcurrentAccess\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"ConfirmSubscriptionInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TopicArn\",\
        \"Token\"\
      ],\
      \"members\":{\
        \"TopicArn\":{\
          \"shape\":\"topicARN\",\
          \"documentation\":\"<p>The ARN of the topic for which you wish to confirm a subscription.</p>\"\
        },\
        \"Token\":{\
          \"shape\":\"token\",\
          \"documentation\":\"<p>Short-lived token sent to an endpoint during the <code>Subscribe</code> action.</p>\"\
        },\
        \"AuthenticateOnUnsubscribe\":{\
          \"shape\":\"authenticateOnUnsubscribe\",\
          \"documentation\":\"<p>Disallows unauthenticated unsubscribes of the subscription. If the value of this parameter is <code>true</code> and the request has an AWS signature, then only the topic owner and the subscription owner can unsubscribe the endpoint. The unsubscribe action requires AWS authentication. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for ConfirmSubscription action.</p>\"\
    },\
    \"ConfirmSubscriptionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SubscriptionArn\":{\
          \"shape\":\"subscriptionARN\",\
          \"documentation\":\"<p>The ARN of the created subscription.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Response for ConfirmSubscriptions action.</p>\"\
    },\
    \"CreateEndpointResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EndpointArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>EndpointArn returned from CreateEndpoint action.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Response from CreateEndpoint action.</p>\"\
    },\
    \"CreatePlatformApplicationInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"Platform\",\
        \"Attributes\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Application names must be made up of only uppercase and lowercase ASCII letters, numbers, underscores, hyphens, and periods, and must be between 1 and 256 characters long.</p>\"\
        },\
        \"Platform\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The following platforms are supported: ADM (Amazon Device Messaging), APNS (Apple Push Notification Service), APNS_SANDBOX, and GCM (Firebase Cloud Messaging).</p>\"\
        },\
        \"Attributes\":{\
          \"shape\":\"MapStringToString\",\
          \"documentation\":\"<p>For a list of attributes, see <a href=\\\"https://docs.aws.amazon.com/sns/latest/api/API_SetPlatformApplicationAttributes.html\\\">SetPlatformApplicationAttributes</a> </p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for CreatePlatformApplication action.</p>\"\
    },\
    \"CreatePlatformApplicationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PlatformApplicationArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>PlatformApplicationArn is returned.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Response from CreatePlatformApplication action.</p>\"\
    },\
    \"CreatePlatformEndpointInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"PlatformApplicationArn\",\
        \"Token\"\
      ],\
      \"members\":{\
        \"PlatformApplicationArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>PlatformApplicationArn returned from CreatePlatformApplication is used to create a an endpoint.</p>\"\
        },\
        \"Token\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Unique identifier created by the notification service for an app on a device. The specific name for Token will vary, depending on which notification service is being used. For example, when using APNS as the notification service, you need the device token. Alternatively, when using GCM (Firebase Cloud Messaging) or ADM, the device token equivalent is called the registration ID.</p>\"\
        },\
        \"CustomUserData\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Arbitrary user data to associate with the endpoint. Amazon SNS does not use this data. The data must be in UTF-8 format and less than 2KB.</p>\"\
        },\
        \"Attributes\":{\
          \"shape\":\"MapStringToString\",\
          \"documentation\":\"<p>For a list of attributes, see <a href=\\\"https://docs.aws.amazon.com/sns/latest/api/API_SetEndpointAttributes.html\\\">SetEndpointAttributes</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for CreatePlatformEndpoint action.</p>\"\
    },\
    \"CreateTopicInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"topicName\",\
          \"documentation\":\"<p>The name of the topic you want to create.</p> <p>Constraints: Topic names must be made up of only uppercase and lowercase ASCII letters, numbers, underscores, and hyphens, and must be between 1 and 256 characters long.</p> <p>For a FIFO (first-in-first-out) topic, the name must end with the <code>.fifo</code> suffix. </p>\"\
        },\
        \"Attributes\":{\
          \"shape\":\"TopicAttributesMap\",\
          \"documentation\":\"<p>A map of attributes with their corresponding values.</p> <p>The following lists the names, descriptions, and values of the special request parameters that the <code>CreateTopic</code> action uses:</p> <ul> <li> <p> <code>DeliveryPolicy</code> â The policy that defines how Amazon SNS retries failed deliveries to HTTP/S endpoints.</p> </li> <li> <p> <code>DisplayName</code> â The display name to use for a topic with SMS subscriptions.</p> </li> <li> <p> <code>FifoTopic</code> â Set to true to create a FIFO topic.</p> </li> <li> <p> <code>Policy</code> â The policy that defines who can access your topic. By default, only the topic owner can publish or subscribe to the topic.</p> </li> </ul> <p>The following attribute applies only to <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html\\\">server-side-encryption</a>:</p> <ul> <li> <p> <code>KmsMasterKeyId</code> â The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK. For more information, see <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html#sse-key-terms\\\">Key Terms</a>. For more examples, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/APIReference/API_DescribeKey.html#API_DescribeKey_RequestParameters\\\">KeyId</a> in the <i>AWS Key Management Service API Reference</i>. </p> </li> </ul> <p>The following attributes apply only to <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/sns-fifo-topics.html\\\">FIFO topics</a>:</p> <ul> <li> <p> <code>FifoTopic</code> â When this is set to <code>true</code>, a FIFO topic is created.</p> </li> <li> <p> <code>ContentBasedDeduplication</code> â Enables content-based deduplication for FIFO topics. </p> <ul> <li> <p>By default, <code>ContentBasedDeduplication</code> is set to <code>false</code>. If you create a FIFO topic and this attribute is <code>false</code>, you must specify a value for the <code>MessageDeduplicationId</code> parameter for the <a href=\\\"https://docs.aws.amazon.com/sns/latest/api/API_Publish.html\\\">Publish</a> action. </p> </li> <li> <p>When you set <code>ContentBasedDeduplication</code> to <code>true</code>, Amazon SNS uses a SHA-256 hash to generate the <code>MessageDeduplicationId</code> using the body of the message (but not the attributes of the message).</p> <p>(Optional) To override the generated value, you can specify a value for the the <code>MessageDeduplicationId</code> parameter for the <code>Publish</code> action.</p> </li> </ul> </li> </ul>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The list of tags to add to a new topic.</p> <note> <p>To be able to tag a topic on creation, you must have the <code>sns:CreateTopic</code> and <code>sns:TagResource</code> permissions.</p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>Input for CreateTopic action.</p>\"\
    },\
    \"CreateTopicResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TopicArn\":{\
          \"shape\":\"topicARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) assigned to the created topic.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Response from CreateTopic action.</p>\"\
    },\
    \"DelegatesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"delegate\"}\
    },\
    \"DeleteEndpointInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"EndpointArn\"],\
      \"members\":{\
        \"EndpointArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>EndpointArn of endpoint to delete.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for DeleteEndpoint action.</p>\"\
    },\
    \"DeletePlatformApplicationInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"PlatformApplicationArn\"],\
      \"members\":{\
        \"PlatformApplicationArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>PlatformApplicationArn of platform application object to delete.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for DeletePlatformApplication action.</p>\"\
    },\
    \"DeleteTopicInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"TopicArn\"],\
      \"members\":{\
        \"TopicArn\":{\
          \"shape\":\"topicARN\",\
          \"documentation\":\"<p>The ARN of the topic you want to delete.</p>\"\
        }\
      }\
    },\
    \"Endpoint\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EndpointArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>EndpointArn for mobile app and device.</p>\"\
        },\
        \"Attributes\":{\
          \"shape\":\"MapStringToString\",\
          \"documentation\":\"<p>Attributes for endpoint.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Endpoint for mobile app and device.</p>\"\
    },\
    \"EndpointDisabledException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Message for endpoint disabled.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Exception error indicating endpoint disabled.</p>\",\
      \"error\":{\
        \"code\":\"EndpointDisabled\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"FilterPolicyLimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>Indicates that the number of filter polices in your AWS account exceeds the limit. To add more filter polices, submit an SNS Limit Increase case in the AWS Support Center.</p>\",\
      \"error\":{\
        \"code\":\"FilterPolicyLimitExceeded\",\
        \"httpStatusCode\":403,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"GetEndpointAttributesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"EndpointArn\"],\
      \"members\":{\
        \"EndpointArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>EndpointArn for GetEndpointAttributes input.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for GetEndpointAttributes action.</p>\"\
    },\
    \"GetEndpointAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Attributes\":{\
          \"shape\":\"MapStringToString\",\
          \"documentation\":\"<p>Attributes include the following:</p> <ul> <li> <p> <code>CustomUserData</code> â arbitrary user data to associate with the endpoint. Amazon SNS does not use this data. The data must be in UTF-8 format and less than 2KB.</p> </li> <li> <p> <code>Enabled</code> â flag that enables/disables delivery to the endpoint. Amazon SNS will set this to false when a notification service indicates to Amazon SNS that the endpoint is invalid. Users can set it back to true, typically after updating Token.</p> </li> <li> <p> <code>Token</code> â device token, also referred to as a registration id, for an app and mobile device. This is returned from the notification service when an app and mobile device are registered with the notification service.</p> <note> <p>The device token for the iOS platform is returned in lowercase.</p> </note> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Response from GetEndpointAttributes of the EndpointArn.</p>\"\
    },\
    \"GetPlatformApplicationAttributesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"PlatformApplicationArn\"],\
      \"members\":{\
        \"PlatformApplicationArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>PlatformApplicationArn for GetPlatformApplicationAttributesInput.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for GetPlatformApplicationAttributes action.</p>\"\
    },\
    \"GetPlatformApplicationAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Attributes\":{\
          \"shape\":\"MapStringToString\",\
          \"documentation\":\"<p>Attributes include the following:</p> <ul> <li> <p> <code>EventEndpointCreated</code> â Topic ARN to which EndpointCreated event notifications should be sent.</p> </li> <li> <p> <code>EventEndpointDeleted</code> â Topic ARN to which EndpointDeleted event notifications should be sent.</p> </li> <li> <p> <code>EventEndpointUpdated</code> â Topic ARN to which EndpointUpdate event notifications should be sent.</p> </li> <li> <p> <code>EventDeliveryFailure</code> â Topic ARN to which DeliveryFailure event notifications should be sent upon Direct Publish delivery failure (permanent) to one of the application's endpoints.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Response for GetPlatformApplicationAttributes action.</p>\"\
    },\
    \"GetSMSAttributesInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"attributes\":{\
          \"shape\":\"ListString\",\
          \"documentation\":\"<p>A list of the individual attribute names, such as <code>MonthlySpendLimit</code>, for which you want values.</p> <p>For all attribute names, see <a href=\\\"https://docs.aws.amazon.com/sns/latest/api/API_SetSMSAttributes.html\\\">SetSMSAttributes</a>.</p> <p>If you don't use this parameter, Amazon SNS returns all SMS attributes.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the <code>GetSMSAttributes</code> request.</p>\"\
    },\
    \"GetSMSAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"attributes\":{\
          \"shape\":\"MapStringToString\",\
          \"documentation\":\"<p>The SMS attribute names and their values.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The response from the <code>GetSMSAttributes</code> request.</p>\"\
    },\
    \"GetSubscriptionAttributesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"SubscriptionArn\"],\
      \"members\":{\
        \"SubscriptionArn\":{\
          \"shape\":\"subscriptionARN\",\
          \"documentation\":\"<p>The ARN of the subscription whose properties you want to get.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for GetSubscriptionAttributes.</p>\"\
    },\
    \"GetSubscriptionAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Attributes\":{\
          \"shape\":\"SubscriptionAttributesMap\",\
          \"documentation\":\"<p>A map of the subscription's attributes. Attributes in this map include the following:</p> <ul> <li> <p> <code>ConfirmationWasAuthenticated</code> â <code>true</code> if the subscription confirmation request was authenticated.</p> </li> <li> <p> <code>DeliveryPolicy</code> â The JSON serialization of the subscription's delivery policy.</p> </li> <li> <p> <code>EffectiveDeliveryPolicy</code> â The JSON serialization of the effective delivery policy that takes into account the topic delivery policy and account system defaults.</p> </li> <li> <p> <code>FilterPolicy</code> â The filter policy JSON that is assigned to the subscription. For more information, see <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/sns-message-filtering.html\\\">Amazon SNS Message Filtering</a> in the <i>Amazon SNS Developer Guide</i>.</p> </li> <li> <p> <code>Owner</code> â The AWS account ID of the subscription's owner.</p> </li> <li> <p> <code>PendingConfirmation</code> â <code>true</code> if the subscription hasn't been confirmed. To confirm a pending subscription, call the <code>ConfirmSubscription</code> action with a confirmation token.</p> </li> <li> <p> <code>RawMessageDelivery</code> â <code>true</code> if raw message delivery is enabled for the subscription. Raw messages are free of JSON formatting and can be sent to HTTP/S and Amazon SQS endpoints.</p> </li> <li> <p> <code>RedrivePolicy</code> â When specified, sends undeliverable messages to the specified Amazon SQS dead-letter queue. Messages that can't be delivered due to client errors (for example, when the subscribed endpoint is unreachable) or server errors (for example, when the service that powers the subscribed endpoint becomes unavailable) are held in the dead-letter queue for further analysis or reprocessing.</p> </li> <li> <p> <code>SubscriptionArn</code> â The subscription's ARN.</p> </li> <li> <p> <code>TopicArn</code> â The topic ARN that the subscription is associated with.</p> </li> </ul> <p>The following attribute applies only to Amazon Kinesis Data Firehose delivery stream subscriptions:</p> <ul> <li> <p> <code>SubscriptionRoleArn</code> â The ARN of the IAM role that has the following:</p> <ul> <li> <p>Permission to write to the Kinesis Data Firehose delivery stream</p> </li> <li> <p>Amazon SNS listed as a trusted entity</p> </li> </ul> <p>Specifying a valid ARN for this attribute is required for Kinesis Data Firehose delivery stream subscriptions. For more information, see <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/sns-kinesis-subscriber.html\\\">Fanout to Kinesis Data Firehose delivery streams</a> in the <i>Amazon SNS Developer Guide</i>.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Response for GetSubscriptionAttributes action.</p>\"\
    },\
    \"GetTopicAttributesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"TopicArn\"],\
      \"members\":{\
        \"TopicArn\":{\
          \"shape\":\"topicARN\",\
          \"documentation\":\"<p>The ARN of the topic whose properties you want to get.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for GetTopicAttributes action.</p>\"\
    },\
    \"GetTopicAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Attributes\":{\
          \"shape\":\"TopicAttributesMap\",\
          \"documentation\":\"<p>A map of the topic's attributes. Attributes in this map include the following:</p> <ul> <li> <p> <code>DeliveryPolicy</code> â The JSON serialization of the topic's delivery policy.</p> </li> <li> <p> <code>DisplayName</code> â The human-readable name used in the <code>From</code> field for notifications to <code>email</code> and <code>email-json</code> endpoints.</p> </li> <li> <p> <code>Owner</code> â The AWS account ID of the topic's owner.</p> </li> <li> <p> <code>Policy</code> â The JSON serialization of the topic's access control policy.</p> </li> <li> <p> <code>SubscriptionsConfirmed</code> â The number of confirmed subscriptions for the topic.</p> </li> <li> <p> <code>SubscriptionsDeleted</code> â The number of deleted subscriptions for the topic.</p> </li> <li> <p> <code>SubscriptionsPending</code> â The number of subscriptions pending confirmation for the topic.</p> </li> <li> <p> <code>TopicArn</code> â The topic's ARN.</p> </li> <li> <p> <code>EffectiveDeliveryPolicy</code> â The JSON serialization of the effective delivery policy, taking system defaults into account.</p> </li> </ul> <p>The following attribute applies only to <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html\\\">server-side-encryption</a>:</p> <ul> <li> <p> <code>KmsMasterKeyId</code> - The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK. For more information, see <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html#sse-key-terms\\\">Key Terms</a>. For more examples, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/APIReference/API_DescribeKey.html#API_DescribeKey_RequestParameters\\\">KeyId</a> in the <i>AWS Key Management Service API Reference</i>.</p> </li> </ul> <p>The following attributes apply only to <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/sns-fifo-topics.html\\\">FIFO topics</a>:</p> <ul> <li> <p> <code>FifoTopic</code> â When this is set to <code>true</code>, a FIFO topic is created.</p> </li> <li> <p> <code>ContentBasedDeduplication</code> â Enables content-based deduplication for FIFO topics. </p> <ul> <li> <p>By default, <code>ContentBasedDeduplication</code> is set to <code>false</code>. If you create a FIFO topic and this attribute is <code>false</code>, you must specify a value for the <code>MessageDeduplicationId</code> parameter for the <a href=\\\"https://docs.aws.amazon.com/sns/latest/api/API_Publish.html\\\">Publish</a> action. </p> </li> <li> <p>When you set <code>ContentBasedDeduplication</code> to <code>true</code>, Amazon SNS uses a SHA-256 hash to generate the <code>MessageDeduplicationId</code> using the body of the message (but not the attributes of the message).</p> <p>(Optional) To override the generated value, you can specify a value for the the <code>MessageDeduplicationId</code> parameter for the <code>Publish</code> action.</p> </li> </ul> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Response for GetTopicAttributes action.</p>\"\
    },\
    \"InternalErrorException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>Indicates an internal service error.</p>\",\
      \"error\":{\
        \"code\":\"InternalError\",\
        \"httpStatusCode\":500\
      },\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"InvalidParameterException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>Indicates that a request parameter does not comply with the associated constraints.</p>\",\
      \"error\":{\
        \"code\":\"InvalidParameter\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidParameterValueException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The parameter value is invalid.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates that a request parameter does not comply with the associated constraints.</p>\",\
      \"error\":{\
        \"code\":\"ParameterValueInvalid\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidSecurityException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>The credential signature isn't valid. You must use an HTTPS endpoint and sign your request using Signature Version 4.</p>\",\
      \"error\":{\
        \"code\":\"InvalidSecurity\",\
        \"httpStatusCode\":403,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"KMSAccessDeniedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>The ciphertext references a key that doesn't exist or that you don't have access to.</p>\",\
      \"error\":{\
        \"code\":\"KMSAccessDenied\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"KMSDisabledException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the specified customer master key (CMK) isn't enabled.</p>\",\
      \"error\":{\
        \"code\":\"KMSDisabled\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"KMSInvalidStateException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the state of the specified resource isn't valid for this request. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">How Key State Affects Use of a Customer Master Key</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>\",\
      \"error\":{\
        \"code\":\"KMSInvalidState\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"KMSNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the specified entity or resource can't be found.</p>\",\
      \"error\":{\
        \"code\":\"KMSNotFound\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"KMSOptInRequired\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>The AWS access key ID needs a subscription for the service.</p>\",\
      \"error\":{\
        \"code\":\"KMSOptInRequired\",\
        \"httpStatusCode\":403,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"KMSThrottlingException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>The request was denied due to request throttling. For more information about throttling, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/limits.html#requests-per-second\\\">Limits</a> in the <i>AWS Key Management Service Developer Guide.</i> </p>\",\
      \"error\":{\
        \"code\":\"KMSThrottling\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"ListEndpointsByPlatformApplicationInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"PlatformApplicationArn\"],\
      \"members\":{\
        \"PlatformApplicationArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>PlatformApplicationArn for ListEndpointsByPlatformApplicationInput action.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>NextToken string is used when calling ListEndpointsByPlatformApplication action to retrieve additional records that are available after the first page results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for ListEndpointsByPlatformApplication action.</p>\"\
    },\
    \"ListEndpointsByPlatformApplicationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Endpoints\":{\
          \"shape\":\"ListOfEndpoints\",\
          \"documentation\":\"<p>Endpoints returned for ListEndpointsByPlatformApplication action.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>NextToken string is returned when calling ListEndpointsByPlatformApplication action if additional records are available after the first page results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Response for ListEndpointsByPlatformApplication action.</p>\"\
    },\
    \"ListOfEndpoints\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Endpoint\"}\
    },\
    \"ListOfPlatformApplications\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PlatformApplication\"}\
    },\
    \"ListPhoneNumbersOptedOutInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"nextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>A <code>NextToken</code> string is used when you call the <code>ListPhoneNumbersOptedOut</code> action to retrieve additional records that are available after the first page of results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the <code>ListPhoneNumbersOptedOut</code> action.</p>\"\
    },\
    \"ListPhoneNumbersOptedOutResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"phoneNumbers\":{\
          \"shape\":\"PhoneNumberList\",\
          \"documentation\":\"<p>A list of phone numbers that are opted out of receiving SMS messages. The list is paginated, and each page can contain up to 100 phone numbers.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>A <code>NextToken</code> string is returned when you call the <code>ListPhoneNumbersOptedOut</code> action if additional records are available after the first page of results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The response from the <code>ListPhoneNumbersOptedOut</code> action.</p>\"\
    },\
    \"ListPlatformApplicationsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>NextToken string is used when calling ListPlatformApplications action to retrieve additional records that are available after the first page results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for ListPlatformApplications action.</p>\"\
    },\
    \"ListPlatformApplicationsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PlatformApplications\":{\
          \"shape\":\"ListOfPlatformApplications\",\
          \"documentation\":\"<p>Platform applications returned when calling ListPlatformApplications action.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>NextToken string is returned when calling ListPlatformApplications action if additional records are available after the first page results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Response for ListPlatformApplications action.</p>\"\
    },\
    \"ListString\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"String\"}\
    },\
    \"ListSubscriptionsByTopicInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"TopicArn\"],\
      \"members\":{\
        \"TopicArn\":{\
          \"shape\":\"topicARN\",\
          \"documentation\":\"<p>The ARN of the topic for which you wish to find subscriptions.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"nextToken\",\
          \"documentation\":\"<p>Token returned by the previous <code>ListSubscriptionsByTopic</code> request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for ListSubscriptionsByTopic action.</p>\"\
    },\
    \"ListSubscriptionsByTopicResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Subscriptions\":{\
          \"shape\":\"SubscriptionsList\",\
          \"documentation\":\"<p>A list of subscriptions.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"nextToken\",\
          \"documentation\":\"<p>Token to pass along to the next <code>ListSubscriptionsByTopic</code> request. This element is returned if there are more subscriptions to retrieve.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Response for ListSubscriptionsByTopic action.</p>\"\
    },\
    \"ListSubscriptionsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"nextToken\",\
          \"documentation\":\"<p>Token returned by the previous <code>ListSubscriptions</code> request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for ListSubscriptions action.</p>\"\
    },\
    \"ListSubscriptionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Subscriptions\":{\
          \"shape\":\"SubscriptionsList\",\
          \"documentation\":\"<p>A list of subscriptions.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"nextToken\",\
          \"documentation\":\"<p>Token to pass along to the next <code>ListSubscriptions</code> request. This element is returned if there are more subscriptions to retrieve.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Response for ListSubscriptions action</p>\"\
    },\
    \"ListTagsForResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceArn\"],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>The ARN of the topic for which to list tags.</p>\"\
        }\
      }\
    },\
    \"ListTagsForResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tags associated with the specified topic.</p>\"\
        }\
      }\
    },\
    \"ListTopicsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"nextToken\",\
          \"documentation\":\"<p>Token returned by the previous <code>ListTopics</code> request.</p>\"\
        }\
      }\
    },\
    \"ListTopicsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Topics\":{\
          \"shape\":\"TopicsList\",\
          \"documentation\":\"<p>A list of topic ARNs.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"nextToken\",\
          \"documentation\":\"<p>Token to pass along to the next <code>ListTopics</code> request. This element is returned if there are additional topics to retrieve.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Response for ListTopics action.</p>\"\
    },\
    \"MapStringToString\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"String\"},\
      \"value\":{\"shape\":\"String\"}\
    },\
    \"MessageAttributeMap\":{\
      \"type\":\"map\",\
      \"key\":{\
        \"shape\":\"String\",\
        \"locationName\":\"Name\"\
      },\
      \"value\":{\
        \"shape\":\"MessageAttributeValue\",\
        \"locationName\":\"Value\"\
      }\
    },\
    \"MessageAttributeValue\":{\
      \"type\":\"structure\",\
      \"required\":[\"DataType\"],\
      \"members\":{\
        \"DataType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Amazon SNS supports the following logical data types: String, String.Array, Number, and Binary. For more information, see <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/SNSMessageAttributes.html#SNSMessageAttributes.DataTypes\\\">Message Attribute Data Types</a>.</p>\"\
        },\
        \"StringValue\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Strings are Unicode with UTF8 binary encoding. For a list of code values, see <a href=\\\"https://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters\\\">ASCII Printable Characters</a>.</p>\"\
        },\
        \"BinaryValue\":{\
          \"shape\":\"Binary\",\
          \"documentation\":\"<p>Binary type attributes can store any binary data, for example, compressed data, encrypted data, or images.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The user-specified message attribute value. For string data types, the value attribute has the same restrictions on the content as the message body. For more information, see <a href=\\\"https://docs.aws.amazon.com/sns/latest/api/API_Publish.html\\\">Publish</a>.</p> <p>Name, type, and value must not be empty or null. In addition, the message body should not be empty or null. All parts of the message attribute, including name, type, and value, are included in the message size restriction, which is currently 256 KB (262,144 bytes). For more information, see <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/SNSMessageAttributes.html\\\">Amazon SNS message attributes</a> and <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/sms_publish-to-phone.html\\\">Publishing to a mobile phone</a> in the <i>Amazon SNS Developer Guide.</i> </p>\"\
    },\
    \"NotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>Indicates that the requested resource does not exist.</p>\",\
      \"error\":{\
        \"code\":\"NotFound\",\
        \"httpStatusCode\":404,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"OptInPhoneNumberInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"phoneNumber\"],\
      \"members\":{\
        \"phoneNumber\":{\
          \"shape\":\"PhoneNumber\",\
          \"documentation\":\"<p>The phone number to opt in.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for the OptInPhoneNumber action.</p>\"\
    },\
    \"OptInPhoneNumberResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The response for the OptInPhoneNumber action.</p>\"\
    },\
    \"PhoneNumber\":{\"type\":\"string\"},\
    \"PhoneNumberList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PhoneNumber\"}\
    },\
    \"PlatformApplication\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PlatformApplicationArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>PlatformApplicationArn for platform application object.</p>\"\
        },\
        \"Attributes\":{\
          \"shape\":\"MapStringToString\",\
          \"documentation\":\"<p>Attributes for platform application object.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Platform application object.</p>\"\
    },\
    \"PlatformApplicationDisabledException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Message for platform application disabled.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Exception error indicating platform application disabled.</p>\",\
      \"error\":{\
        \"code\":\"PlatformApplicationDisabled\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"PublishInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"Message\"],\
      \"members\":{\
        \"TopicArn\":{\
          \"shape\":\"topicARN\",\
          \"documentation\":\"<p>The topic you want to publish to.</p> <p>If you don't specify a value for the <code>TopicArn</code> parameter, you must specify a value for the <code>PhoneNumber</code> or <code>TargetArn</code> parameters.</p>\"\
        },\
        \"TargetArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>If you don't specify a value for the <code>TargetArn</code> parameter, you must specify a value for the <code>PhoneNumber</code> or <code>TopicArn</code> parameters.</p>\"\
        },\
        \"PhoneNumber\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The phone number to which you want to deliver an SMS message. Use E.164 format.</p> <p>If you don't specify a value for the <code>PhoneNumber</code> parameter, you must specify a value for the <code>TargetArn</code> or <code>TopicArn</code> parameters.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"message\",\
          \"documentation\":\"<p>The message you want to send.</p> <p>If you are publishing to a topic and you want to send the same message to all transport protocols, include the text of the message as a String value. If you want to send different messages for each transport protocol, set the value of the <code>MessageStructure</code> parameter to <code>json</code> and use a JSON object for the <code>Message</code> parameter. </p> <p/> <p>Constraints:</p> <ul> <li> <p>With the exception of SMS, messages must be UTF-8 encoded strings and at most 256 KB in size (262,144 bytes, not 262,144 characters).</p> </li> <li> <p>For SMS, each message can contain up to 140 characters. This character limit depends on the encoding schema. For example, an SMS message can contain 160 GSM characters, 140 ASCII characters, or 70 UCS-2 characters.</p> <p>If you publish a message that exceeds this size limit, Amazon SNS sends the message as multiple messages, each fitting within the size limit. Messages aren't truncated mid-word but are cut off at whole-word boundaries.</p> <p>The total size limit for a single SMS <code>Publish</code> action is 1,600 characters.</p> </li> </ul> <p>JSON-specific constraints:</p> <ul> <li> <p>Keys in the JSON object that correspond to supported transport protocols must have simple JSON string values.</p> </li> <li> <p>The values will be parsed (unescaped) before they are used in outgoing messages.</p> </li> <li> <p>Outbound notifications are JSON encoded (meaning that the characters will be reescaped for sending).</p> </li> <li> <p>Values have a minimum length of 0 (the empty string, \\\"\\\", is allowed).</p> </li> <li> <p>Values have a maximum length bounded by the overall message size (so, including multiple protocols may limit message sizes).</p> </li> <li> <p>Non-string values will cause the key to be ignored.</p> </li> <li> <p>Keys that do not correspond to supported transport protocols are ignored.</p> </li> <li> <p>Duplicate keys are not allowed.</p> </li> <li> <p>Failure to parse or validate any key or value in the message will cause the <code>Publish</code> call to return an error (no partial delivery).</p> </li> </ul>\"\
        },\
        \"Subject\":{\
          \"shape\":\"subject\",\
          \"documentation\":\"<p>Optional parameter to be used as the \\\"Subject\\\" line when the message is delivered to email endpoints. This field will also be included, if present, in the standard JSON messages delivered to other endpoints.</p> <p>Constraints: Subjects must be ASCII text that begins with a letter, number, or punctuation mark; must not include line breaks or control characters; and must be less than 100 characters long.</p>\"\
        },\
        \"MessageStructure\":{\
          \"shape\":\"messageStructure\",\
          \"documentation\":\"<p>Set <code>MessageStructure</code> to <code>json</code> if you want to send a different message for each protocol. For example, using one publish action, you can send a short message to your SMS subscribers and a longer message to your email subscribers. If you set <code>MessageStructure</code> to <code>json</code>, the value of the <code>Message</code> parameter must: </p> <ul> <li> <p>be a syntactically valid JSON object; and</p> </li> <li> <p>contain at least a top-level JSON key of \\\"default\\\" with a value that is a string.</p> </li> </ul> <p>You can define other top-level keys that define the message you want to send to a specific transport protocol (e.g., \\\"http\\\").</p> <p>Valid value: <code>json</code> </p>\"\
        },\
        \"MessageAttributes\":{\
          \"shape\":\"MessageAttributeMap\",\
          \"documentation\":\"<p>Message attributes for Publish action.</p>\"\
        },\
        \"MessageDeduplicationId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>This parameter applies only to FIFO (first-in-first-out) topics. The <code>MessageDeduplicationId</code> can contain up to 128 alphanumeric characters (a-z, A-Z, 0-9) and punctuation <code>(!\\\"#$%&amp;'()*+,-./:;&lt;=&gt;?@[\\\\]^_`{|}~)</code>.</p> <p>Every message must have a unique <code>MessageDeduplicationId</code>, which is a token used for deduplication of sent messages. If a message with a particular <code>MessageDeduplicationId</code> is sent successfully, any message sent with the same <code>MessageDeduplicationId</code> during the 5-minute deduplication interval is treated as a duplicate. </p> <p>If the topic has <code>ContentBasedDeduplication</code> set, the system generates a <code>MessageDeduplicationId</code> based on the contents of the message. Your <code>MessageDeduplicationId</code> overrides the generated one.</p>\"\
        },\
        \"MessageGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>This parameter applies only to FIFO (first-in-first-out) topics. The <code>MessageGroupId</code> can contain up to 128 alphanumeric characters (a-z, A-Z, 0-9) and punctuation <code>(!\\\"#$%&amp;'()*+,-./:;&lt;=&gt;?@[\\\\]^_`{|}~)</code>.</p> <p>The <code>MessageGroupId</code> is a tag that specifies that a message belongs to a specific message group. Messages that belong to the same message group are processed in a FIFO manner (however, messages in different message groups might be processed out of order). Every message must include a <code>MessageGroupId</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for Publish action.</p>\"\
    },\
    \"PublishResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MessageId\":{\
          \"shape\":\"messageId\",\
          \"documentation\":\"<p>Unique identifier assigned to the published message.</p> <p>Length Constraint: Maximum 100 characters</p>\"\
        },\
        \"SequenceNumber\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>This response element applies only to FIFO (first-in-first-out) topics. </p> <p>The sequence number is a large, non-consecutive number that Amazon SNS assigns to each message. The length of <code>SequenceNumber</code> is 128 bits. <code>SequenceNumber</code> continues to increase for each <code>MessageGroupId</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Response for Publish action.</p>\"\
    },\
    \"RemovePermissionInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TopicArn\",\
        \"Label\"\
      ],\
      \"members\":{\
        \"TopicArn\":{\
          \"shape\":\"topicARN\",\
          \"documentation\":\"<p>The ARN of the topic whose access control policy you wish to modify.</p>\"\
        },\
        \"Label\":{\
          \"shape\":\"label\",\
          \"documentation\":\"<p>The unique label of the statement you want to remove.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for RemovePermission action.</p>\"\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>Can't tag resource. Verify that the topic exists.</p>\",\
      \"error\":{\
        \"code\":\"ResourceNotFound\",\
        \"httpStatusCode\":404,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"SetEndpointAttributesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EndpointArn\",\
        \"Attributes\"\
      ],\
      \"members\":{\
        \"EndpointArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>EndpointArn used for SetEndpointAttributes action.</p>\"\
        },\
        \"Attributes\":{\
          \"shape\":\"MapStringToString\",\
          \"documentation\":\"<p>A map of the endpoint attributes. Attributes in this map include the following:</p> <ul> <li> <p> <code>CustomUserData</code> â arbitrary user data to associate with the endpoint. Amazon SNS does not use this data. The data must be in UTF-8 format and less than 2KB.</p> </li> <li> <p> <code>Enabled</code> â flag that enables/disables delivery to the endpoint. Amazon SNS will set this to false when a notification service indicates to Amazon SNS that the endpoint is invalid. Users can set it back to true, typically after updating Token.</p> </li> <li> <p> <code>Token</code> â device token, also referred to as a registration id, for an app and mobile device. This is returned from the notification service when an app and mobile device are registered with the notification service.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Input for SetEndpointAttributes action.</p>\"\
    },\
    \"SetPlatformApplicationAttributesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"PlatformApplicationArn\",\
        \"Attributes\"\
      ],\
      \"members\":{\
        \"PlatformApplicationArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>PlatformApplicationArn for SetPlatformApplicationAttributes action.</p>\"\
        },\
        \"Attributes\":{\
          \"shape\":\"MapStringToString\",\
          \"documentation\":\"<p>A map of the platform application attributes. Attributes in this map include the following:</p> <ul> <li> <p> <code>PlatformCredential</code> â The credential received from the notification service. For <code>APNS</code> and <code>APNS_SANDBOX</code>, <code>PlatformCredential</code> is <code>private key</code>. For <code>GCM</code> (Firebase Cloud Messaging), <code>PlatformCredential</code> is <code>API key</code>. For <code>ADM</code>, <code>PlatformCredential</code> is <code>client secret</code>.</p> </li> <li> <p> <code>PlatformPrincipal</code> â The principal received from the notification service. For <code>APNS</code> and <code>APNS_SANDBOX</code>, <code>PlatformPrincipal</code> is <code>SSL certificate</code>. For <code>GCM</code> (Firebase Cloud Messaging), there is no <code>PlatformPrincipal</code>. For <code>ADM</code>, <code>PlatformPrincipal</code> is <code>client id</code>.</p> </li> <li> <p> <code>EventEndpointCreated</code> â Topic ARN to which <code>EndpointCreated</code> event notifications are sent.</p> </li> <li> <p> <code>EventEndpointDeleted</code> â Topic ARN to which <code>EndpointDeleted</code> event notifications are sent.</p> </li> <li> <p> <code>EventEndpointUpdated</code> â Topic ARN to which <code>EndpointUpdate</code> event notifications are sent.</p> </li> <li> <p> <code>EventDeliveryFailure</code> â Topic ARN to which <code>DeliveryFailure</code> event notifications are sent upon Direct Publish delivery failure (permanent) to one of the application's endpoints.</p> </li> <li> <p> <code>SuccessFeedbackRoleArn</code> â IAM role ARN used to give Amazon SNS write access to use CloudWatch Logs on your behalf.</p> </li> <li> <p> <code>FailureFeedbackRoleArn</code> â IAM role ARN used to give Amazon SNS write access to use CloudWatch Logs on your behalf.</p> </li> <li> <p> <code>SuccessFeedbackSampleRate</code> â Sample rate percentage (0-100) of successfully delivered messages.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Input for SetPlatformApplicationAttributes action.</p>\"\
    },\
    \"SetSMSAttributesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"attributes\"],\
      \"members\":{\
        \"attributes\":{\
          \"shape\":\"MapStringToString\",\
          \"documentation\":\"<p>The default settings for sending SMS messages from your account. You can set values for the following attribute names:</p> <p> <code>MonthlySpendLimit</code> â The maximum amount in USD that you are willing to spend each month to send SMS messages. When Amazon SNS determines that sending an SMS message would incur a cost that exceeds this limit, it stops sending SMS messages within minutes.</p> <important> <p>Amazon SNS stops sending SMS messages within minutes of the limit being crossed. During that interval, if you continue to send SMS messages, you will incur costs that exceed your limit.</p> </important> <p>By default, the spend limit is set to the maximum allowed by Amazon SNS. If you want to raise the limit, submit an <a href=\\\"https://console.aws.amazon.com/support/home#/case/create?issueType=service-limit-increase&amp;limitType=service-code-sns\\\">SNS Limit Increase case</a>. For <b>New limit value</b>, enter your desired monthly spend limit. In the <b>Use Case Description</b> field, explain that you are requesting an SMS monthly spend limit increase.</p> <p> <code>DeliveryStatusIAMRole</code> â The ARN of the IAM role that allows Amazon SNS to write logs about SMS deliveries in CloudWatch Logs. For each SMS message that you send, Amazon SNS writes a log that includes the message price, the success or failure status, the reason for failure (if the message failed), the message dwell time, and other information.</p> <p> <code>DeliveryStatusSuccessSamplingRate</code> â The percentage of successful SMS deliveries for which Amazon SNS will write logs in CloudWatch Logs. The value can be an integer from 0 - 100. For example, to write logs only for failed deliveries, set this value to <code>0</code>. To write logs for 10% of your successful deliveries, set it to <code>10</code>.</p> <p> <code>DefaultSenderID</code> â A string, such as your business brand, that is displayed as the sender on the receiving device. Support for sender IDs varies by country. The sender ID can be 1 - 11 alphanumeric characters, and it must contain at least one letter.</p> <p> <code>DefaultSMSType</code> â The type of SMS message that you will send by default. You can assign the following values:</p> <ul> <li> <p> <code>Promotional</code> â (Default) Noncritical messages, such as marketing messages. Amazon SNS optimizes the message delivery to incur the lowest cost.</p> </li> <li> <p> <code>Transactional</code> â Critical messages that support customer transactions, such as one-time passcodes for multi-factor authentication. Amazon SNS optimizes the message delivery to achieve the highest reliability.</p> </li> </ul> <p> <code>UsageReportS3Bucket</code> â The name of the Amazon S3 bucket to receive daily SMS usage reports from Amazon SNS. Each day, Amazon SNS will deliver a usage report as a CSV file to the bucket. The report includes the following information for each SMS message that was successfully delivered by your account:</p> <ul> <li> <p>Time that the message was published (in UTC)</p> </li> <li> <p>Message ID</p> </li> <li> <p>Destination phone number</p> </li> <li> <p>Message type</p> </li> <li> <p>Delivery status</p> </li> <li> <p>Message price (in USD)</p> </li> <li> <p>Part number (a message is split into multiple parts if it is too long for a single message)</p> </li> <li> <p>Total number of parts</p> </li> </ul> <p>To receive the report, the bucket must have a policy that allows the Amazon SNS service principle to perform the <code>s3:PutObject</code> and <code>s3:GetBucketLocation</code> actions.</p> <p>For an example bucket policy and usage report, see <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/sms_stats.html\\\">Monitoring SMS Activity</a> in the <i>Amazon SNS Developer Guide</i>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the SetSMSAttributes action.</p>\"\
    },\
    \"SetSMSAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The response for the SetSMSAttributes action.</p>\"\
    },\
    \"SetSubscriptionAttributesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SubscriptionArn\",\
        \"AttributeName\"\
      ],\
      \"members\":{\
        \"SubscriptionArn\":{\
          \"shape\":\"subscriptionARN\",\
          \"documentation\":\"<p>The ARN of the subscription to modify.</p>\"\
        },\
        \"AttributeName\":{\
          \"shape\":\"attributeName\",\
          \"documentation\":\"<p>A map of attributes with their corresponding values.</p> <p>The following lists the names, descriptions, and values of the special request parameters that this action uses:</p> <ul> <li> <p> <code>DeliveryPolicy</code> â The policy that defines how Amazon SNS retries failed deliveries to HTTP/S endpoints.</p> </li> <li> <p> <code>FilterPolicy</code> â The simple JSON object that lets your subscriber receive only a subset of messages, rather than receiving every message published to the topic.</p> </li> <li> <p> <code>RawMessageDelivery</code> â When set to <code>true</code>, enables raw message delivery to Amazon SQS or HTTP/S endpoints. This eliminates the need for the endpoints to process JSON formatting, which is otherwise created for Amazon SNS metadata.</p> </li> <li> <p> <code>RedrivePolicy</code> â When specified, sends undeliverable messages to the specified Amazon SQS dead-letter queue. Messages that can't be delivered due to client errors (for example, when the subscribed endpoint is unreachable) or server errors (for example, when the service that powers the subscribed endpoint becomes unavailable) are held in the dead-letter queue for further analysis or reprocessing.</p> </li> </ul> <p>The following attribute applies only to Amazon Kinesis Data Firehose delivery stream subscriptions:</p> <ul> <li> <p> <code>SubscriptionRoleArn</code> â The ARN of the IAM role that has the following:</p> <ul> <li> <p>Permission to write to the Kinesis Data Firehose delivery stream</p> </li> <li> <p>Amazon SNS listed as a trusted entity</p> </li> </ul> <p>Specifying a valid ARN for this attribute is required for Kinesis Data Firehose delivery stream subscriptions. For more information, see <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/sns-kinesis-subscriber.html\\\">Fanout to Kinesis Data Firehose delivery streams</a> in the <i>Amazon SNS Developer Guide</i>.</p> </li> </ul>\"\
        },\
        \"AttributeValue\":{\
          \"shape\":\"attributeValue\",\
          \"documentation\":\"<p>The new value for the attribute in JSON format.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for SetSubscriptionAttributes action.</p>\"\
    },\
    \"SetTopicAttributesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TopicArn\",\
        \"AttributeName\"\
      ],\
      \"members\":{\
        \"TopicArn\":{\
          \"shape\":\"topicARN\",\
          \"documentation\":\"<p>The ARN of the topic to modify.</p>\"\
        },\
        \"AttributeName\":{\
          \"shape\":\"attributeName\",\
          \"documentation\":\"<p>A map of attributes with their corresponding values.</p> <p>The following lists the names, descriptions, and values of the special request parameters that the <code>SetTopicAttributes</code> action uses:</p> <ul> <li> <p> <code>DeliveryPolicy</code> â The policy that defines how Amazon SNS retries failed deliveries to HTTP/S endpoints.</p> </li> <li> <p> <code>DisplayName</code> â The display name to use for a topic with SMS subscriptions.</p> </li> <li> <p> <code>Policy</code> â The policy that defines who can access your topic. By default, only the topic owner can publish or subscribe to the topic.</p> </li> </ul> <p>The following attribute applies only to <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html\\\">server-side-encryption</a>:</p> <ul> <li> <p> <code>KmsMasterKeyId</code> â The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK. For more information, see <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html#sse-key-terms\\\">Key Terms</a>. For more examples, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/APIReference/API_DescribeKey.html#API_DescribeKey_RequestParameters\\\">KeyId</a> in the <i>AWS Key Management Service API Reference</i>. </p> </li> </ul> <p>The following attribute applies only to <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/sns-fifo-topics.html\\\">FIFO topics</a>:</p> <ul> <li> <p> <code>ContentBasedDeduplication</code> â Enables content-based deduplication for FIFO topics. </p> <ul> <li> <p>By default, <code>ContentBasedDeduplication</code> is set to <code>false</code>. If you create a FIFO topic and this attribute is <code>false</code>, you must specify a value for the <code>MessageDeduplicationId</code> parameter for the <a href=\\\"https://docs.aws.amazon.com/sns/latest/api/API_Publish.html\\\">Publish</a> action. </p> </li> <li> <p>When you set <code>ContentBasedDeduplication</code> to <code>true</code>, Amazon SNS uses a SHA-256 hash to generate the <code>MessageDeduplicationId</code> using the body of the message (but not the attributes of the message).</p> <p>(Optional) To override the generated value, you can specify a value for the the <code>MessageDeduplicationId</code> parameter for the <code>Publish</code> action.</p> </li> </ul> </li> </ul>\"\
        },\
        \"AttributeValue\":{\
          \"shape\":\"attributeValue\",\
          \"documentation\":\"<p>The new value for the attribute.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for SetTopicAttributes action.</p>\"\
    },\
    \"StaleTagException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>A tag has been added to a resource with the same ARN as a deleted resource. Wait a short while and then retry the operation.</p>\",\
      \"error\":{\
        \"code\":\"StaleTag\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"String\":{\"type\":\"string\"},\
    \"SubscribeInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TopicArn\",\
        \"Protocol\"\
      ],\
      \"members\":{\
        \"TopicArn\":{\
          \"shape\":\"topicARN\",\
          \"documentation\":\"<p>The ARN of the topic you want to subscribe to.</p>\"\
        },\
        \"Protocol\":{\
          \"shape\":\"protocol\",\
          \"documentation\":\"<p>The protocol that you want to use. Supported protocols include:</p> <ul> <li> <p> <code>http</code> â delivery of JSON-encoded message via HTTP POST</p> </li> <li> <p> <code>https</code> â delivery of JSON-encoded message via HTTPS POST</p> </li> <li> <p> <code>email</code> â delivery of message via SMTP</p> </li> <li> <p> <code>email-json</code> â delivery of JSON-encoded message via SMTP</p> </li> <li> <p> <code>sms</code> â delivery of message via SMS</p> </li> <li> <p> <code>sqs</code> â delivery of JSON-encoded message to an Amazon SQS queue</p> </li> <li> <p> <code>application</code> â delivery of JSON-encoded message to an EndpointArn for a mobile app and device</p> </li> <li> <p> <code>lambda</code> â delivery of JSON-encoded message to an AWS Lambda function</p> </li> <li> <p> <code>firehose</code> â delivery of JSON-encoded message to an Amazon Kinesis Data Firehose delivery stream.</p> </li> </ul>\"\
        },\
        \"Endpoint\":{\
          \"shape\":\"endpoint\",\
          \"documentation\":\"<p>The endpoint that you want to receive notifications. Endpoints vary by protocol:</p> <ul> <li> <p>For the <code>http</code> protocol, the (public) endpoint is a URL beginning with <code>http://</code>.</p> </li> <li> <p>For the <code>https</code> protocol, the (public) endpoint is a URL beginning with <code>https://</code>.</p> </li> <li> <p>For the <code>email</code> protocol, the endpoint is an email address.</p> </li> <li> <p>For the <code>email-json</code> protocol, the endpoint is an email address.</p> </li> <li> <p>For the <code>sms</code> protocol, the endpoint is a phone number of an SMS-enabled device.</p> </li> <li> <p>For the <code>sqs</code> protocol, the endpoint is the ARN of an Amazon SQS queue.</p> </li> <li> <p>For the <code>application</code> protocol, the endpoint is the EndpointArn of a mobile app and device.</p> </li> <li> <p>For the <code>lambda</code> protocol, the endpoint is the ARN of an AWS Lambda function.</p> </li> <li> <p>For the <code>firehose</code> protocol, the endpoint is the ARN of an Amazon Kinesis Data Firehose delivery stream.</p> </li> </ul>\"\
        },\
        \"Attributes\":{\
          \"shape\":\"SubscriptionAttributesMap\",\
          \"documentation\":\"<p>A map of attributes with their corresponding values.</p> <p>The following lists the names, descriptions, and values of the special request parameters that the <code>SetTopicAttributes</code> action uses:</p> <ul> <li> <p> <code>DeliveryPolicy</code> â The policy that defines how Amazon SNS retries failed deliveries to HTTP/S endpoints.</p> </li> <li> <p> <code>FilterPolicy</code> â The simple JSON object that lets your subscriber receive only a subset of messages, rather than receiving every message published to the topic.</p> </li> <li> <p> <code>RawMessageDelivery</code> â When set to <code>true</code>, enables raw message delivery to Amazon SQS or HTTP/S endpoints. This eliminates the need for the endpoints to process JSON formatting, which is otherwise created for Amazon SNS metadata.</p> </li> <li> <p> <code>RedrivePolicy</code> â When specified, sends undeliverable messages to the specified Amazon SQS dead-letter queue. Messages that can't be delivered due to client errors (for example, when the subscribed endpoint is unreachable) or server errors (for example, when the service that powers the subscribed endpoint becomes unavailable) are held in the dead-letter queue for further analysis or reprocessing.</p> </li> </ul> <p>The following attribute applies only to Amazon Kinesis Data Firehose delivery stream subscriptions:</p> <ul> <li> <p> <code>SubscriptionRoleArn</code> â The ARN of the IAM role that has the following:</p> <ul> <li> <p>Permission to write to the Kinesis Data Firehose delivery stream</p> </li> <li> <p>Amazon SNS listed as a trusted entity</p> </li> </ul> <p>Specifying a valid ARN for this attribute is required for Kinesis Data Firehose delivery stream subscriptions. For more information, see <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/sns-kinesis-subscriber.html\\\">Fanout to Kinesis Data Firehose delivery streams</a> in the <i>Amazon SNS Developer Guide</i>.</p> </li> </ul>\"\
        },\
        \"ReturnSubscriptionArn\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>Sets whether the response from the <code>Subscribe</code> request includes the subscription ARN, even if the subscription is not yet confirmed.</p> <p>If you set this parameter to <code>true</code>, the response includes the ARN in all cases, even if the subscription is not yet confirmed. In addition to the ARN for confirmed subscriptions, the response also includes the <code>pending subscription</code> ARN value for subscriptions that aren't yet confirmed. A subscription becomes confirmed when the subscriber calls the <code>ConfirmSubscription</code> action with a confirmation token.</p> <p/> <p>The default value is <code>false</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for Subscribe action.</p>\"\
    },\
    \"SubscribeResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SubscriptionArn\":{\
          \"shape\":\"subscriptionARN\",\
          \"documentation\":\"<p>The ARN of the subscription if it is confirmed, or the string \\\"pending confirmation\\\" if the subscription requires confirmation. However, if the API request parameter <code>ReturnSubscriptionArn</code> is true, then the value is always the subscription ARN, even if the subscription requires confirmation.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Response for Subscribe action.</p>\"\
    },\
    \"Subscription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SubscriptionArn\":{\
          \"shape\":\"subscriptionARN\",\
          \"documentation\":\"<p>The subscription's ARN.</p>\"\
        },\
        \"Owner\":{\
          \"shape\":\"account\",\
          \"documentation\":\"<p>The subscription's owner.</p>\"\
        },\
        \"Protocol\":{\
          \"shape\":\"protocol\",\
          \"documentation\":\"<p>The subscription's protocol.</p>\"\
        },\
        \"Endpoint\":{\
          \"shape\":\"endpoint\",\
          \"documentation\":\"<p>The subscription's endpoint (format depends on the protocol).</p>\"\
        },\
        \"TopicArn\":{\
          \"shape\":\"topicARN\",\
          \"documentation\":\"<p>The ARN of the subscription's topic.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A wrapper type for the attributes of an Amazon SNS subscription.</p>\"\
    },\
    \"SubscriptionAttributesMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"attributeName\"},\
      \"value\":{\"shape\":\"attributeValue\"}\
    },\
    \"SubscriptionLimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>Indicates that the customer already owns the maximum allowed number of subscriptions.</p>\",\
      \"error\":{\
        \"code\":\"SubscriptionLimitExceeded\",\
        \"httpStatusCode\":403,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"SubscriptionsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Subscription\"}\
    },\
    \"Tag\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Key\",\
        \"Value\"\
      ],\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"TagKey\",\
          \"documentation\":\"<p>The required key portion of the tag.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"TagValue\",\
          \"documentation\":\"<p>The optional value portion of the tag.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The list of tags to be added to the specified topic.</p>\"\
    },\
    \"TagKey\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"TagKeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKey\"}\
    },\
    \"TagLimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>Can't add more than 50 tags to a topic.</p>\",\
      \"error\":{\
        \"code\":\"TagLimitExceeded\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"TagList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Tag\"}\
    },\
    \"TagPolicyException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>The request doesn't comply with the IAM tag policy. Correct your request and then retry it.</p>\",\
      \"error\":{\
        \"code\":\"TagPolicy\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"TagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceArn\",\
        \"Tags\"\
      ],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>The ARN of the topic to which to add tags.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tags to be added to the specified topic. A tag consists of a required key and an optional value.</p>\"\
        }\
      }\
    },\
    \"TagResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"TagValue\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0\
    },\
    \"ThrottledException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Throttled request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates that the rate at which requests have been submitted for this action exceeds the limit for your account.</p>\",\
      \"error\":{\
        \"code\":\"Throttled\",\
        \"httpStatusCode\":429,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"Topic\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TopicArn\":{\
          \"shape\":\"topicARN\",\
          \"documentation\":\"<p>The topic's ARN.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A wrapper type for the topic's Amazon Resource Name (ARN). To retrieve a topic's attributes, use <code>GetTopicAttributes</code>.</p>\"\
    },\
    \"TopicAttributesMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"attributeName\"},\
      \"value\":{\"shape\":\"attributeValue\"}\
    },\
    \"TopicLimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>Indicates that the customer already owns the maximum allowed number of topics.</p>\",\
      \"error\":{\
        \"code\":\"TopicLimitExceeded\",\
        \"httpStatusCode\":403,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"TopicsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Topic\"}\
    },\
    \"UnsubscribeInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"SubscriptionArn\"],\
      \"members\":{\
        \"SubscriptionArn\":{\
          \"shape\":\"subscriptionARN\",\
          \"documentation\":\"<p>The ARN of the subscription to be deleted.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for Unsubscribe action.</p>\"\
    },\
    \"UntagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceArn\",\
        \"TagKeys\"\
      ],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>The ARN of the topic from which to remove tags.</p>\"\
        },\
        \"TagKeys\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p>The list of tag keys to remove from the specified topic.</p>\"\
        }\
      }\
    },\
    \"UntagResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"account\":{\"type\":\"string\"},\
    \"action\":{\"type\":\"string\"},\
    \"attributeName\":{\"type\":\"string\"},\
    \"attributeValue\":{\"type\":\"string\"},\
    \"authenticateOnUnsubscribe\":{\"type\":\"string\"},\
    \"boolean\":{\"type\":\"boolean\"},\
    \"delegate\":{\"type\":\"string\"},\
    \"endpoint\":{\"type\":\"string\"},\
    \"label\":{\"type\":\"string\"},\
    \"message\":{\"type\":\"string\"},\
    \"messageId\":{\"type\":\"string\"},\
    \"messageStructure\":{\"type\":\"string\"},\
    \"nextToken\":{\"type\":\"string\"},\
    \"protocol\":{\"type\":\"string\"},\
    \"string\":{\"type\":\"string\"},\
    \"subject\":{\"type\":\"string\"},\
    \"subscriptionARN\":{\"type\":\"string\"},\
    \"token\":{\"type\":\"string\"},\
    \"topicARN\":{\"type\":\"string\"},\
    \"topicName\":{\"type\":\"string\"}\
  },\
  \"documentation\":\"<fullname>Amazon Simple Notification Service</fullname> <p>Amazon Simple Notification Service (Amazon SNS) is a web service that enables you to build distributed web-enabled applications. Applications can use Amazon SNS to easily push real-time notification messages to interested subscribers over multiple delivery protocols. For more information about this product see the <a href=\\\"http://aws.amazon.com/sns/\\\">Amazon SNS product page</a>. For detailed information about Amazon SNS features and their associated API calls, see the <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/\\\">Amazon SNS Developer Guide</a>. </p> <p>For information on the permissions you need to use this API, see <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/sns-authentication-and-access-control.html\\\">Identity and access management in Amazon SNS</a> in the <i>Amazon SNS Developer Guide.</i> </p> <p>We also provide SDKs that enable you to access Amazon SNS from your preferred programming language. The SDKs contain functionality that automatically takes care of tasks such as: cryptographically signing your service requests, retrying requests, and handling error responses. For a list of available SDKs, go to <a href=\\\"http://aws.amazon.com/tools/\\\">Tools for Amazon Web Services</a>. </p>\"\
}\
";
}

@end
