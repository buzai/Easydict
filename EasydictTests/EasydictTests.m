//
//  EasydictTests.m
//  EasydictTests
//
//  Created by tisfeng on 2023/10/10.
//  Copyright © 2023 izual. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "EZAppleService.h"
#import "NSString+EZUtils.h"
#import "NSString+EZHandleInputText.h"

@interface EasydictTests : XCTestCase

@property (nonatomic, strong) EZAppleService *appleService;

@end

@implementation EasydictTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.appleService = [[EZAppleService alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    /**
     // These values will persist after the process is killed by the system
     // and remain available via the same object.
     
     hi
     
     // good girl.
     // good boy.
     
     hello
     
     */
    NSString *text = @" // These values will persist after the process is killed by the system\n// and remain available via the same object.\n\nhi\n\n// good girl.\n// good boy.\n\nhello";
    NSString *result = [text removeCommentSymbolPrefixAndJoinTexts];
    NSLog(@"result: %@", result);
}

- (void)testDetectLanguage {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    NSString *text = @"Four score and seven years ago our fathers brought forth on this continent, a new nation, conceived in Liberty, and dedicated to the proposition that all men are created equal.\n\nNow we are engaged in a great civil war, testing whether that nation, or any nation so conceived and so dedicated, can long endure. We are met on a great battle-field of that war. We have come to dedicate a portion of that field, as a final resting place for those who here gave their lives that that nation might live. It is altogether fitting and proper that we should do this.\n\nBut, in a larger sense, we can not dedicate—we can not consecrate—we can not hallow—this ground. The brave men, living and dead, who struggled here, have consecrated it, far above our poor power to add or detract. The world will little note, nor long remember what we say here, but it can never forget what they did here. It is for us the living, rather, to be dedicated here to the unfinished work which they who fought here have thus far so nobly advanced. It is rather for us to be here dedicated to the great task remaining before us—that from these honored dead we take increased devotion to that cause for which they gave the last full measure of devotion—that we here highly resolve that these dead shall not have died in vain—that this nation, under God, shall have a new birth of freedom—and that government of the people, by the people, for the people, shall not perish from the earth.";
    
    NSArray *words = [text wordsInText];
    
    for (NSString *word in words) {
        if (!word.length) {
            continue;;
        }
        
        EZLanguage language = [self.appleService detectText:word];
        if (![language isEqualToString:EZLanguageEnglish]) {
            NSLog(@"Detected language wrongly: %@ (%@)", word, language);
        }
    }
}



- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
