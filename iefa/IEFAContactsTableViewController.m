//
//  IEFAContactsTableViewController.m
//  iefa
//
//  Created by Khoren Markosyan on 28.06.16.
//  Copyright © 2016 Paruyr Danielian. All rights reserved.
//

#import "IEFAContactsTableViewController.h"
#import "IEFAConstants.h"
#import "IEFAContactsHeaderView.h"

@interface IEFAContactModel : NSObject

@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSString *phoneNumber;

+ (instancetype)contactWithFullName:(NSString *)fullName phoneNumber:(NSString *)phoneNumber;

- (instancetype)initWithFullName:(NSString *)fullName phoneNumber:(NSString *)phoneNumber;

@end

@implementation IEFAContactModel

+ (instancetype)contactWithFullName:(NSString *)fullName phoneNumber:(NSString *)phoneNumber {
    return [[IEFAContactModel alloc]initWithFullName:fullName phoneNumber:phoneNumber];
}

- (instancetype)initWithFullName:(NSString *)fullName phoneNumber:(NSString *)phoneNumber {
    
    self = [super init];
    if (self) {
        self.fullName = fullName;
        self.phoneNumber = phoneNumber;
    }
    return self;
}

@end


@interface IEFAContactSectionModel : NSObject

@property (nonatomic, strong) NSString *sectionHeaderTitle;
@property (nonatomic, strong) NSMutableArray *contacts;

+ (instancetype)sectionModelWithSectionHeaderTitle:(NSString *)title;

- (instancetype)initWithSectionHeaderTitle:(NSString *)title;

@end

@implementation IEFAContactSectionModel

+ (instancetype)sectionModelWithSectionHeaderTitle:(NSString *)title {
    return [[IEFAContactSectionModel alloc]initWithSectionHeaderTitle:title];
}

- (instancetype)initWithSectionHeaderTitle:(NSString *)title {
    
    self = [super init];
    if (self) {
        self.sectionHeaderTitle = title;
    }
    return self;
}

@end




