//
//  IEFASchedule.m
//  iefa
//
//  Created by User on 6/7/16.
//  Copyright © 2016 Paruyr Danielian. All rights reserved.
//

#import "IEFASchedule.h"
#import "IEFAConstants.h"

@implementation IEFASchedule


+ (NSArray *)scheduleForThirdDay {
    return @[ @{ @"startTime" : @"09:00",
                 @"endTime" : @"11:00",
                 @"evant" : @"Arrival of international delegates",
                 @"show" :[NSNumber numberWithInteger:DailySceduleStayleNone]
                 },
                     
              @{ @"startTime" : @"11:00",
                 @"endTime" : @"13:00",
                 @"evant" : @"Teambuilding(1)",
                 @"place" : @[@40.196411, @44.480097],
                 @"dressCode" : @"Casual",
                 @"aboutPlace" : @"TUMO",
                 @"address" : @"16 Halabyan St, Yerevan 0038, Armenia",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleDressCodeAndMap]},
                     
              @{ @"startTime" : @"13:00",
                 @"endTime" : @"14:00",
                 @"evant" : @"Lunch",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleNone]},
              
              @{ @"startTime" : @"14:00",
                 @"endTime" : @"16:00",
                 @"evant" : @"Teambuilding(2)",
                 @"place" : @[@40.196411, @44.480097],
                 @"dressCode" : @"Casual",
                 @"aboutPlace" : @"TUMO",
                 @"address" : @"16 Halabyan St, Yerevan 0038, Armenia",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleDressCodeAndMap]},

                     
              @{ @"startTime" : @"16:00",
                 @"endTime" : @"16:30",
                 @"evant" : @"Coffee break",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleNone]},
                     
              @{ @"startTime" : @"16:30",
                 @"endTime" : @"18:00",
                 @"evant" : @"Teambuilding(3)",
                 @"place" : @[@40.196411, @44.480097],
                 @"dressCode" : @"Casual",
                 @"aboutPlace" : @"TUMO",
                 @"address" : @"16 Halabyan St, Yerevan 0038, Armenia",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleDressCodeAndMap]},
              
              @{ @"startTime" : @"18:00",
                 @"endTime" : @"19:00",
                 @"evant" : @"Transfer to Eurovillage Venue",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleNone]},
            
              @{ @"startTime" : @"19:00",
                 @"endTime" : @"23:00",
                 @"evant" : @"Eurovillage and Vardavar Festival",
                 @"place" : @[@40.176196, @44.514568],
                 @"dressCode" : @"Smart/Casual",
                 @"aboutPlace" : @"Safran",
                 @"address" : @"Hanrapetutyan 39/1, Yerevan",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleDressCodeAndMap]}
              ];
    
}


+ (NSArray *)scheduleForForthDay {
    return @[ @{ @"startTime" : @"09:00",
                 @"endTime" : @"10:30",
                 @"evant" : @"Opening Ceremony",
                 @"place" : @[@40.177016, @44.515252],
                 @"dressCode" : @"Formal",
                 @"aboutPlace" : @"AGBU",
                 @"address" : @"2/1 Melik Adamyan St, Yerevan 0010, Armenia",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleDressCodeAndMap]},
              
              @{ @"startTime" : @"10:30",
                 @"endTime" : @"11:00",
                 @"evant" : @"Reception",
                 @"place" : @[@40.177016, @44.515252],
                 @"dressCode" : @"Formal",
                 @"aboutPlace" : @"AGBU",
                 @"address" : @"2/1 Melik Adamyan St, Yerevan 0010, Armenia",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleDressCodeAndMap]},
              
              @{ @"startTime" : @"11:00",
                 @"endTime" : @"11:15",
                 @"evant" : @"Transfer to CW Venue",
                 @"place" : @[@40.168638, @44.435778],
                 @"dressCode" : @"Smart",
                 @"address" : @"42/7 Arno Babajanyan St, Yerevan 0064, Armenia",
                 @"aboutPlace" : @"Avetissian School"},
              
              @{ @"startTime" : @"11:15",
                 @"endTime" : @"14:00",
                 @"evant" : @"Committee Work(1)",
                 @"place" : @[@40.168638, @44.435778],
                 @"dressCode" : @"Smart",
                 @"aboutPlace" : @"Avetissian School",
                 @"address" : @"42/7 Arno Babajanyan St, Yerevan 0064, Armenia",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleDressCodeAndMap]},
              
              @{ @"startTime" : @"14:00",
                 @"endTime" : @"15:00",
                 @"evant" : @"Lunch break",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleNone]},
              
              @{ @"startTime" : @"15:00",
                 @"endTime" : @"17:00",
                 @"evant" : @"Committee Work(2)",
                 @"place" : @[@40.168638, @44.435778],
                 @"dressCode" : @"Smart",
                 @"aboutPlace" : @"Avetissian School",
                 @"address" : @"42/7 Arno Babajanyan St, Yerevan 0064, Armenia",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleDressCodeAndMap]},
              
              @{ @"startTime" : @"17:00",
                 @"endTime" : @"17:30",
                 @"evant" : @"Coffee break",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleNone]},
              
              @{ @"startTime" : @"17:30",
                 @"endTime" : @"19:00",
                 @"evant" : @"Committee Work(3)",
                 @"place" : @[@40.168638, @44.435778],
                 @"dressCode" : @"Smart",
                 @"aboutPlace" : @"Avetissian School",
                 @"address" : @"42/7 Arno Babajanyan St, Yerevan 0064, Armenia",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleDressCodeAndMap]},
              
              @{ @"startTime" : @"19:00",
                 @"endTime" : @"20:00",
                 @"evant" : @"transfer to EuroConcert Venue/ Rehearsal",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleNone]},

              @{ @"startTime" : @"20:00",
                 @"endTime" : @"21:00",
                 @"evant" : @"Euro Concert",
                 @"place" : @[@40.179005, @44.513651],
                 @"dressCode" : @"Formal",
                 @"aboutPlace" : @"Arno Babajanian Hall",
                 @"address" : @"2 Abovyan St, Yerevan 0010, Armenia",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleDressCodeAndMap]},
              
              @{ @"startTime" : @"21:30",
                 @"endTime" : @"23:00",
                 @"evant" : @"Traditional Armenian Dinner",
                 @"place" : @[@40.179993, @44.514848],
                 @"dressCode" : @"Smart",
                 @"aboutPlace" : @"Megerian carpet",
                 @"address" : @"2/5 Abovyan St, Yerevan 0002, Armenia",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleDressCodeAndMap]}
              ];
    
}

