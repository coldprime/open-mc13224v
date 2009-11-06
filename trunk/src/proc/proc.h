/*
 * Processor related API
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


#ifndef _PROC_H_
#define _PROC_H_

#ifndef __GNUC__
#error "File only included with ARM GCC"
#endif

#include <stdint.h>

/** @brief Enable interrupts globally in the system.
 * This macro must be used when the initialization phase is over and the interrupts
 * can start being handled by the system.
 */
#define PROC_INT_START()                                                    \
do {                                                                        \
    uint32_t __l_cpsr_tmp;                                                  \
    __asm volatile("MRS %0, CPSR" : "=r"(__l_cpsr_tmp));                    \
    __asm volatile("BIC %0, %1, #0x40" : "=r"(__l_cpsr_tmp) :               \
                 "r"(__l_cpsr_tmp));                                        \
    __asm volatile("MSR CPSR_cxsf, %0" : : "r"(__l_cpsr_tmp));              \
} while(0)

/** @brief Disable interrupts globally in the system.
 * This macro must be used when the system wants to disable all the interrupt
 * it could handle.
 */
#define PROC_INT_STOP()                                                     \
do {                                                                        \
    uint32_t __l_cpsr_tmp;                                                  \
    __asm volatile("MRS %0, CPSR" : "=r"(__l_cpsr_tmp));                    \
    __asm volatile("ORR %0, %1, #0x40" : "=r"(__l_cpsr_tmp) :               \
                 "r"(__l_cpsr_tmp));                                        \
    __asm volatile("MSR CPSR_cxsf, %0" : : "r"(__l_cpsr_tmp));              \
} while(0)

/** @brief Disable interrupts globally in the system.
 * This macro must be used in conjunction with the @ref PROC_INT_RESTORE macro since this
 * last one will close the brace that the current macro opens.  This means that both
 * macros must be located at the same scope level.
 */
#define PROC_INT_DISABLE()                                                  \
do {                                                                        \
    uint32_t __l_cpsr_tmp;                                                  \
    uint32_t __l_irq_rest;                                                  \
    __asm volatile("MRS %0, CPSR" : "=r"(__l_cpsr_tmp));                    \
    __asm volatile("AND %0, %1, #0x40" : "=r"(__l_irq_rest) :               \
                 "r"(__l_cpsr_tmp));                                        \
    __asm volatile("ORR %0, %1, #0x40" : "=r"(__l_cpsr_tmp) :               \
                 "r"(__l_cpsr_tmp));                                        \
    __asm volatile("MSR CPSR_cxsf, %0" : : "r"(__l_cpsr_tmp));              \

/** @brief Restore interrupts from the previous global disable.
 * @sa PROC_INT_DISABLE
 */
#define PROC_INT_RESTORE()                                                  \
    __asm volatile("MRS %0, CPSR" : "=r"(__l_cpsr_tmp));                    \
    __asm volatile("BIC %0, %1, #0x40" : "=r"(__l_cpsr_tmp) :               \
                 "r"(__l_cpsr_tmp));                                        \
    __asm volatile("ORR %0, %1, %2" : "=r"(__l_cpsr_tmp) :                  \
                 "r"(__l_cpsr_tmp), "r"(__l_irq_rest));                     \
    __asm volatile("MSR CPSR_cxsf, %0" : : "r"(__l_cpsr_tmp));              \
} while(0)

/** @brief Change the stack pointer in the running context.
 * This macro can be called to change/reset the current context stack pointer.  It can be
 * used when a thread has reached a point from which it will never return, thus allowing
 * to save RAM space.
 * @warning Invoking this macro can have a terrible effect if not done consciously.
 */
#define PROC_SP_RESET(__v)                                                  \
do {                                                                        \
    __asm volatile("MOV SP, %0" : : "r"(__v));                              \
} while(0)

/** @brief Count the leading zeros in a variable.
 * Extracted from a web site and modified to work faster because there should always be
 * a bit set.
 *
 * The algorithm is the following:
 * __c = 0;
 * if ((__v >> 16) == 0)
 * {
 *     __c += 16
 *     __v = __v << 16
 * }
 * if ((__v & 0xFF000000) == 0)
 * {
 *     __c += 8
 *     __v = __v << 8;
 * }
 * if ((__v & 0xF0000000) == 0)
 * {
 *     __c += 4
 *     __v = __v << 4;
 * }
 * if ((__v & 0xC0000000) == 0)
 * {
 *     __c += 2
 *     __v = __v << 2;
 * }
 * if ((__v & 0x80000000) == 0)
 * {
 *     __c += 1
 * }
 * @param[out] __c Result of the count
 * @param[in] __v Variable to count the leading zeros in
 */
#define PROC_CLZ(__c, __v)                                                  \
do {                                                                        \
    __asm volatile("lsrs    %0,%1,#16;"                                     \
                   "mov     %0,#0; "                                        \
                   "addeq   %0,%0,#16;"                                     \
                   "lsleq   %1,%1,#16;"                                     \
                   "tst     %1,#0xff000000;"                                \
                   "addeq   %0,%0,#8;"                                      \
                   "lsleq   %1,%1,#8;"                                      \
                   "tst     %1,#0xf0000000;"                                \
                   "addeq   %0,%0,#4;"                                      \
                   "lsleq   %1,%1,#4;"                                      \
                   "tst     %1,#0xc0000000;"                                \
                   "addeq   %0,%0,#2;"                                      \
                   "lsleq   %1,%1,#2;"                                      \
                   "tst     %1,#0x80000000;"                                \
                   "addeq    %0,%0,#1" : "=&r"(__c): "r"(__v)); \
} while(0)


#endif // _PROC_H_
