/**
 Contains the list of courses available to the user.
 Hardcoded for each course. Courses can be retrieved by name or number.
 */


import Foundation

class CourseRepository {

        static var allCourses: [Course] {
        return [stBoniface, southside, maplewood]
    }
    
    // St. Boniface Golf Course
    static var stBoniface: Course {
        Course(
            name: "St. Boniface Golf Club",
            address: "100 Rue Youville, Winnipeg, MB",
            tees: [
                Tee(yardage: 357, color: "black", rating: 70.7, slope: 127, par: 72),
                Tee(yardage: 340, color: "green", rating: 69.6, slope: 127, par: 72),
                Tee(yardage: 320, color: "gray", rating: 67.9, slope: 119, par: 74),
                Tee(yardage: 320, color: "yellow", rating: 67.0, slope: 117, par: 74)
            ],
            holes: [
                Hole(
                    number: 1,
                    tees: [
                        Tee(yardage: 357, color: "black", rating: 8, par: 4),
                        Tee(yardage: 340, color: "green", rating: 8, par: 4),
                        Tee(yardage: 320, color: "gray", rating: 7, par: 4),
                        Tee(yardage: 320, color: "yellow", rating: 7, par: 4)
                     ]
                ),
                Hole(
                    number: 2,
                    tees: [
                        Tee(yardage: 365, color: "black", rating: 4, par: 4),
                        Tee(yardage: 355, color: "green", rating: 4, par: 4),
                        Tee(yardage: 292, color: "gray", rating: 15, par: 4),
                        Tee(yardage: 292, color: "yellow", rating: 15, par: 4)
                    ]
                ),
                Hole(
                    number: 3,
                    tees: [
                        Tee(yardage: 379, color: "black", rating: 10, par: 4),
                        Tee(yardage: 368, color: "green", rating: 10, par: 4),
                        Tee(yardage: 320, color: "gray", rating: 5, par: 4),
                        Tee(yardage: 320, color: "yellow", rating: 5, par: 4)
                    ]),
                Hole(
                    number: 4,
                    tees: [
                        Tee(yardage: 379, color: "black", rating: 12, par: 4),
                        Tee(yardage: 361, color: "green", rating: 12, par: 4),
                        Tee(yardage: 346, color: "gray", rating: 1, par: 4),
                        Tee(yardage: 346, color: "yellow", rating: 1, par: 4)
                    ]
                ),
                Hole(
                    number: 5,
                    tees: [
                        Tee(yardage: 163, color: "black", rating: 14, par: 3),
                        Tee(yardage: 145, color: "green", rating: 14, par: 3),
                        Tee(yardage: 127, color: "gray", rating: 13, par: 3),
                        Tee(yardage: 127, color: "yellow", rating: 13, par: 3)
                    ]
                ),
                Hole(
                    number: 6,
                    tees: [
                        Tee(yardage: 332, color: "black", rating: 18, par: 4),
                        Tee(yardage: 326, color: "green", rating: 18, par: 4),
                        Tee(yardage: 317, color: "gray", rating: 11, par: 4),
                        Tee(yardage: 317, color: "yellow", rating: 11, par: 4)
                      ]
                ),
                Hole(
                    number: 7,
                    tees: [
                        Tee(yardage: 282, color: "black", rating: 16, par: 4),
                        Tee(yardage: 271, color: "green", rating: 16, par: 4),
                        Tee(yardage: 256, color: "gray", rating: 17, par: 4),
                        Tee(yardage: 256, color: "yellow", rating: 17, par: 4)
                    ]
                ),
                Hole(
                    number: 8,
                    tees: [
                        Tee(yardage: 366, color: "black", rating: 2, par: 4),
                        Tee(yardage: 355, color: "green", rating: 2, par: 4),
                        Tee(yardage: 339, color: "gray", rating: 3, par: 4),
                        Tee(yardage: 339, color: "yellow", rating: 3, par: 4)
                    ]
                ),
                Hole(
                    number: 9,
                    tees: [
                        Tee(yardage: 520, color: "black", rating: 6, par: 5),
                        Tee(yardage: 497, color: "green", rating: 6, par: 5),
                        Tee(yardage: 444, color: "gray", rating: 9, par: 5),
                        Tee(yardage: 444, color: "yellow", rating: 9, par: 5)
                    ]
                ),
                Hole(
                    number: 10,
                    tees: [
                        Tee(yardage: 441, color: "black", rating: 4, par: 4),
                        Tee(yardage: 430, color: "green", rating: 4, par: 4),
                        Tee(yardage: 418, color: "gray", rating: 15, par: 5),
                        Tee(yardage: 418, color: "yellow", rating: 15, par: 5)
                    ]
                ),
                Hole(
                    number: 11,
                    tees: [
                        Tee(yardage: 483, color: "black", rating: 17, par: 5),
                        Tee(yardage: 471, color: "green", rating: 17, par: 5),
                        Tee(yardage: 461, color: "gray", rating: 4, par: 5),
                        Tee(yardage: 461, color: "yellow", rating: 4, par: 5)
                    ]
                ),
                Hole(
                    number: 12,
                    tees: [
                        Tee(yardage: 220, color: "black", rating: 5, par: 3),
                        Tee(yardage: 206, color: "green", rating: 5, par: 3),
                        Tee(yardage: 223, color: "gray", rating: 16, par: 4),
                        Tee(yardage: 223, color: "yellow", rating: 18, par: 4)
                    ]
                ),
                Hole(
                    number: 13,
                    tees: [
                        Tee(yardage: 516, color: "black", rating: 7, par: 5),
                        Tee(yardage: 496, color: "green", rating: 7, par: 5),
                        Tee(yardage: 476, color: "gray", rating: 2, par: 5),
                        Tee(yardage: 476, color: "yellow", rating: 2, par: 5)
                    ]
                ),
                Hole(
                    number: 14,
                    tees: [
                        Tee(yardage: 205, color: "black", rating: 9, par: 3),
                        Tee(yardage: 430, color: "green", rating: 9, par: 3),
                        Tee(yardage: 418, color: "gray", rating: 14, par: 3),
                        Tee(yardage: 418, color: "yellow", rating: 16, par: 3)
                    ]
                ),
                Hole(
                    number: 15,
                    tees: [
                        Tee(yardage: 330, color: "black", rating: 13, par: 4),
                        Tee(yardage: 316, color: "green", rating: 13, par: 4),
                        Tee(yardage: 301, color: "gray", rating: 12, par: 4),
                        Tee(yardage: 301, color: "yellow", rating: 14, par: 4)
                    ]
                ),
                Hole(
                    number: 16,
                    tees: [
                        Tee(yardage: 325, color: "black", rating: 11, par: 4),
                        Tee(yardage: 319, color: "green", rating: 11, par: 4),
                        Tee(yardage: 312, color: "gray", rating: 10, par: 4),
                        Tee(yardage: 312, color: "yellow", rating: 6, par: 4)
                    ]
                ),
                Hole(
                    number: 17,
                    tees: [
                        Tee(yardage: 516, color: "black", rating: 1, par: 5),
                        Tee(yardage: 504, color: "green", rating: 1, par: 5),
                        Tee(yardage: 448, color: "gray", rating: 8, par: 5),
                        Tee(yardage: 448, color: "yellow", rating: 8, par: 5)
                    ]
                ),
                Hole(
                    number: 18,
                    tees: [
                        Tee(yardage: 169, color: "black", rating: 15, par: 3),
                        Tee(yardage: 159, color: "green", rating: 15, par: 3),
                        Tee(yardage: 77, color: "gray", rating: 18, par: 3),
                        Tee(yardage: 77, color: "yellow", rating: 12, par: 3)
                    ]
                )
            ]
        )
    }
    
