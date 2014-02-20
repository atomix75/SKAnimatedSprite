//
//  SKAnimatedSprite.m
//  

#import "SKAnimatedSprite.h"

@implementation SKAnimatedSprite {
    CGFloat frameIndex;
    CGFloat timePerFrame;
    CGFloat delta, previousElapsedTime, cumulativeTime;
}

+(instancetype)animatedSpriteWithTextureAtlas:(NSString *)atlas withNumberOfFrames:(CGFloat)numberOfFrames withInitialLoopDuration:(CGFloat)duration {
    
    return [[SKAnimatedSprite alloc] initWithTextureAtlas:atlas withNumberOfFrames:numberOfFrames withInitialLoopDuration:duration];
    
}


-(id)initWithTextureAtlas:(NSString *)atlas withNumberOfFrames:(CGFloat)numberOfFrames withInitialLoopDuration:(CGFloat)duration {
    
    if (self = [super init]) {
        
        _atlas = [SKTexture textureWithImageNamed:atlas];
        _currentFrame = [SKTexture textureWithRect:CGRectMake(0, 0, 1.0/numberOfFrames, 1.0) inTexture:_atlas];
        _sprite = [SKSpriteNode spriteNodeWithTexture:_currentFrame];
        
        
        timePerFrame = duration / (numberOfFrames);
        frameIndex = 0;
        

        
        _animate = [SKAction customActionWithDuration:duration actionBlock:^(SKNode *node, CGFloat elapsedTime) {

            
            if (elapsedTime > (frameIndex+1)*timePerFrame) {
                frameIndex++;
                
                if (frameIndex > numberOfFrames-1) {
                    frameIndex = 0;
                }
                //NSLog(@"%f/%f", frameIndex, numberOfFrames);
            }
            _currentFrame = [SKTexture textureWithRect:CGRectMake(frameIndex/numberOfFrames, 0, 1.0/numberOfFrames, 1.0) inTexture:_atlas];
            _sprite.texture = _currentFrame;
            
            previousElapsedTime = elapsedTime;
        }];
     
        
        [self addChild:_sprite];
        
        
    }
    
    
    return self;
}

-(void)startAnimationOnce {
    
    frameIndex = 0;
    
    SKAction *removeActions = [SKAction runBlock:^{
        [self removeAllActions];
    }];
    
    [_sprite runAction:[SKAction sequence:@[_animate,removeActions]]];
    

}

-(void)startAnimation {
    
    frameIndex = 0;
    
    [_sprite runAction:_animate completion:^{
        
        [self startAnimation];
        
    }];

    
    
    
}

-(void)stopAnimation {
    
    frameIndex = 0;
    
    [_sprite removeAllActions];
}
@end
