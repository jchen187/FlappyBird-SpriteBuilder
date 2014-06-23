#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here
    character = (Character *)[CCBReader load:@"Character"];
    [physicsNode addChild:character];
    [self addObstacle];
    timeSinceObstacle = 0.0f;
}

-(void)update:(CCTime)delta
{
    // this will be run every frame
    // delta is the time that has elapsed since the last time it was run. This is usually 1/60 but can be bigger if the game is slower
    
    //increment the time since the last obstacle
    timeSinceObstacle += delta; //delta is approximately 1/60 of a sec
    
    //check to see if two seconds have passed
    if (timeSinceObstacle > 2.0f)
    {
        //add a new obstacle
        [self addObstacle];
        
        //then reset the timer
        timeSinceObstacle = 0.0f;
    }
}

// put new methods here
- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    //this will be called everytime the player touches the screen
    [character flap];
}

@end
