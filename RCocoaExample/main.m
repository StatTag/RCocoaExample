//
//  main.m
//  RCocoaExample
//
//  Created by Luke Rasmussen on 6/5/19.
//  Copyright © 2019 StatTag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RCocoa/RCocoa.h>

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    RCEngine* Engine = [RCEngine GetInstance];
    RCSymbolicExpression* result = [Engine Evaluate:
        @"setNames(data.frame("
         "matrix(c(1,2,3,4,5,6),nrow=3,ncol=2)),"
         "c(\"a\",\"b\"))"];
    if ([result IsDataFrame]) {
      RCDataFrame* data = [result AsDataFrame];
      int numCol = [data ColumnCount];
      for (int colIdx = 0; colIdx < numCol; colIdx++) {
        NSArray<NSString*>* column =
            [[data ElementAt:colIdx] AsCharacter];
        int numRow = [column count];
        for (int rowIdx = 0; rowIdx < numRow; rowIdx++) {
          NSLog(@"%@", [column objectAtIndex:rowIdx]);
        }
      }
    }
  }
  return 0;
}
