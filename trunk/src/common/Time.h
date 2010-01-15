/*
 * Time related API
 *
 *    Copyright (C) 2009 Louis Caron
 *
 *    This program is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    This program is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef _TIME_H_
#define _TIME_H_

// standard includes
#include <stdint.h>
#include <stdbool.h>

// for compiler specific directives
#include "compiler.h"

// for the RTC value
#include "reg_crm.h"

/**
 * Get the current time value.
 * @return The current time value.
 */
__INLINE uint32_t TimeGet(void)
{
    return crm_rtc_count_get();
}

/**
 * Compute the signed difference between two time values.
 * @param newer
 * @param older
 * @return The signed difference between value1 and value2.
 */
__INLINE int32_t TimeDiff(uint32_t newer, uint32_t older)
{
    return ((int32_t) (newer - older));
}

/**
 * Compare two time values.
 * @param newer
 * @param older
 * @return True if the newer value is actually newer than the older.
 */
__INLINE bool TimeCmp(uint32_t newer, uint32_t older)
{
    return TimeDiff(newer, older) >= 0;
}

#endif // _TIME_H_
