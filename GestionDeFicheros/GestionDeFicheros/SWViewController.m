

#import "SWViewController.h"

@interface SWViewController ()

@end

@implementation SWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction for view controller
- (IBAction)readFile:(id)sender {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    
    // TODO
    
}

- (IBAction)addPhoto:(id)sender {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Opciones"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancelar"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Cámara", @"Librería", nil];
    
    [actionSheet showInView:self.view];
}

#pragma mark - UIActionSheetDelegate Methods
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
#ifndef NDEBUG
    NSLog(@"%s (line:%d) clicked %i", __PRETTY_FUNCTION__, __LINE__, (int)buttonIndex);
#endif
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    [picker setDelegate:self];
    
    NSString *requiredType;
    requiredType = (NSString *)kUTTypeImage;
    picker.mediaTypes = @[requiredType];
    picker.allowsEditing = YES;
    
    if (buttonIndex == 0) { // Camara
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:YES completion:nil];
    } else if (buttonIndex == 1) { //Librería
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:picker animated:YES completion:nil];
    } else {
        [_txLabel setText:@"No se que se ha presionado"];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *pickedImg = [info objectForKey:UIImagePickerControllerEditedImage];
        [_camaraImageView setImage:pickedImg];
        
        // TODO
#ifndef NDEBUG
        NSLog(@"%s (line:%d) %@", __PRETTY_FUNCTION__, __LINE__, path);
#endif
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
