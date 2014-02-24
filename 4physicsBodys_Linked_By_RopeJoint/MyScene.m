//
//  MyScene.m
//  4physicsBodys_Linked_By_RopeJoint
//
//  Created by YG on 2/17/14.
//  Copyright (c) 2014 YuryGitman. All rights reserved.
//


#import "MyScene.h"

@interface MyScene()
@property SKSpriteNode* mySquare1;
@property SKSpriteNode* mySquare2;
@property SKSpriteNode* mySquare3;
@property SKSpriteNode* mySquare4;
@property SKSpriteNode* mySquare5;
@property SKSpriteNode* mySquare6;
@property SKSpriteNode* mySquare7;
@property SKSpriteNode* mySquare8;
@property bool isRelease;




@property SKSpriteNode* myShelf;

//@property SKShapeNode* myShape;

@property SKPhysicsJoint* myRopeJoint;
@property SKPhysicsJoint* myRopeJoint1;
@property SKPhysicsJoint* myRopeJoint2;
@property SKPhysicsJoint* myRopeJoint3;
@property SKPhysicsJoint* myRopeJoint4;
@property SKPhysicsJoint* myRopeJoint5;
@property SKPhysicsJoint* myRopeJoint6;
@property SKPhysicsJointSpring* myRopeJoint7;


@end




@implementation MyScene

-(void) activateJointRope{
    
    _myRopeJoint = [SKPhysicsJointLimit jointWithBodyA:_mySquare1.physicsBody bodyB:_mySquare2.physicsBody anchorA:_mySquare1.position anchorB:_mySquare2.position];
    
    [self.physicsWorld addJoint:_myRopeJoint];
    
    _myRopeJoint1 = [SKPhysicsJointLimit jointWithBodyA:_mySquare2.physicsBody bodyB:_mySquare3.physicsBody anchorA:_mySquare2.position anchorB:_mySquare3.position];
    
    [self.physicsWorld addJoint:_myRopeJoint1];
    
    
    _myRopeJoint2 = [SKPhysicsJointLimit jointWithBodyA:_mySquare3.physicsBody bodyB:_mySquare4.physicsBody anchorA:_mySquare3.position anchorB:_mySquare4.position];
    
    [self.physicsWorld addJoint:_myRopeJoint2];
    
    _myRopeJoint3 = [SKPhysicsJointLimit jointWithBodyA:_mySquare4.physicsBody bodyB:_mySquare5.physicsBody anchorA:_mySquare4.position anchorB:_mySquare5.position];
    
    [self.physicsWorld addJoint:_myRopeJoint3];
    
    _myRopeJoint4 = [SKPhysicsJointLimit jointWithBodyA:_mySquare5.physicsBody bodyB:_mySquare6.physicsBody anchorA:_mySquare5.position anchorB:_mySquare6.position];
    
    [self.physicsWorld addJoint:_myRopeJoint4];
    
    
    _myRopeJoint5 = [SKPhysicsJointLimit jointWithBodyA:_mySquare6.physicsBody bodyB:_mySquare7.physicsBody anchorA:_mySquare6.position anchorB:_mySquare7.position];
    
    [self.physicsWorld addJoint:_myRopeJoint5];
    
    _myRopeJoint6 = [SKPhysicsJointLimit jointWithBodyA:_mySquare7.physicsBody bodyB:_mySquare8.physicsBody anchorA:_mySquare7.position anchorB:_mySquare8.position];
    
    [self.physicsWorld addJoint:_myRopeJoint6];
    
    _myRopeJoint7 = [SKPhysicsJointSpring jointWithBodyA:_mySquare1.physicsBody bodyB: _myShelf.physicsBody anchorA:_mySquare1.position anchorB: CGPointMake(self.size.width*40/200, 100)];
    _myRopeJoint7.frequency = 2;
    
    [self.physicsWorld addJoint:_myRopeJoint7];
    
    
}