+ (NSArray *)scheduleForFifthDay {
    return @[ @{ @"startTime" : @"10:30",
                 @"endTime" : @"12:00",
                 @"evant" : @"World Cafe",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleNone]},
              
              @{ @"startTime" : @"12:00",
                 @"endTime" : @"16:00",
                 @"evant" : @"Treasure Hunt",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleNone]},
              
              @{ @"startTime" : @"16:30",
                 @"endTime" : @"17:00",
                 @"evant" : @"Committee Lunch",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleNone]},
              
              @{ @"startTime" : @"17:00",
                 @"endTime" : @"19:00",
                 @"evant" : @"Free time",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleNone]},
              
              @{ @"startTime" : @"19:00",
                 @"endTime" : @"19:30",
                 @"evant" : @"Transfer to Dinner Venue",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleNone]},
              
              @{ @"startTime" : @"19:30",
                 @"endTime" : @"00:00",
                 @"evant" : @"Dinner at Megerian Carpets/ Watching football in a pub",
                 @"place" : @[@40.179993, @44.514848],
                 @"dressCode" : @"Smart/Casual",
                 @"aboutPlace" : @"Megerian carpet",
                 @"address" : @"2/5 Abovyan St, Yerevan 0002, Armenia",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleDressCodeAndMap]}
              ];
    
}

+ (NSArray *)scheduleForSixthDay {
    return @[ @{ @"startTime" : @"09:00",
                 @"endTime" : @"11:30",
                 @"evant" : @"Committee Work(4)",
                 @"place" : @[@40.168638, @44.435778],
                 @"dressCode" : @"Smart",
                 @"aboutPlace" : @"Avetissian School",
                 @"address" : @"42/7 Arno Babajanyan St, Yerevan 0064, Armenia",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleDressCodeAndMap]},
              
              @{ @"startTime" : @"11:30",
                 @"endTime" : @"12:00",
                 @"evant" : @"Coffee break",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleNone]},
              
              @{ @"startTime" : @"12:00",
                 @"endTime" : @"14:00",
                 @"evant" : @"Committee Work(5)",
                 @"place" : @[@40.168638, @44.435778],
                 @"dressCode" : @"Smart",
                 @"aboutPlace" : @"Avetissian School",
                 @"address" : @"42/7 Arno Babajanyan St, Yerevan 0064, Armenia",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleDressCodeAndMap]},
              
              @{ @"startTime" : @"14:00",
                 @"endTime" : @"15:00",
                 @"evant" : @"Coffee break",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleNone]},
              
              @{ @"startTime" : @"15:00",
                 @"endTime" : @"16:30",
                 @"evant" : @"Committee Work(6)",
                 @"place" : @[@40.168638, @44.435778],
                 @"dressCode" : @"Smart",
                 @"aboutPlace" : @"Avetissian School",
                 @"address" : @"42/7 Arno Babajanyan St, Yerevan 0064, Armenia",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleDressCodeAndMap]},
              
              @{ @"startTime" : @"16:30",
                 @"endTime" : @"17:00",
                 @"evant" : @"Coffee break",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleNone]},
              
              @{ @"startTime" : @"17:00",
                 @"endTime" : @"19:00",
                 @"evant" : @"Committee Work(7)",
                 @"place" : @[@40.168638, @44.435778],
                 @"dressCode" : @"Smart",
                 @"aboutPlace" : @"Avetissian School",
                 @"address" : @"42/7 Arno Babajanyan St, Yerevan 0064, Armenia",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleDressCodeAndMap]},
              
              @{ @"startTime" : @"19:30",
                 @"endTime" : @"21:00",
                 @"evant" : @"Dinner",
                 @"place" : @"",
                 @"dressCode" : @"",
                 @"aboutPlace" : @""},
              
              @{ @"startTime" : @"21:30",
                 @"endTime" : @"",
                 @"evant" : @"(Only for chairs) Resotyping/ Chairs' Dinner",
                 @"place" : @"",
                 @"dressCode" : @"",
                 @"aboutPlace" : @""},
              
              @{ @"startTime" : @"21:00",
                 @"endTime" : @"00:00",
                 @"evant" : @"Thematic Party",
                 @"place" : @[@40.188124, @44.514081],
                 @"dressCode" : @"Smart",
                 @"aboutPlace" : @"     ",
                 @"address" : @"1/1 Marshal Baghramyan Ave. Yerevan",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleDressCodeAndMap]}

              ];
    
}


