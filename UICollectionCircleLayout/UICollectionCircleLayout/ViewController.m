//
//  ViewController.m
//  UICollectionCircleLayout
//
//  Created by facilityone on 2021/9/1.
//

#import "ViewController.h"
#import "XSCircleLayout.h"

#define ScrWidth [UIScreen mainScreen].bounds.size.width
#define ScrHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)UICollectionView *mtagCollectionView;

@end

@implementation ViewController

- (UICollectionView *)mtagCollectionView{

    if (_mtagCollectionView ==nil) {

        XSCircleLayout *layout = [[XSCircleLayout alloc] init];

        _mtagCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];

        _mtagCollectionView.delegate = self;
        _mtagCollectionView.dataSource = self;
        _mtagCollectionView.backgroundColor = [UIColor greenColor];
    }
    return _mtagCollectionView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.mtagCollectionView.frame = CGRectMake(0, 0, ScrWidth, ScrHeight);
    [self.view addSubview:self.mtagCollectionView];

    
    
}

#pragma mark collectionView代理方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
  
    return 15;
    

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    __weak typeof(self) weakSelf=self;

    NSString *identifier=[NSString stringWithFormat:@"%ld%ld",(long)indexPath.section,(long)indexPath.row];

    [self.mtagCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:identifier];
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];

    return cell;

}


@end
