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

@property SKShapeNode* dragZone;
@property SKShapeNode* goalZone;


@property SKShapeNode* yourline;

@property SKLabelNode* dragLabel;
@property SKLabelNode* arrowLable;
@property SKLabelNode* hitMeLabel;
@property SKLabelNode* scoreLable;
@property SKLabelNode* prizeLable;


@property CGMutablePathRef pathToDraw;

@property int score;


@property bool isRelease;
@property bool mySquare1Gone;




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
    _myShelf = [[SKSpriteNode alloc]initWithColor:[SKColor lightGrayColor] size:CGSizeMake(4, 90)];
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
    
    
    _prizeLable = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    _prizeLable.text = @"";
    _prizeLable.fontSize = 40;
    _prizeLable.position = CGPointMake(CGRectGetMidX(_scoreLable.frame), 80);
    
    [self addChild:_prizeLable];
    [_prizeLable runAction:[SKAction scaleBy:0.2 duration:0.01]];
    
    
    CGMutablePathRef pathForFork = CGPathCreateMutable();
    SKShapeNode *fork = [SKShapeNode node];
    
    CGPathMoveToPoint(pathForFork, NULL, self.size.width*43/200,_myShelf.frame.size.height+10);
    CGPathAddLineToPoint(pathForFork, NULL, CGRectGetMidX(_myShelf.frame), _myShelf.frame.size.height+2);
    CGPathAddLineToPoint(pathForFork, NULL, self.size.width*37/200,_myShelf.frame.size.height+10);
    fork.path = pathForFork;
    [fork setLineWidth:2];
    [fork setStrokeColor:[SKColor lightGrayColor]];
    [self addChild:fork];

    
    _yourline = [SKShapeNode node];
    _pathToDraw = CGPathCreateMutable();
    
    CGPathMoveToPoint(_pathToDraw, NULL, self.size.width*43/200,_myShelf.frame.size.height+10);
    CGPathAddLineToPoint(_pathToDraw, NULL, _mySquare1.position.x,  _mySquare1.position.y);
    CGPathAddLineToPoint(_pathToDraw, NULL, self.size.width*37/200,_myShelf.frame.size.height+10);
    _yourline.path = _pathToDraw;
    [_yourline setLineWidth:0.5];
    [_yourline setStrokeColor:[UIColor redColor]];
    [self addChild:_yourline];
    
    
 
    
}


-(void)makeBackground{
    
    _dragZone = [[SKShapeNode alloc]init];
    CGMutablePathRef dragZonePath = CGPathCreateMutable();
    CGPathAddRect(dragZonePath, NULL, CGRectMake(0, 0, self.size.width*40/200, self.size.height));
    _dragZone.path = dragZonePath;
    [_dragZone setFillColor:[UIColor greenColor]];
    [_dragZone setAlpha:0.1];
    [_dragZone setPosition: CGPointMake(0, 0)];
    [self addChild:_dragZone];
    
    
    _goalZone = [[SKShapeNode alloc]init];
    CGMutablePathRef goalZonePath = CGPathCreateMutable();
    CGPathAddRect(goalZonePath, NULL, CGRectMake(0, 0, self.size.width*20/200, self.size.width*20/200));
    _goalZone.path = goalZonePath;
    [_goalZone setFillColor:[UIColor redColor]];
    [_goalZone setAlpha:0.5];
    [_goalZone setPosition: CGPointMake(self.size.width*160/200, self.size.height*70/100)];
    [self addChild:_goalZone];
    
    
    
        /* Setup your scene here */
        
    
    _dragLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
    _dragLabel.text = @"Drag";
    _dragLabel.fontSize = 14;
    _dragLabel.position = CGPointMake(50,230);
    [self addChild: _dragLabel];
    
    _arrowLable = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    _arrowLable.text = @"▽";
    _arrowLable.fontSize = 14;
    _arrowLable.position = CGPointMake(CGRectGetMidX(_dragLabel.frame), 210);
                            
    [self addChild: _arrowLable];
    
    
    _hitMeLabel  = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    _hitMeLabel.text = @"Hit";
    _hitMeLabel.fontSize = 20;
    _hitMeLabel.position = CGPointMake(CGRectGetMidX(_goalZone.frame), CGRectGetMidY(_goalZone.frame));
    [self addChild: _hitMeLabel];
    
    _scoreLable = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];

    _scoreLable.text = @"";
    _scoreLable.fontSize = 1;
    _scoreLable.position = CGPointMake(CGRectGetMidX(self.frame), 230);
    [self addChild: _scoreLable];

    
    
    


}

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        _isRelease = false;
        _mySquare1Gone = false;
        _score = 0;
        
        self.scaleMode = SKSceneScaleModeAspectFit;
//        self.scaleMode = SKSceneScaleModeResizeFill;
//        self.scaleMode = SKSceneScaleModeFill;
//        self.scaleMode = SKSceneScaleModeAspectFill;

        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
//        NSLog(@"David: %f, %f", self.frame.size.width, self.frame.size.height);
//        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:CGRectMake(0, -self.frame.size.width, self.frame.size.height, self.frame.size.width)];