    // Southsnumbere Golf Course
    static var southside: Course {
        Course(
            name: "Southside Golf Course",
            address: "2226 Southside Road, Grande Pointe, MB",
            tees: [
                Tee(yardage: 441, color: "blue", rating: 61.5, slope: 102, par: 63),
                Tee(yardage: 430, color: "white", rating: 59.9, slope: 101, par: 63),
                Tee(yardage: 418, color: "red", rating: 61.0, slope: 93, par: 63),
                Tee(yardage: 418, color: "yellow", rating: 58.1, slope: 86, par: 63),
            ],
            holes: [
                Hole(
                    number: 1,
                    tees: [
                        Tee(yardage: 408, color: "blue", rating: 6, par: 4),
                        Tee(yardage: 376, color: "white", rating: 6, par: 4),
                        Tee(yardage: 352, color: "red", rating: 6, par: 4),
                        Tee(yardage: 295, color: "yellow", rating: 6, par: 4)
                    ]
                ),
                Hole(
                    number: 2,
                    tees: [
                        Tee(yardage: 113, color: "blue", rating: 18, par: 3),
                        Tee(yardage: 102, color: "white", rating: 18, par: 3),
                        Tee(yardage: 90, color: "red", rating: 18, par: 3),
                        Tee(yardage: 90, color: "yellow", rating: 18, par: 3)
                    ]
                ),
                Hole(
                    number: 3,
                    tees: [
                        Tee(yardage: 199, color: "blue", rating: 2, par: 3),
                        Tee(yardage: 170, color: "white", rating: 2, par: 3),
                        Tee(yardage: 157, color: "red", rating: 2, par: 3),
                        Tee(yardage: 157, color: "yellow", rating: 2, par: 3)
                    ]
                ),
                Hole(
                    number: 4,
                    tees: [
                        Tee(yardage: 390, color: "blue", rating: 4, par: 4),
                        Tee(yardage: 347, color: "white", rating: 4, par: 4),
                        Tee(yardage: 336, color: "red", rating: 4, par: 4),
                        Tee(yardage: 227, color: "yellow", rating: 4, par: 4)
                    ]
                ),
                Hole(
                    number: 5,
                    tees: [
                        Tee(yardage: 332, color: "blue", rating: 8, par: 4),
                        Tee(yardage: 296, color: "white", rating: 8, par: 4),
                        Tee(yardage: 282, color: "red", rating: 8, par: 4),
                        Tee(yardage: 197, color: "yellow", rating: 8, par: 4)
                    ]
                ),
                Hole(
                    number: 6,
                    tees: [
                        Tee(yardage: 170, color: "blue", rating: 12, par: 3),
                        Tee(yardage: 145, color: "white", rating: 12, par: 3),
                        Tee(yardage: 135, color: "red", rating: 12, par: 3),
                        Tee(yardage: 135, color: "yellow", rating: 12, par: 3)
                    ]
                ),
                Hole(
                    number: 7,
                    tees: [
                        Tee(yardage: 142, color: "blue", rating: 14, par: 3),
                        Tee(yardage: 124, color: "white", rating: 14, par: 3),
                        Tee(yardage: 105, color: "red", rating: 14, par: 3),
                        Tee(yardage: 105, color: "yellow", rating: 14, par: 3)
                    ]
                ),
                Hole(
                    number: 8,
                    tees: [
                        Tee(yardage: 350, color: "blue", rating: 10, par: 3),
                        Tee(yardage: 312, color: "white", rating: 10, par: 3),
                        Tee(yardage: 286, color: "red", rating: 10, par: 3),
                        Tee(yardage: 1218, color: "yellow", rating: 10, par: 3)
                    ]
                ),
                Hole(
                    number: 9,
                    tees: [
                        Tee(yardage: 130, color: "blue", rating: 16, par: 3),
                        Tee(yardage: 104, color: "white", rating: 16, par: 3),
                        Tee(yardage: 100, color: "red", rating: 16, par: 3),
                        Tee(yardage: 90, color: "yellow", rating: 16, par: 3)
                    ]
                ),
                Hole(
                    number: 10,
                    tees: [
                        Tee(yardage: 376, color: "blue", rating: 3, par: 4),
                        Tee(yardage: 353, color: "white", rating: 3, par: 4),
                        Tee(yardage: 293, color: "red", rating: 3, par: 4),
                        Tee(yardage: 266, color: "yellow", rating: 3, par: 4)
                    ]
                ),
                Hole(
                    number: 11,
                    tees: [
                        Tee(yardage: 173, color: "blue", rating: 11, par: 3),
                        Tee(yardage: 150, color: "white", rating: 11, par: 3),
                        Tee(yardage: 141, color: "red", rating: 11, par: 3),
                        Tee(yardage: 141, color: "yellow", rating: 11, par: 3)
                    ]
                ),
                Hole(
                    number: 12,
                    tees: [
                        Tee(yardage: 138, color: "blue", rating: 17, par: 3),
                        Tee(yardage: 115, color: "white", rating: 17, par: 3),
                        Tee(yardage: 100, color: "red", rating: 17, par: 3),
                        Tee(yardage: 100, color: "yellow", rating: 17, par: 3)
                    ]
                ),
                Hole(
                    number: 13,
                    tees: [
                        Tee(yardage: 341, color: "blue", rating: 9, par: 4),
                        Tee(yardage: 326, color: "white", rating: 9, par: 4),
                        Tee(yardage: 319, color: "red", rating: 9, par: 4),
                        Tee(yardage: 248, color: "yellow", rating: 9, par: 4)
                    ]
                ),
                Hole(
                    number: 14,
                    tees: [
                        Tee(yardage: 166, color: "blue", rating: 13, par: 3),
                        Tee(yardage: 142, color: "white", rating: 13, par: 3),
                        Tee(yardage: 120, color: "red", rating: 13, par: 3),
                        Tee(yardage: 120, color: "yellow", rating: 13, par: 3)
                    ]
                ),
                Hole(
                    number: 15,
                    tees: [
                        Tee(yardage: 132, color: "blue", rating: 15, par: 3),
                        Tee(yardage: 110, color: "white", rating: 15, par: 3),
                        Tee(yardage: 87, color: "red", rating: 15, par: 3),
                        Tee(yardage: 87, color: "yellow", rating: 15, par: 3)
                    ]
                ),
                Hole(
                    number: 16,
                    tees: [
                        Tee(yardage: 383, color: "blue", rating: 7, par: 4),
                        Tee(yardage: 345, color: "white", rating: 7, par: 4),
                        Tee(yardage: 324, color: "red", rating: 7, par: 4),
                        Tee(yardage: 242, color: "yellow", rating: 7, par: 4)
                    ]
                ),
                Hole(
                    number: 17,
                    tees: [
                        Tee(yardage: 536, color: "blue", rating: 5, par: 5),
                        Tee(yardage: 486, color: "white", rating: 5, par: 5),
                        Tee(yardage: 442, color: "red", rating: 5, par: 5),
                        Tee(yardage: 387, color: "yellow", rating: 5, par: 5)
                    ]
                ),
                Hole(
                    number: 18,
                    tees: [
                        Tee(yardage: 217, color: "blue", rating: 1, par: 3),
                        Tee(yardage: 187, color: "white", rating: 1, par: 3),
                        Tee(yardage: 156, color: "red", rating: 1, par: 3),
                        Tee(yardage: 156, color: "yellow", rating: 1, par: 3)
                    ]
                )
            ]
        )
    }
    
