/*
 * Copyright (c) 2014, Freescale Semiconductor, Inc.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * o Redistributions of source code must retain the above copyright notice, this list
 *   of conditions and the following disclaimer.
 *
 * o Redistributions in binary form must reproduce the above copyright notice, this
 *   list of conditions and the following disclaimer in the documentation and/or
 *   other materials provided with the distribution.
 *
 * o Neither the name of Freescale Semiconductor, Inc. nor the names of its
 *   contributors may be used to endorse or promote products derived from this
 *   software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include "fsl_device_registers.h"
#include "milliseconds_delay.h"

#if defined(TOWER)
#define LED1_OFFSET 17
#define LED2_OFFSET 18

#define DELAY_1MS (1000)
#define LED_COUNT 2

static uint8_t led_offset[LED_COUNT] = { LED1_OFFSET, LED2_OFFSET };
static PORT_Type *led_port[LED_COUNT] = { PORTC, PORTC };
static GPIO_Type *led_gpio[LED_COUNT] = { GPIOC, GPIOC };
#endif // TOWER

#if defined(FREEDOM)
#define LED1_OFFSET 29
#define LED2_OFFSET 4
#define LED3_OFFSET 31

#define DELAY_1MS (1000)
#define LED_COUNT 3

static uint8_t led_offset[LED_COUNT] = { LED1_OFFSET, LED2_OFFSET, LED3_OFFSET };
static PORT_Type *led_port[LED_COUNT] = { PORTE, PORTC, PORTE };
static GPIO_Type *led_gpio[LED_COUNT] = { GPIOE, GPIOC, GPIOE };
#endif // FREEDOM

static void init_hardware(void)
{
    // Enable clocks to ports.
    PCC0->CLKCFG[PCC_PORTA_INDEX & PCC_PERIPHERAL_MASK] |= PCC_CLKCFG_CGC_MASK;
    PCC0->CLKCFG[PCC_PORTB_INDEX & PCC_PERIPHERAL_MASK] |= PCC_CLKCFG_CGC_MASK;
    PCC0->CLKCFG[PCC_PORTC_INDEX & PCC_PERIPHERAL_MASK] |= PCC_CLKCFG_CGC_MASK;
    PCC0->CLKCFG[PCC_PORTD_INDEX & PCC_PERIPHERAL_MASK] |= PCC_CLKCFG_CGC_MASK;
    PCC0->CLKCFG[PCC_PORTE_INDEX & PCC_PERIPHERAL_MASK] |= PCC_CLKCFG_CGC_MASK;

    uint8_t i;
    for (i = 0; i < LED_COUNT; i++)
    {
        // Enable the LED pins GPIO
        led_port[i]->PCR[led_offset[i]] = PORT_PCR_MUX(1);
        // Set ports to outputs
        led_gpio[i]->PDDR |= (1 << led_offset[i]);
    }
}

static void led_toggle(uint32_t leds)
{
    uint8_t i = 0;
    // led OFF
    for (i = 0; i < LED_COUNT; i++)
    {
        led_gpio[i]->PDOR |= (uint32_t)(1 << led_offset[i]);
    }
    // led ON
    led_gpio[leds]->PDOR &= (uint32_t) ~(1 << led_offset[leds]);
}

void delay(void)
{
    volatile uint32_t delayTicks = 2000000;

    while (delayTicks--)
    {
        __ASM("nop");
    }
}

int main(void)
{
    init_hardware();
    // Note: for ROM development, use this version of delay function,
    // Which is in order to test if the VTCOR is correct.
    milliseconds_delay_init();
    uint32_t leds = 0;
    while (1)
    {
        led_toggle(leds);
        milliseconds_delay(DELAY_1MS);

        ++leds;
        if (leds == LED_COUNT)
        {
            leds = 0;
        }
    }
}
