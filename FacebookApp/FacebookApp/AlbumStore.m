//
//  AlbumStore.m
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 24/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import "AlbumStore.h"
#import "Album.h"
@interface AlbumStore()

@end
@implementation AlbumStore
-(NSArray *) fetchAlbum{
    Album *album1 = [[Album alloc] initWithTitle:@"WattsApp" photos:10 image:@"image"];
    Album *album2 = [[Album alloc] initWithTitle:@"DOWNLOAD" photos:7 image:@"image"];
    Album *album3 = [[Album alloc] initWithTitle:@"Facebook" photos:1 image:@"image"];
    Album *album4 = [[Album alloc] initWithTitle:@"Appareil Photo" photos:2 image:@"image"];
    Album *album5 = [[Album alloc] initWithTitle:@"Images" photos:100 image:@"image"];
    NSMutableArray *albums = [NSMutableArray arrayWithObjects:album1,album2,album3,album4,album5, nil];
    return albums;
}
@end