-(void) spawnSquares{
    _mySquare1 = [[SKSpriteNode alloc]initWithColor:[SKColor redColor] size:CGSizeMake(8, 8)];
    _mySquare2 = [[SKSpriteNode alloc]initWithColor:[SKColor purpleColor] size:CGSizeMake(7, 7)];
    _mySquare3 = [[SKSpriteNode alloc]initWithColor:[SKColor orangeColor] size:CGSizeMake(6, 6)];
    _mySquare4 = [[SKSpriteNode alloc]initWithColor:[SKColor yellowColor] size:CGSizeMake(5, 5)];
    _mySquare5 = [[SKSpriteNode alloc]initWithColor:[SKColor redColor] size:CGSizeMake(4, 4)];
    _mySquare6 = [[SKSpriteNode alloc]initWithColor:[SKColor purpleColor] size:CGSizeMake(3, 3)];
    _mySquare7 = [[SKSpriteNode alloc]initWithColor:[SKColor orangeColor] size:CGSizeMake(2, 2)];
    _mySquare8 = [[SKSpriteNode alloc]initWithColor:[SKColor yellowColor] size:CGSizeMake(1, 1)];
    
    [_mySquare1 setPosition:CGPointMake(self.size.width*40/200, 100)];
    [_mySquare2 setPosition:CGPointMake(self.size.width*32/200, 100)];
    [_mySquare3 setPosition:CGPointMake(self.size.width*25/200, 100)];
    [_mySquare4 setPosition:CGPointMake(self.size.width*19/200, 100)];
    [_mySquare5 setPosition:CGPointMake(self.size.width*14/200, 100)];
    [_mySquare6 setPosition:CGPointMake(self.size.width*10/200, 100)];
    [_mySquare7 setPosition:CGPointMake(self.size.width*7/200, 100)];
    [_mySquare8 setPosition:CGPointMake(self.size.width*5/200, 100)];
    
    
    
//    _mySquare1.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquare1.size];
//    _mySquare2.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquare2.size];

    _mySquare1.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:4];
    _mySquare2.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:3.5];

    _mySquare3.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquare3.size];
    _mySquare4.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquare4.size];
    _mySquare5.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquare1.size];
    _mySquare6.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquare2.size];
    _mySquare7.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquare3.size];
    _mySquare8.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquare4.size];
    
    _mySquare1.physicsBody.mass = 1;
    _mySquare2.physicsBody.mass = 0.0000001;
    _mySquare3.physicsBody.mass = 0.0000001;
    _mySquare4.physicsBody.mass = 0.0000001;
    _mySquare5.physicsBody.mass = 0.0000001;
    _mySquare6.physicsBody.mass = 0.0000001;
    _mySquare7.physicsBody.mass = 0.0000001;
    _mySquare8.physicsBody.mass = 0.00001;

    
    [_mySquare1.physicsBody setRestitution:0];
    [_mySquare2.physicsBody setRestitution:1];
    [_mySquare3.physicsBody setRestitution:1];
    [_mySquare4.physicsBody setRestitution:1];
    [_mySquare5.physicsBody setRestitution:1];
    [_mySquare6.physicsBody setRestitution:1];
    [_mySquare7.physicsBody setRestitution:1];
    [_mySquare8.physicsBody setRestitution:1];
    
    [self addChild:_mySquare1];
    [self addChild:_mySquare2];
    [self addChild:_mySquare3];
    [self addChild:_mySquare4];
    [self addChild:_mySquare5];
    [self addChild:_mySquare6];
    [self addChild:_mySquare7];
    [self addChild:_mySquare8];
    
}

-(void)makeShelf{
    _myShelf = [[SKSpriteNode alloc]initWithColor:[SKColor lightGrayColor] size:CGSizeMake(4, 100)];
    _myShelf.position = CGPointMake(self.size.width*40/200, 50);
    _myShelf.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_myShelf.size];
    _myShelf.physicsBody.collisionBitMask = 0x0;
    [_myShelf.physicsBody setDynamic:NO];
    
    
//    _myShape = [[SKShapeNode alloc]init];
//    CGMutablePathRef myPath = CGPathCreateMutable();
    [self addChild:_myShelf];

    
//
//    CGPathAddRect(myPath, NULL, CGRectMake(200, 200, 100, 100));
//    _myShape.path = myPath;
//    [_myShape setFillColor:[UIColor orangeColor]];
//    [_myShape setStrokeColor:[UIColor blackColor]];
//    _myShape.position = CGPointMake(0, 0);
//    _myShape.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: CGSizeMake(200, 200)];
//    [_myShape.physicsBody setDynamic:NO];
//    [self addChild:_myShape];
//    
    
    
    
    
    
}

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        _isRelease = false;
        
        self.scaleMode = SKSceneScaleModeAspectFit;
//        self.scaleMode = SKSceneScaleModeResizeFill;
//        self.scaleMode = SKSceneScaleModeFill;
//        self.scaleMode = SKSceneScaleModeAspectFill;

        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
//        NSLog(@"David: %f, %f", self.frame.size.width, self.frame.size.height);
//        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:CGRectMake(0, -self.frame.size.width, self.frame.size.height, self.frame.size.width)];

//        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(self.frame.size.height, self.frame.size.width)];
        [self.physicsBody setRestitution:0];
        
        
        
        [self spawnSquares];
        
        [self makeShelf];
        [self activateJointRope];

        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
//
//    if(_isRelease == TRUE){
//        [_mySquare1 setPosition:CGPointMake(self.size.width*1/4, 100)];
//        [self.physicsWorld addJoint:_myRopeJoint7];
//        _isRelease = false;
//    }
    
    if (_mySquare1.physicsBody.dynamic) {
        [_mySquare1.physicsBody setDynamic:NO];
    }
    
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        [_mySquare1 setPosition:location];
        
    }
    
   

}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        [_mySquare1 setPosition:location];
        
    }
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event  {
    
    if (!_mySquare1.physicsBody.dynamic) {
        [_mySquare1.physicsBody setDynamic:YES];
    }
    _isRelease = TRUE;
}

-(void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if (!_mySquare1.physicsBody.dynamic) {
        
        [_mySquare1.physicsBody setDynamic:YES];
    }
}


-(void)update:(CFTimeInterval)currentTime {
    
    if (_mySquare1.position.x > self.size.width*1/4 && _isRelease == TRUE){
        [self.physicsWorld removeJoint:_myRopeJoint7];
        _myShelf.physicsBody = Nil;
    }
    
    
    /* Called before each frame is rendered */
}


@end