+ (NSArray *)scheduleForSeventhDay {
    return @[ @{ @"startTime" : @"10:00",
                 @"endTime" : @"12:30",
                 @"evant" : @"Opening of the General Assembly, Committees 1, 2",
                 @"place" : @[@40.173808, @44.504237],
                 @"dressCode" : @"Formal",
                 @"aboutPlace" : @"Moscow House",
                 @"address" : @"7 Argishti St, Yerevan, Armenia",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleDressCodeAndMap]},
              
              @{ @"startTime" : @"12:30",
                 @"endTime" : @"13:00",
                 @"evant" : @"Coffee Break",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleNone]},
              
              @{ @"startTime" : @"13:00",
                 @"endTime" : @"14:00",
                 @"evant" : @"GA, Committee 3",
                 @"place" :  @[@40.173808, @44.504237],
                 @"dressCode" : @"Formal",
                 @"aboutPlace" : @"Moscow House",
                 @"address" : @"7 Argishti St, Yerevan, Armenia",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleDressCodeAndMap]},
              
              @{ @"startTime" : @"14:00",
                 @"endTime" : @"15:00",
                 @"evant" : @"Lunch Break",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleNone]},
              
              @{ @"startTime" : @"15:00",
                 @"endTime" : @"17:30",
                 @"evant" : @"GA, Committee 4, 5",
                 @"place" :  @[@40.173808, @44.504237],
                 @"dressCode" : @"Formal",
                 @"aboutPlace" : @"Moscow House",
                 @"address" : @"7 Argishti St, Yerevan, Armenia",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleDressCodeAndMap]},
              
              @{ @"startTime" : @"19:00",
                 @"endTime" : @"21:00",
                 @"evant" : @"Dinner",
                 @"place" : @"",
                 @"dressCode" : @"",
                 @"aboutPlace" : @""},
              
              @{ @"startTime" : @"21:00",
                 @"endTime" : @"00:00",
                 @"evant" : @"Free time",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleNone]}
              ];
    
}

+ (NSArray *)scheduleForEighthDay {
    return @[ @{ @"startTime" : @"10:00",
                 @"endTime" : @"12:30",
                 @"evant" : @"GA, Committee 6, 7",
                 @"place" :  @[@40.173808, @44.504237],
                 @"dressCode" : @"Formal",
                 @"aboutPlace" : @"Moscow House",
                 @"address" : @"7 Argishti St, Yerevan, Armenia",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleDressCodeAndMap]},
              
              @{ @"startTime" : @"12:30",
                 @"endTime" : @"13:00",
                 @"evant" : @"Coffee Break",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleNone]},
              
              @{ @"startTime" : @"13:00",
                 @"endTime" : @"14:00",
                 @"evant" : @"GA, Committee 8",
                 @"place" :  @[@40.173808, @44.504237],
                 @"dressCode" : @"Formal",
                 @"aboutPlace" : @"Moscow House",
                 @"address" : @"7 Argishti St, Yerevan, Armenia",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleDressCodeAndMap]},
              
              @{ @"startTime" : @"14:00",
                 @"endTime" : @"15:00",
                 @"evant" : @"Lunch Break",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleNone]},
              
              @{ @"startTime" : @"15:00",
                 @"endTime" : @"17:30",
                 @"evant" : @"GA, Committee 9, 10",
                 @"place" :  @[@40.173808, @44.504237],
                 @"dressCode" : @"Formal",
                 @"aboutPlace" : @"Moscow House",
                 @"address" : @"7 Argishti St, Yerevan, Armenia",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleDressCodeAndMap]},
              
              @{ @"startTime" : @"17:30",
                 @"endTime" : @"19:30",
                 @"evant" : @"Closing Ceremony",
                 @"place" : @"",
                 @"dressCode" : @"",
                 @"aboutPlace" : @""},
              
              @{ @"startTime" : @"20:00",
                 @"endTime" : @"02:00",
                 @"evant" : @"Farewell Party",
                 @"place" : @"",
                 @"dressCode" : @"",
                 @"aboutPlace" : @""}
              
              ];
    
}

+ (NSArray *)scheduleForNinthDay {
    return @[ @{ @"startTime" : @"ALL day",
                 @"endTime" : @"",
                 @"evant" : @"Seeing off International Delegates",
                 @"show" : [NSNumber numberWithInteger:DailySceduleStayleNone]}
              
              ];
    
}


@end
