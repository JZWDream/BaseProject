//
//  WDMacro.h
//  LeanCloudDemo
//
//  Created by 王笛 on 2019/3/26.
//  Copyright © 2019 王笛. All rights reserved.
//

#ifndef WDMacro_h
#define WDMacro_h

//TODO:Log
#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...)
#endif

//TODO:Screen Fit
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
#define Scale(x) SCREENWIDTH / 375.00f * x
#define ISIPhoneX ((SCREENHEIGHT == 812.0) || (SCREENHEIGHT == 896.0))
#define SafeAreaBottomHeight ((ISIPhoneX) ? 34 : 0)
#define SafeAreaTopHeight ((ISIPhoneX) ? 88 : 64)
#define DangerArea ((ISIPhoneX) ? 44 : 0)
#define LandscapeBottomHeight ((ISIPhoneX) ? 21 : 0)

//TODO:Colors
#define ColorWithAlpha(s,alp) [UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s & 0xFF00) >>8)/255.0) blue:((s &0xFF)/255.0) alpha:(alp)]
#define ColorForRGB(s) ColorWithAlpha(s,1.0)
#define WDColor000000 ColorForRGB(0x000000)
#define WDColorFFFFFF ColorForRGB(0xFFFFFF)
#define WDColor333333 ColorForRGB(0x333333)
#define WDColor666666 ColorForRGB(0x666666)
#define WDColor999999 ColorForRGB(0x999999)


//TODO:Fonts
#define FontWithNameSize(_name,_size) [UIFont fontWithName:_name size:_size]
#define WDRegularFont(_size) FontWithNameSize(@"PingFangSC-Regular",_size)
#define WDMediumFont(_size) FontWithNameSize(@"PingFangSC-Medium",_size)
#define WDLightFont(_size) FontWithNameSize(@"SFProDisplay-Light",_size)

//TODO:Path

//TODO:Images
#define WDImage(_name) [UIImage imageNamed:_name]
#define WDOriginalImage(_name) [[UIImage imageNamed:_name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]


#endif /* WDMacro_h */
