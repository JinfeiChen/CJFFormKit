//
//  macros.h
//  Pods
//
//  Created by cjf on 9/12/2020.
//

#ifndef macros_h
#define macros_h

#define kCJFFormResourceBundle [NSBundle bundleWithPath:[[NSBundle bundleForClass:[self class]].resourcePath stringByAppendingPathComponent:@"/CJFFormKit.bundle"]]

#define kCJFFormHexColor(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define kCJFFormMainColor [UIColor colorWithRed:255/255.0 green:194/255.0 blue:76/255.0 alpha:1.0]

#endif /* macros_h */
