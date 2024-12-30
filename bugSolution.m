```objectivec
#import <Foundation/Foundation.h>

@interface MyClass : NSObject
@property (nonatomic, strong) NSString *myString;
@end

@implementation MyClass
- (void)dealloc {
    NSLog(@"MyClass deallocated");
}
@end

@interface MyObserver : NSObject
@property (nonatomic, weak) MyClass *observedObject;
@end

@implementation MyObserver
- (instancetype)initWithObservedObject:(MyClass *)object {
    self = [super init];
    if (self) {
        self.observedObject = object;
        [object addObserver:self forKeyPath:@"myString" options:NSKeyValueObservingOptionNew context:NULL];
    }
    return self;
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@