//
//  factorial.c
//  Factorial
//
//  Created by Finer  Vine on 2020/3/22.
//  Copyright © 2020 Finer  Vine. All rights reserved.
//

#include "include/factorial.h"

/// 实现 阶乘
long factorial(int n) {
    if (n == 0 || n == 1) return 1;
    return n * factorial(n-1);
}