//        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(self.frame.size.height, self.frame.size.width)];
        
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];

        [self.physicsBody setRestitution:0];
        
        
        [self makeBackground];
        [self makeShelf];
        [self spawnSquares];
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
    
    if (_isRelease == false){
        _dragLabel.text = @"Release!";
        _dragLabel.fontSize = 15;
        _dragLabel.position = CGPointMake(45,230);
        _arrowLable.hidden = true;
    }
    
   

}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        if (_mySquare1Gone == false){
            CGPoint location = [touch locationInNode:self];
            [_mySquare1 setPosition:location];
        }
    }
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event  {
    
    if (!_mySquare1.physicsBody.dynamic) {
        [_mySquare1.physicsBody setDynamic:YES];
    }
    _dragLabel.text = @"PEW!";
    _dragLabel.fontSize = 20;
    _dragLabel.position = CGPointMake(50,230);
    _isRelease = TRUE;
}

-(void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if (!_mySquare1.physicsBody.dynamic) {
        
        [_mySquare1.physicsBody setDynamic:YES];
    }
}

-(void)checkGoal{
    if([self checkInBox:_mySquare1.position]){
        
        [self.physicsWorld removeJoint:_myRopeJoint];
        _mySquare1Gone = true;
        _mySquare1.hidden = true;
        _mySquare1.physicsBody = nil;
        _mySquare1.position = CGPointMake(1000, 1000);
    }
    if([self checkInBox:_mySquare2.position]){
        [self.physicsWorld removeJoint:_myRopeJoint];
        [self.physicsWorld removeJoint:_myRopeJoint1];
        _mySquare2.hidden = true;
        _mySquare2.physicsBody = nil;
        _mySquare2.position = CGPointMake(1000, 1000);

    }
    if([self checkInBox:_mySquare3.position]){
        [self.physicsWorld removeJoint:_myRopeJoint1];
        [self.physicsWorld removeJoint:_myRopeJoint2];
        _mySquare3.hidden = true;
        _mySquare3.physicsBody = nil;
        _mySquare3.position = CGPointMake(1000, 1000);

    }
    if([self checkInBox:_mySquare4.position]){
        [self.physicsWorld removeJoint:_myRopeJoint2];
        [self.physicsWorld removeJoint:_myRopeJoint3];
        _mySquare4.hidden = true;
        _mySquare4.physicsBody = nil;
        _mySquare4.position = CGPointMake(1000, 1000);

    }
    if([self checkInBox:_mySquare5.position]){
        [self.physicsWorld removeJoint:_myRopeJoint3];
        [self.physicsWorld removeJoint:_myRopeJoint4];
        _mySquare5.hidden = true;
        _mySquare5.physicsBody = nil;
        _mySquare5.position = CGPointMake(1000, 1000);

    }
    if([self checkInBox:_mySquare6.position]){
        [self.physicsWorld removeJoint:_myRopeJoint4];
        [self.physicsWorld removeJoint:_myRopeJoint5];
        _mySquare6.hidden = true;
        _mySquare6.physicsBody = nil;
        _mySquare6.position = CGPointMake(1000, 1000);

    }
    if([self checkInBox:_mySquare7.position]){
        [self.physicsWorld removeJoint:_myRopeJoint5];
        [self.physicsWorld removeJoint:_myRopeJoint6];
        _mySquare7.hidden = true;
        _mySquare7.physicsBody = nil;
        _mySquare7.position = CGPointMake(1000, 1000);

    }
    if([self checkInBox:_mySquare8.position]){
        [self.physicsWorld removeJoint:_myRopeJoint6];
        [self.physicsWorld removeJoint:_myRopeJoint7];
        _mySquare8.hidden = true;
        _mySquare8.physicsBody = nil;
        _mySquare8.position = CGPointMake(1000, 1000);


    }
}

-(bool)checkInBox: (CGPoint)location{
    if(location.x > _goalZone.position.x && location.x < _goalZone.position.x + _goalZone.frame.size.width
       && location.y > _goalZone.position.y && location.y < _goalZone.position.y + _goalZone.frame.size.height){
        [self getScore];
        return true;
    }
    
    return false;
}

-(void)getScore{
    _score++;
    [_scoreLable setText:[NSString stringWithFormat:@"Score: %d", _score]];
    _scoreLable.fontSize = 8+_score*5;
    
    if(_score == 8){
        _prizeLable.text = @"You Are Awesome!!";
        [_prizeLable runAction:[SKAction rotateByAngle: -6.28 duration:0.3]];
        [_prizeLable runAction:[SKAction scaleBy:4 duration:0.3]];
    }
    
}

-(void)update:(CFTimeInterval)currentTime {
    
    if (_mySquare1.position.x > self.size.width*1/4 && _isRelease == TRUE){
        [self.physicsWorld removeJoint:_myRopeJoint7];
        _myShelf.physicsBody = Nil;
        [self checkGoal];
        _yourline.hidden = true;
    }else{
        _pathToDraw = CGPathCreateMutable();
        CGPathMoveToPoint(_pathToDraw, NULL, self.size.width*43/200,_myShelf.frame.size.height+10);
        CGPathAddLineToPoint(_pathToDraw, NULL, _mySquare1.position.x,  _mySquare1.position.y);
        CGPathAddLineToPoint(_pathToDraw, NULL, self.size.width*37/200,_myShelf.frame.size.height+10);
        _yourline.path = _pathToDraw;
    }
    /* Called before each frame is rendered */
}



@end

