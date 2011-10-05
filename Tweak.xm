#import <UIKit/UIKit.h>
#import <SpringBoard/SpringBoard.h>

@interface SBAwayLockBar : UIView
-(void)unlock;
@end

@interface UIApplication (BrightUnlock)
-(void)setBacklightLevel:(float)level permanently:(BOOL)permanently;
-(float)currentBacklightLevel;
@end

static float brightnessValue;
static float userBrightness;
static BOOL isEnabled;
static BOOL isFullyDragged;
static BOOL isGreater;



%hook SBAwayLockBar
-(void)downInKnob{
	%log;
	brightnessValue=[[UIApplication sharedApplication] currentBacklightLevel];
	NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.zabirauf.unlockbright.plist"];

	isEnabled=![[dict objectForKey:@"Enabled"] boolValue];
	isFullyDragged=NO;
    	

		userBrightness=(float)[[dict 
objectForKey:@"BrightnessVal"] floatValue];
		
		if(userBrightness>brightnessValue)
			isGreater=YES;
		else
			isGreater=NO;
		
		NSLog(@"The value is %f",userBrightness);
	[dict release];
	%orig;
	
}
-(void)upInKnob{
	%log;
	%orig;
	if(isEnabled==YES){
		[[UIApplication sharedApplication] setBacklightLevel:brightnessValue permanently:YES];
		
		if(isFullyDragged==YES)
			[self unlock];
	}
}


-(void)knobDragged:(float)dragged
{  
    %log;

	float temp=userBrightness-brightnessValue;
    float diff=(temp > 0) ? temp : -temp ;
	
	float factor=dragged*diff;
	if(isGreater==NO)
		factor=-factor;
		
	NSLog(@"the factor %f",factor);
		
    if(isEnabled==YES)
	[[UIApplication sharedApplication] setBacklightLevel:(brightnessValue+factor) permanently:NO];
    
    %orig;
    if(isEnabled==YES && dragged==1.0f)
	isFullyDragged=YES;
    else
	isFullyDragged=NO;
}

-(void)unlock
{
    %log;
    if(isEnabled==YES)
	[[UIApplication sharedApplication] setBacklightLevel:brightnessValue permanently:YES];
    %orig;    
}


%end
