

#import "SWViewController.h"

@interface SWViewController ()

@property (nonatomic, weak) IBOutlet UILabel *lblPlantilla;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation SWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
}

- (void)viewWillAppear:(BOOL)animated {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
}

- (void)viewDidAppear:(BOOL)animated {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
}

-(void)viewWillDisappear:(BOOL)animated {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
}

- (void)viewDidDisappear:(BOOL)animated {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
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
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"plan" ofType:@"txt"];
    NSError *error;
    NSString *content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:&error];
    
    if ([error code] == 0) {
        [_lblPlantilla setText:content];
    } else {
        [_lblPlantilla setText:@"Error"];
    }
    
#ifndef NDEBUG
    NSLog(@"%s (line:%d) %@", __PRETTY_FUNCTION__, __LINE__, path);
#endif
}

- (IBAction)addPhoto:(id)sender {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    
    //[self performSegueWithIdentifier:@"leerPlantilla" sender:nil];
    
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
        //[_txLabel setText:@"No se que se ha presionado"];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *pickedImg = [info objectForKey:UIImagePickerControllerEditedImage];
        [_imageView setImage:pickedImg];
        
        
        NSTimeInterval timestamp = [[NSDate date] timeIntervalSince1970];
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        NSString *routePath = [[[fileManager URLsForDirectory:NSDocumentDirectory
                                                    inDomains:NSAllDomainsMask] objectAtIndex:0] path];
        
        NSString *path = [NSString stringWithFormat:@"%@/%.f%@", routePath
                          ,timestamp, @".jpg"];
        
        [fileManager createFileAtPath:path
                             contents:UIImageJPEGRepresentation(pickedImg, 1.0f)
                           attributes:nil];
#ifndef NDEBUG
        NSLog(@"%s (line:%d) %@", __PRETTY_FUNCTION__, __LINE__, path);
#endif
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    [self performSegueWithIdentifier:@"verImagen" sender:nil];
}

#pragma mark - prepareForSegue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    if ([segue.identifier isEqualToString:@"verImagen"]) {
        id controller = [segue destinationViewController];
        if ([controller respondsToSelector:@selector(setData:)]) {
            [controller performSelector:@selector(setData:) withObject:_imageView.image];
        }
    }
    
    
}


@end
