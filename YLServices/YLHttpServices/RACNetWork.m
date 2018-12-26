//
//  RACNetWork.m
//  NetWorkTool
//
//  Created by sky on 2018/6/1.
//  Copyright © 2018年 DYL. All rights reserved.
//

@implementation RACNetWork

+ (RACSignal *)rac_Action:(BaseRequest *)request resultClass:(Class)resultClass {
    // TODO 判断网络状态,不可用返回
    if ([TGSystemHelper shareInstance].netWorkStatus == TGNetWorkStatusNoNetWork) {
        return [RACSignal error:[NSError errorWithDomain:KNetworkErrorDomain code:KNetworkErrorCode userInfo:@{KNetworkRequestError:KNetworkErrorInfo, @"code":@"-505"}]];
    }
    return [[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [request startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
            KLog(@"\n 请求url: %@/%@\n 请求参数 %@\n 结果 %@\n 所在线程 %@ \n", [YTKNetworkConfig sharedConfig].baseUrl, request.requestUrl, request.requestArgument, request.responseJSONObject, [NSThread currentThread]);
            BaseResponse *response = [BaseResponse mj_objectWithKeyValues:request.responseData];
            if (resultClass != nil) { // 泛型不为空
                if ([response.code isEqualToString:CODE_SUCCESS]) { // 请求成功
                    [subscriber sendNext:[resultClass mj_objectWithKeyValues:response.data]];
                } else { // 请求信息有误
                    [[NSNotificationCenter defaultCenter] postNotificationName:KNetworkErrorNotificatonKey object:nil userInfo:@{KNetworkRequestError:response.msg, @"code":response.code}];
                    [subscriber sendError:[NSError errorWithDomain:KNetworkRequestErrorDomain code:KNetworkRequestErrorCode userInfo:@{KNetworkRequestError: response.msg}]];
                }
            } else { // 泛型为空
                if ([response.code isEqualToString:CODE_SUCCESS]) { // 请求成功
                    [subscriber sendNext:response.data];
                } else { // 请求信息有误
                    [[NSNotificationCenter defaultCenter] postNotificationName:KNetworkErrorNotificatonKey object:nil userInfo:@{KNetworkRequestError:response.msg, @"code":response.code}];
                    [subscriber sendError:[NSError errorWithDomain:KNetworkRequestErrorDomain code:KNetworkRequestErrorCode userInfo:@{KNetworkRequestError: response.msg}]];
                }
            }
            [subscriber sendCompleted];
        } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
            [[NSNotificationCenter defaultCenter] postNotificationName:KNetworkErrorNotificatonKey object:nil userInfo:@{KNetworkRequestError:KNetworkErrorInfo,@"code":@"-404"}];
            [subscriber sendError:[NSError errorWithDomain:KNetworkFailureDomain code:KNetworkFailureCode userInfo:@{KNetworkRequestError:KNetworkErrorInfo}]];
        }];
        return [RACDisposable disposableWithBlock:^{
            [request stop];
            KLog(@"----%s----, 信号被销毁", __func__);
        }];
    }] timeout:30 onScheduler:[RACScheduler mainThreadScheduler]];
}

+ (RACSignal *)rac_BatchAction:(YTKBatchRequest *)batchRequest resultClasses:(NSArray<Class> *)resultClasses {
    // TODO 判断网络状态,不可用返回
    if ([TGSystemHelper shareInstance].netWorkStatus == TGNetWorkStatusNoNetWork) {
        return [RACSignal error:[NSError errorWithDomain:KNetworkError code:KNetworkErrorCode userInfo:@{KNetworkRequestError:KNetworkErrorInfo, @"code":@"-505"}]];
    }
    return [[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [batchRequest startWithCompletionBlockWithSuccess:^(YTKBatchRequest * _Nonnull batchRequest) {
            NSArray *requests = batchRequest.requestArray;
            NSMutableArray *results = [NSMutableArray arrayWithCapacity:requests.count];
            for (int i = 0; i < requests.count; i ++) {
                BaseRequest *request = [requests objectAtIndex:i];
                Class clazz = [resultClasses objectAtIndex:i];
                BaseResponse *response = [BaseResponse mj_objectWithKeyValues:request.responseJSONObject];
                if (clazz != nil) { // 泛型不为空
                    if ([response.code isEqualToString:CODE_SUCCESS]) {
                        [results addObject:[clazz mj_objectWithKeyValues:response.data]];
                    } else {
                        [[NSNotificationCenter defaultCenter] postNotificationName:KNetworkErrorNotificatonKey object:nil userInfo:@{KNetworkRequestError:response.msg, @"code":response.code}];
                        [subscriber sendError:[NSError errorWithDomain:KNetworkRequestErrorDomain code:KNetworkRequestErrorCode userInfo:@{KNetworkRequestError:response.msg}]];
                    }
                } else { // 泛型为空
                    if ([response.code isEqualToString:CODE_SUCCESS]) {
                        [results addObject:response.data];
                    } else {
                        [[NSNotificationCenter defaultCenter] postNotificationName:KNetworkErrorNotificatonKey object:nil userInfo:@{KNetworkRequestError:response.msg, @"code":response.code}];
                        [subscriber sendError:[NSError errorWithDomain:KNetworkRequestErrorDomain code:KNetworkRequestErrorCode userInfo:@{KNetworkRequestError:response.msg}]];
                    }
                }
            }
            [subscriber sendNext:results];
            [subscriber sendCompleted];
        } failure:^(YTKBatchRequest * _Nonnull batchRequest) {
            [[NSNotificationCenter defaultCenter] postNotificationName:KNetworkErrorNotificatonKey object:nil userInfo:@{KNetworkRequestError:KNetworkFailureInfo, @"code":@"-404"}];
            [subscriber sendError:[NSError errorWithDomain:KNetworkFailureDomain code:KNetworkFailureCode userInfo:@{KNetworkRequestError:KNetworkFailureInfo}]];
        }];
        return [RACDisposable disposableWithBlock:^{
            [batchRequest stop];
            KLog(@"----%s----, 信号被销毁", __func__);
        }];
    }] timeout:30 onScheduler:[RACScheduler mainThreadScheduler]];
}

@end
