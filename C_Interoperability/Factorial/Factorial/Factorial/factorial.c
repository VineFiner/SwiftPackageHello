//
//  factorial.c
//  Factorial
//
//  Created by vine on 2020/3/24.
//  Copyright © 2020 vine. All rights reserved.
//

#include "factorial.h"

long factorial(int n) {
    if (n == 0 || n == 1) return 1;
    return n * factorial(n-1);
}
