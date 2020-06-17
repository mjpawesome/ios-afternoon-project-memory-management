//
//  MJPContactController.m
//  contacts
//
//  Created by Mark Poggi on 6/17/20.
//  Copyright © 2020 Mark Poggi. All rights reserved.
//

#import "MJPContactController.h"

@interface MJPContactController ()

@property (nonatomic) NSMutableArray *internalContacts;

@end

@implementation MJPContactController

- (instancetype) init {
    self = [super init];

    if (self) {
        _internalContacts = [[[NSMutableArray alloc] init] autorelease];
        [self addTestContact];

    }
    return self;
}

- (NSArray *)contacts {
    return [[self.internalContacts copy] autorelease];
}

- (void)addContact:(MJPContact *)contact {
    [self.internalContacts addObject:contact];
}

- (void)editContact:(MJPContact *)contact withName:(NSString *)name email:(NSString *)emailAddress phone:(NSString *)phoneNumber {
    NSUInteger index = [self.internalContacts indexOfObject:contact];
    contact.name = name;
    contact.emailAddress = emailAddress;
    contact.phoneNumber = phoneNumber;
    [self.internalContacts replaceObjectAtIndex:index withObject:contact];
}

- (void)deleteContact:(MJPContact *)contact {
    [self.internalContacts removeObject:contact];
}

- (void)addTestContact {
    MJPContact *testContact = [[MJPContact alloc] initWithName:@"TestName" email:@"Test E-mail" phone:@"Test Phone Number"];
    [self addContact:testContact];
    [testContact release];
}


@end
