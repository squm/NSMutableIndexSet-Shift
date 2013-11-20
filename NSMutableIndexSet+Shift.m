#import "NSMutableIndexSet+Shift.h"

@implementation NSMutableIndexSet (Shift)
- (void)
shiftDec:(NSUInteger)start {
	// decrease each index from 'start' to the right (last)
	
	NSIndexSet *indexSet = [self copy];
	[self removeAllIndexes];

	[indexSet enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
		if (idx > start) {
			[self addIndex:idx - 1];
		}
		else {
			[self addIndex:idx];
		}
	}];
}
- (void)
shift:(NSUInteger)index {
	// remove item and move rows up
	[self removeIndex:index];
	[self shiftDec:index];
}

@end
