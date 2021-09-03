//
//  XSCircleLayout.m
//  UICollectionCircleLayout
//
//  Created by facilityone on 2021/9/1.
//

#import "XSCircleLayout.h"

@interface XSCircleLayout()

@property(nonatomic,strong)NSMutableArray *itemsArry;

@end

@implementation XSCircleLayout

-(void)prepareLayout{
    [super prepareLayout];
    
    self.itemCountNum = [self.collectionView numberOfItemsInSection:0];
    self.itemsArry = [NSMutableArray array];
    
    //以最短的边为直径，然后求出半径
    CGFloat radius = MIN(self.collectionView.frame.size.width, self.collectionView.frame.size.height)/2;
    //以中心作为圆心
//    CGPoint circleCenter = self.collectionView.center;
    CGPoint circleCenter = CGPointMake(self.collectionView.frame.size.width/2, self.collectionView.frame.size.height/2+self.collectionView.contentOffset.y);

    NSInteger offsety = self.collectionView.contentOffset.y;

    
    for ( NSInteger i=0; i<self.itemCountNum; i++) {
        UICollectionViewLayoutAttributes *attributs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        attributs.size = CGSizeMake(60, 60);
        
        //计算每一个item的左上角坐标
        //取出item的数量，然后平分圆的角度，用三角函数求出圆弧上的某一点，减去半径就是起始点
        //radius-num,num不要超过iteam的一般，不然布局会超过屏宽
        float x = circleCenter.x+cosf(2*M_PI/self.itemCountNum*i)*(radius-20+offsety);
        float y = circleCenter.y+sinf(2*M_PI/self.itemCountNum*i)*(radius-20+offsety);
        
        attributs.center = CGPointMake(x, y);
        
        [self.itemsArry addObject:attributs];
        
    }
    
}

//返回yes，则一有变化就会刷新布局
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
    
}

-(CGSize)collectionViewContentSize{
    return CGSizeMake(self.collectionView.frame.size.width, self.collectionView.frame.size.height*[self.collectionView numberOfItemsInSection:0]);
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return self.itemsArry;
}


@end
