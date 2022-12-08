# Photollection
An interview test task

Consume this public API https://picsum.photos/

written by using Swift above with collection view not SwiftUI

Imagine that this project is part of a really big app that needs long maintenance. We'll evaluate your coding styles.

List page
Show auto reload an infinite list of images with a good collection view layout. (up to your decisions) Tips: don't load too many photos at the same time.
Open specific image page while tap

Image page
It has segmented control button to change image to normal/blur/grayscale (get these images from API)
Blur image has a slider to change the blur ratio. And the app only gets blur images from API.
Show all image informations eg. author
Go back to previous page


Notes:
- the warning is caused by new Xcode 14 & iOS 16, will be resolved later: "[Assert] UINavigationBar decoded as unlocked for UINavigationController, or navigationBar delegate set up incorrectly. Inconsistent configuration may cause problems. navigationController=<UINavigationController: 0x148830600>, navigationBar=<UINavigationBar: 0x14850c280; frame = (0 59; 0 50); opaque = NO; autoresize = W; layer = <CALayer: 0x600002152ae0>> delegate=0x148830600"