    // Maplewood Golf Club
    static var maplewood: Course {
        Course(
            name: "Maplewood Golf Club",
            address: "19113 Cure Road, St-Pierre-Jolys, MB",
            tees: [
                Tee(yardage: 5743, color: "blue", rating: 67.9, slope: 113, par: 70),
                Tee(yardage: 5364, color: "white", rating: 66.3, slope: 110, par: 69),
                Tee(yardage: 4538, color: "red", rating: 62.6, slope: 98, par: 66)
            ],
            holes: [
                Hole(
                    number: 1,
                    tees: [
                        Tee(yardage: 350, color: "blue", rating: 17, par: 5),
                        Tee(yardage: 339, color: "white", rating: 17, par: 5),
                        Tee(yardage: 315, color: "red", rating: 17, par: 4),
                    ]
                ),
                Hole(
                    number: 2,
                    tees: [
                        Tee(yardage: 310, color: "blue", rating: 5, par: 4),
                        Tee(yardage: 300, color: "white", rating: 5, par: 4),
                        Tee(yardage: 280, color: "red", rating: 5, par: 4),
                    ]
                ),
                Hole(
                    number: 3,
                    tees: [
                        Tee(yardage: 310, color: "blue", rating: 15, par: 4),
                        Tee(yardage: 300, color: "white", rating: 15, par: 4),
                        Tee(yardage: 280, color: "red", rating: 15, par: 4),
                    ]
                ),
                Hole(
                    number: 4,
                    tees: [
                        Tee(yardage: 296, color: "blue", rating: 13, par: 4),
                        Tee(yardage: 263, color: "white", rating: 13, par: 4),
                        Tee(yardage: 250, color: "red", rating: 13, par: 4),
                    ]
                ),
                Hole(
                    number: 5,
                    tees: [
                        Tee(yardage: 175, color: "blue", rating: 7, par: 3),
                        Tee(yardage: 155, color: "white", rating: 7, par: 3),
                        Tee(yardage: 135, color: "red", rating: 7, par: 3),
                    ],
                ),
                Hole(
                    number: 6,
                    tees: [
                        Tee(yardage: 386, color: "blue", rating: 1, par: 4),
                        Tee(yardage: 370, color: "white", rating: 1, par: 4),
                        Tee(yardage: 271, color: "red", rating: 1, par: 4),
                    ]
                ),
                Hole(
                    number: 7,
                    tees: [
                        Tee(yardage: 161, color: "blue", rating: 11, par: 3),
                        Tee(yardage: 146, color: "white", rating: 11, par: 3),
                        Tee(yardage: 128, color: "red", rating: 11, par: 3),
                    ],
                ),
                Hole(
                    number: 8,
                    tees: [
                        Tee(yardage: 325, color: "blue", rating: 9, par: 4),
                        Tee(yardage: 302, color: "white", rating: 9, par: 4),
                        Tee(yardage: 248, color: "red", rating: 9, par: 4),
                    ],
                ),
                Hole(
                    number: 9,
                    tees: [
                        Tee(yardage: 389, color: "blue", rating: 3, par: 4),
                        Tee(yardage: 348, color: "white", rating: 3, par: 4),
                        Tee(yardage: 304, color: "red", rating: 3, par: 4),
                    ]
                ),
                Hole(
                    number: 10,
                    tees: [
                        Tee(yardage: 373, color: "blue", rating: 8, par: 4),
                        Tee(yardage: 350, color: "white", rating: 8, par: 4),
                        Tee(yardage: 315, color: "red", rating: 8, par: 4),
                    ]
                ),
                Hole(
                    number: 11,
                    tees: [
                        Tee(yardage: 300, color: "blue", rating: 12, par: 4),
                        Tee(yardage: 280, color: "white", rating: 12, par: 4),
                        Tee(yardage: 165, color: "red", rating: 12, par: 3),
                    ],
                ),
                Hole(
                    number: 12,
                    tees: [
                        Tee(yardage: 415, color: "blue", rating: 4, par: 4),
                        Tee(yardage: 380, color: "white", rating: 4, par: 4),
                        Tee(yardage: 315, color: "red", rating: 4, par: 4),
                    ],
                ),
                Hole(
                    number: 13,
                    tees: [
                        Tee(yardage: 175, color: "blue", rating: 2, par: 3),
                        Tee(yardage: 165, color: "white", rating: 2, par: 3),
                        Tee(yardage: 125, color: "red", rating: 2, par: 3),
                    ]
                ),
                Hole(
                    number: 14,
                    tees: [
                        Tee(yardage: 347, color: "blue", rating: 10, par: 4),
                        Tee(yardage: 327, color: "white", rating: 10, par: 4),
                        Tee(yardage: 257, color: "red", rating: 10, par: 4),
                    ]
                ),
                Hole(
                    number: 15,
                    tees: [
                        Tee(yardage: 450, color: "blue", rating: 18, par: 5),
                        Tee(yardage: 435, color: "white", rating: 18, par: 4),
                        Tee(yardage: 400, color: "red", rating: 18, par: 4),
                    ]
                ),
                Hole(
                    number: 16,
                    tees: [
                        Tee(yardage: 293, color: "blue", rating: 14, par: 4),
                        Tee(yardage: 283, color: "white", rating: 14, par: 4),
                        Tee(yardage: 235, color: "red", rating: 14, par: 3),
                    ]
                ),
                Hole(
                    number: 17,
                    tees: [
                        Tee(yardage: 380, color: "blue", rating: 6, par: 4),
                        Tee(yardage: 340, color: "white", rating: 6, par: 4),
                        Tee(yardage: 305, color: "red", rating: 6, par: 4),
                    ]
                ),
                Hole(
                    number: 18,
                    tees: [
                        Tee(yardage: 165, color: "blue", rating: 16, par: 3),
                        Tee(yardage: 250, color: "white", rating: 16, par: 3),
                        Tee(yardage: 125, color: "red", rating: 16, par: 3),
                    ],
                )
            ]
        )
    }
}
