//
//  BinaryParser.m
//  PAMApp
//
//  Created by Craig Williford on 9/22/22.
//

#import "BinaryParser.h"

@implementation RCTBinaryParser

RCT_EXPORT_MODULE(BinaryParser);

RCT_EXPORT_METHOD(intToBytes:(NSNumber*_Nonnull)intV callback:(RCTResponseSenderBlock)callback)
{
  union {
    int val;
    int8_t bytes[4];
  } byteArray;
  byteArray.val = intV.intValue;
  
  NSMutableArray *data = [NSMutableArray array];
  [data addObject:@(byteArray.bytes[3])];
  [data addObject:@(byteArray.bytes[2])];
  [data addObject:@(byteArray.bytes[1])];
  [data addObject:@(byteArray.bytes[0])];
  callback(@[data]);
}

RCT_EXPORT_METHOD(bytesToInt:(double)b1 b2:(double)b2 b3:(double)b3 b4:(double)b4 callback:(RCTResponseSenderBlock)callback)
{
  union {
    int val;
    int8_t bytes[4];
  } byteArray;
  byteArray.bytes[3] = (char)b1;
  byteArray.bytes[2] = (char)b2;
  byteArray.bytes[1] = (char)b3;
  byteArray.bytes[0] = (char)b4;
  
  NSNumber* val = [NSNumber numberWithInt:byteArray.val];

  callback(@[val]);
}

RCT_EXPORT_METHOD(shortToBytes:(NSNumber*_Nonnull)shortV callback:(RCTResponseSenderBlock)callback)
{
  union {
    short val;
    int8_t bytes[2];
  } byteArray;
  byteArray.val = shortV.shortValue;
  
  NSMutableArray *data = [NSMutableArray array];
  [data addObject:@(byteArray.bytes[1])];
  [data addObject:@(byteArray.bytes[0])];
  callback(@[data]);
}

RCT_EXPORT_METHOD(bytesToShort:(double)b1 b2:(double)b2 callback:(RCTResponseSenderBlock)callback)
{
  union {
    short val;
    int8_t bytes[2];
  } byteArray;
  byteArray.bytes[1] = (char)b1;
  byteArray.bytes[0] = (char)b2;
  
  NSNumber* val = [NSNumber numberWithShort:byteArray.val];

  callback(@[val]);
}

RCT_EXPORT_METHOD(floatToBytes:(NSNumber*_Nonnull)floatV callback:(RCTResponseSenderBlock)callback)
{
  union {
    float val;
    int8_t bytes[4];
  } byteArray;
  byteArray.val = floatV.floatValue;
  
  NSMutableArray *data = [NSMutableArray array];
  [data addObject:@(byteArray.bytes[3])];
  [data addObject:@(byteArray.bytes[2])];
  [data addObject:@(byteArray.bytes[1])];
  [data addObject:@(byteArray.bytes[0])];
  callback(@[data]);
}

RCT_EXPORT_METHOD(bytesToFloat:(double)b1 b2:(double)b2 b3:(double)b3 b4:(double)b4 callback:(RCTResponseSenderBlock)callback)
{
  union {
    float val;
    int8_t bytes[4];
  } byteArray;
  byteArray.bytes[3] = (char)b1;
  byteArray.bytes[2] = (char)b2;
  byteArray.bytes[1] = (char)b3;
  byteArray.bytes[0] = (char)b4;
  
  NSNumber* val = [NSNumber numberWithFloat:byteArray.val];

  callback(@[val]);
}

@end