@interface IEFAContactsTableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation IEFAContactsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"IEFAContactsHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"IEFAContactsHeaderView"];
    
    self.tableView.estimatedRowHeight = 20;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.tableView.sectionHeaderHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedSectionHeaderHeight = 10;
    
    
    IEFAContactSectionModel *section0 =
    [IEFAContactSectionModel sectionModelWithSectionHeaderTitle:@"Head Organisers"];
    section0.contacts = [@[[IEFAContactModel contactWithFullName:@"Nune Hayrapetyan" phoneNumber:@"+374 94 600210"],
                           [IEFAContactModel contactWithFullName:@"Arman Gasparian" phoneNumber:@"+374 94 934488"]] mutableCopy];
    
    IEFAContactSectionModel *section1 =
    [IEFAContactSectionModel sectionModelWithSectionHeaderTitle:@"Chairs Support"];
    section1.contacts = [@[[IEFAContactModel contactWithFullName:@"Tigran Bazarchyan" phoneNumber:@"+374 55 520339"]] mutableCopy];
    
    IEFAContactSectionModel *section2 =
    [IEFAContactSectionModel sectionModelWithSectionHeaderTitle:@"Outreach, Media and PR"];
    section2.contacts = [@[[IEFAContactModel contactWithFullName:@"Tatev Mkrtumyan" phoneNumber:@"+374 91 704515"],
                           [IEFAContactModel contactWithFullName:@"Davit Kocharyan" phoneNumber:@"+374 93 714664"],
                           [IEFAContactModel contactWithFullName:@"Elen Simonyan" phoneNumber:@"+374 77 533035"]] mutableCopy];
    
    IEFAContactSectionModel *section3 =
    [IEFAContactSectionModel sectionModelWithSectionHeaderTitle:@"Food and Inventory"];
    section3.contacts = [@[[IEFAContactModel contactWithFullName:@"Aram Khanlari" phoneNumber:@"+374 55 258533"]] mutableCopy];
    
    IEFAContactSectionModel *section4 =
    [IEFAContactSectionModel sectionModelWithSectionHeaderTitle:@"Committee on Economic and Monetary Affairs (ECON)"];
    section4.contacts = [@[[IEFAContactModel contactWithFullName:@"Levon Hayrapetyan" phoneNumber:@"+374 99 966615"]] mutableCopy];
    
    IEFAContactSectionModel *section5 =
    [IEFAContactSectionModel sectionModelWithSectionHeaderTitle:@"Committee on Legal Affairs (JURI)"];
    section5.contacts = [@[[IEFAContactModel contactWithFullName:@"Yeva Gharibyan" phoneNumber:@"+374 94 280842"]] mutableCopy];
    
    IEFAContactSectionModel *section6 =
    [IEFAContactSectionModel sectionModelWithSectionHeaderTitle:@"Committee on Civil Liberties, Justice and Home Affairs (LIBE)"];
    section6.contacts = [@[[IEFAContactModel contactWithFullName:@"Mher Makaryan" phoneNumber:@"+374 55 663938"]] mutableCopy];
    
    IEFAContactSectionModel *section7 =
    [IEFAContactSectionModel sectionModelWithSectionHeaderTitle:@"Committee on Human Rights (DROI)"];
    section7.contacts = [@[[IEFAContactModel contactWithFullName:@"Gohar Gasparyan" phoneNumber:@"+374 94 012349"]] mutableCopy];
    
    IEFAContactSectionModel *section8 =
    [IEFAContactSectionModel sectionModelWithSectionHeaderTitle:@"Committee on Security and Defence (SEDE)"];
    section8.contacts = [@[[IEFAContactModel contactWithFullName:@"Sue Avetyan" phoneNumber:@"+374 77 20 50 51"]] mutableCopy];
    
    IEFAContactSectionModel *section9 =
    [IEFAContactSectionModel sectionModelWithSectionHeaderTitle:@"Committee on Development (DEVE)"];
    section9.contacts = [@[[IEFAContactModel contactWithFullName:@"Andranik Manukya" phoneNumber:@"+374 93 004750"]] mutableCopy];
    
    IEFAContactSectionModel *section10 =
    [IEFAContactSectionModel sectionModelWithSectionHeaderTitle:@"Committee on Environment, Public Health and Food Safety (ENVI)"];
    section10.contacts = [@[[IEFAContactModel contactWithFullName:@"Bella Baghdasaryan" phoneNumber:@"+374 55 240987"]] mutableCopy];
    
    IEFAContactSectionModel *section11 =
    [IEFAContactSectionModel sectionModelWithSectionHeaderTitle:@"Committee on Foreign Affairs (AFET)"];
    section11.contacts = [@[[IEFAContactModel contactWithFullName:@"Iren Stepanyan" phoneNumber:@"+374 95 300981"]] mutableCopy];
    
    IEFAContactSectionModel *section12 =
    [IEFAContactSectionModel sectionModelWithSectionHeaderTitle:@"Committee on Fisheries (PECH)"];
    section12.contacts = [@[[IEFAContactModel contactWithFullName:@"Narine Hayrapetyan" phoneNumber:@"+374 93 744304"]] mutableCopy];
    
    IEFAContactSectionModel *section13 =
    [IEFAContactSectionModel sectionModelWithSectionHeaderTitle:@"Committee on Constitutional Affairs (AFCO)"];
    section13.contacts = [@[[IEFAContactModel contactWithFullName:@"Anush Dilanyan" phoneNumber:@"+374 95 475753"]] mutableCopy];
    
    self.dataSource = [@[section0, section1, section2, section3, section4, section5, section6, section7, section8, section9, section10, section11, section12, section13] mutableCopy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    IEFAContactSectionModel *currentSection = self.dataSource[section];
    
    return currentSection.contacts.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    IEFAContactsHeaderView *header = (IEFAContactsHeaderView * )[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"IEFAContactsHeaderView"];
    
    IEFAContactSectionModel *currentSection = self.dataSource[section];
    header.headerLabel.text = currentSection.sectionHeaderTitle;
    
    return header;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifierContacts forIndexPath:indexPath];
    
    IEFAContactSectionModel *currentSection = self.dataSource[indexPath.section];
    IEFAContactModel *currentContact = currentSection.contacts[indexPath.row];
    
    cell.textLabel.text = currentContact.fullName;
    cell.detailTextLabel.text =  currentContact.phoneNumber;
    
    cell.accessoryView = [self accessoryView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (UIView *)accessoryView {
    
    UIButton *accessory = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [accessory setImage:[UIImage imageNamed:@"callIcon"] forState:UIControlStateNormal];
    [accessory addTarget:self action:@selector(onCustomAccessoryTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    return accessory;
}

- (void)onCustomAccessoryTapped:(UIButton *)sender {
    
    UITableViewCell *cell = (UITableViewCell *)sender.superview;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    // Now you can do the following
    [self tableView:self.tableView accessoryButtonTappedForRowWithIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    
    IEFAContactSectionModel *currentSection = self.dataSource[indexPath.section];
    IEFAContactModel *currentContact = currentSection.contacts[indexPath.row];
    
    [self callToNumber:currentContact.phoneNumber];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


- (void)callToNumber:(NSString *)number {
    
    NSString *numberWithoutSpaces = [number stringByReplacingOccurrencesOfString:@" " withString:@""];

    
    NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@",numberWithoutSpaces]];
    
    if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
        [[UIApplication sharedApplication] openURL:phoneUrl];
    } else
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert"
                                                                                 message:@"Call facility is not available!!!"
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             
                                                         }];
        
        [alertController addAction:okAction];
        
        [self presentViewController:alertController
                           animated:YES
                         completion:^{
                             
                         }];
    }
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
