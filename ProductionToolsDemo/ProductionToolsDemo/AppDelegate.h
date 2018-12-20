//
//  AppDelegate.h
//  ProductionToolsDemo
//
//  Created by 郭子立 on 2018/12/19.
//  Copyright © 2018 龙禧. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

