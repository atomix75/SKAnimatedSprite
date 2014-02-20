//
//  SKAnimatedSprite.h
// 


#import <SpriteKit/SpriteKit.h>

@interface SKAnimatedSprite : SKNode

@property (strong, nonatomic) SKTexture *atlas;
@property (strong, nonatomic) SKTexture *currentFrame;
@property (strong, nonatomic) SKSpriteNode *sprite;
@property (strong, nonatomic) SKAction *animate;
@property (strong, nonatomic) SKAction *idle;
@property (strong, nonatomic) SKAction *walk;
@property (readwrite, nonatomic) BOOL walking;
@property (readwrite, nonatomic) BOOL mirrored;

+(instancetype)animatedSpriteWithTextureAtlas:(NSString *)atlas withNumberOfFrames:(CGFloat)numberOfFrames withInitialLoopDuration:(CGFloat)duration;
-(id)initWithTextureAtlas:(NSString *)atlas withNumberOfFrames:(CGFloat)numberOfFrames withInitialLoopDuration:(CGFloat)duration;
-(void)startAnimation;
-(void)startAnimationOnce;
-(void)stopAnimation;

@end
