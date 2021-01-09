; ---------------------------------------------------------------------------------------
;  @file:    startup_MKS22F25612.s
;  @purpose: CMSIS Cortex-M4 Core Device Startup File
;            MKS22F25612
;  @version: 1.0
;  @date:    2015-6-23
;  @build:   b150820
; ---------------------------------------------------------------------------------------
;
; Copyright (c) 1997 - 2015 , Freescale Semiconductor, Inc.
; All rights reserved.
;
; Redistribution and use in source and binary forms, with or without modification,
; are permitted provided that the following conditions are met:
;
; o Redistributions of source code must retain the above copyright notice, this list
;   of conditions and the following disclaimer.
;
; o Redistributions in binary form must reproduce the above copyright notice, this
;   list of conditions and the following disclaimer in the documentation and/or
;   other materials provided with the distribution.
;
; o Neither the name of Freescale Semiconductor, Inc. nor the names of its
;   contributors may be used to endorse or promote products derived from this
;   software without specific prior written permission.
;
; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
; ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
; WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
; DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
; ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
; (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
; ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
; (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
; SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
;
; The modules in this file are included in the libraries, and may be replaced
; by any user-defined modules that define the PUBLIC symbol _program_start or
; a user defined start symbol.
; To override the cstartup defined in the library, simply add your modified
; version to the workbench project.
;
; The vector table is normally located at address 0.
; When debugging in RAM, it can be located in RAM, aligned to at least 2^6.
; The name "__vector_table" has special meaning for C-SPY:
; it is where the SP start value is found, and the NVIC vector
; table register (VTOR) is initialized to this address if != 0.
;
; Cortex-M version
;

        MODULE  ?cstartup

        ;; Forward declaration of sections.
        SECTION CSTACK:DATA:NOROOT(3)

        SECTION .intvec:CODE:NOROOT(2)

        EXTERN  __iar_program_start
        EXTERN  SystemInit
        EXTERN  init_data_bss
        PUBLIC  __vector_table
        PUBLIC  __vector_table_0x1c
        PUBLIC  __Vectors
        PUBLIC  __Vectors_End
        PUBLIC  __Vectors_Size

        DATA

__vector_table
        DCD     sfe(CSTACK)
        DCD     Reset_Handler

        DCD     NMI_Handler                                   ;NMI Handler
        DCD     HardFault_Handler                             ;Hard Fault Handler
        DCD     MemManage_Handler                             ;MPU Fault Handler
        DCD     BusFault_Handler                              ;Bus Fault Handler
        DCD     UsageFault_Handler                            ;Usage Fault Handler
__vector_table_0x1c
        DCD     0                                             ;Reserved
        DCD     0                                             ;Reserved
        DCD     0                                             ;Reserved
        DCD     0                                             ;Reserved
        DCD     SVC_Handler                                   ;SVCall Handler
        DCD     DebugMon_Handler                              ;Debug Monitor Handler
        DCD     0                                             ;Reserved
        DCD     PendSV_Handler                                ;PendSV Handler
        DCD     SysTick_Handler                               ;SysTick Handler

                                                              ;External Interrupts
        DCD     DMA0_IRQHandler                               ;DMA Channel 0 Transfer Complete
        DCD     DMA1_IRQHandler                               ;DMA Channel 1 Transfer Complete
        DCD     DMA2_IRQHandler                               ;DMA Channel 2 Transfer Complete
        DCD     DMA3_IRQHandler                               ;DMA Channel 3 Transfer Complete
        DCD     DMA4_IRQHandler                               ;DMA Channel 4 Transfer Complete
        DCD     DMA5_IRQHandler                               ;DMA Channel 5 Transfer Complete
        DCD     DMA6_IRQHandler                               ;DMA Channel 6 Transfer Complete
        DCD     DMA7_IRQHandler                               ;DMA Channel 7 Transfer Complete
        DCD     DMA8_IRQHandler                               ;DMA Channel 8 Transfer Complete
        DCD     DMA9_IRQHandler                               ;DMA Channel 9 Transfer Complete
        DCD     DMA10_IRQHandler                              ;DMA Channel 10 Transfer Complete
        DCD     DMA11_IRQHandler                              ;DMA Channel 11 Transfer Complete
        DCD     DMA12_IRQHandler                              ;DMA Channel 12 Transfer Complete
        DCD     DMA13_IRQHandler                              ;DMA Channel 13 Transfer Complete
        DCD     DMA14_IRQHandler                              ;DMA Channel 14 Transfer Complete
        DCD     DMA15_IRQHandler                              ;DMA Channel 15 Transfer Complete
        DCD     DMA_Error_IRQHandler                          ;DMA Error Interrupt
        DCD     MCM_IRQHandler                                ;Normal Interrupt
        DCD     FTF_IRQHandler                                ;FTFA Command complete interrupt
        DCD     Read_Collision_IRQHandler                     ;Read Collision Interrupt
        DCD     LVD_LVW_IRQHandler                            ;Low Voltage Detect, Low Voltage Warning
        DCD     LLWU_IRQHandler                               ;Low Leakage Wakeup Unit
        DCD     WDOG_EWM_IRQHandler                           ;WDOG Interrupt
        DCD     RNG_IRQHandler                                ;RNG Interrupt
        DCD     LPI2C0_IRQHandler                             ;LPI2C0 interrupt
        DCD     LPI2C1_IRQHandler                             ;LPI2C1 interrupt
        DCD     SPI0_IRQHandler                               ;SPI0 Interrupt
        DCD     SPI1_IRQHandler                               ;SPI1 Interrupt
        DCD     I2S0_Tx_IRQHandler                            ;I2S0 transmit interrupt
        DCD     I2S0_Rx_IRQHandler                            ;I2S0 receive interrupt
        DCD     LPUART0_IRQHandler                            ;LPUART0 status/error interrupt
        DCD     UART0_RX_TX_IRQHandler                        ;UART0 Status Sources interrupt
        DCD     UART0_ERR_IRQHandler                          ;UART0 Error Sources interrupt
        DCD     UART1_RX_TX_IRQHandler                        ;UART1 Status Sources interrupt
        DCD     UART1_ERR_IRQHandler                          ;UART1 Error Sources interrupt
        DCD     UART2_RX_TX_IRQHandler                        ;UART2 Status Sources interrupt
        DCD     UART2_ERR_IRQHandler                          ;UART2 Error Sources interrupt
        DCD     Reserved53_IRQHandler                         ;Reserved interrupt 53
        DCD     Reserved54_IRQHandler                         ;Reserved interrupt 54
        DCD     ADC0_IRQHandler                               ;ADC0 interrupt
        DCD     CMP0_IRQHandler                               ;CMP0 interrupt
        DCD     Reserved57_IRQHandler                         ;Reserved interrupt 57
        DCD     TPM0_IRQHandler                               ;TPM0 Timer Overflow and Channels interrupt
        DCD     TPM1_IRQHandler                               ;TPM1 Timer Overflow and Channels interrupt
        DCD     TPM2_IRQHandler                               ;TPM2 Timer Overflow and Channels interrupt
        DCD     Reserved61_IRQHandler                         ;Reserved interrupt 61
        DCD     RTC_IRQHandler                                ;RTC alarm interrupt
        DCD     RTC_Seconds_IRQHandler                        ;RTC seconds interrupt
        DCD     PIT0_IRQHandler                               ;PIT timer channel 0 interrupt
        DCD     PIT1_IRQHandler                               ;PIT timer channel 1 interrupt
        DCD     PIT2_IRQHandler                               ;PIT timer channel 2 interrupt
        DCD     PIT3_IRQHandler                               ;PIT timer channel 3 interrupt
        DCD     PDB0_IRQHandler                               ;PDB0 Interrupt
        DCD     USB0_IRQHandler                               ;USB0 interrupt
        DCD     Reserved70_IRQHandler                         ;Reserved interrupt 70
        DCD     Reserved71_IRQHandler                         ;Reserved interrupt 71
        DCD     DAC0_IRQHandler                               ;DAC0 interrupt
        DCD     MCG_IRQHandler                                ;MCG Interrupt
        DCD     LPTMR0_IRQHandler                             ;LPTimer interrupt
        DCD     PORTA_IRQHandler                              ;Port A interrupt
        DCD     PORTB_IRQHandler                              ;Port B interrupt
        DCD     PORTC_IRQHandler                              ;Port C interrupt
        DCD     PORTD_IRQHandler                              ;Port D interrupt
        DCD     PORTE_IRQHandler                              ;Port E interrupt
        DCD     SWI_IRQHandler                                ;Software interrupt
        DCD     Reserved81_IRQHandler                         ;Reserved interrupt 81
        DCD     Reserved82_IRQHandler                         ;Reserved interrupt 82
        DCD     Reserved83_IRQHandler                         ;Reserved interrupt 83
        DCD     Reserved84_IRQHandler                         ;Reserved interrupt 84
        DCD     Reserved85_IRQHandler                         ;Reserved interrupt 85
        DCD     FLEXIO_IRQHandler                             ;Flexible IO interrupt
        DCD     Reserved87_IRQHandler                         ;Reserved interrupt 87
        DCD     Reserved88_IRQHandler                         ;Reserved interrupt 88
        DCD     Reserved89_IRQHandler                         ;Reserved interrupt 89
        DCD     Reserved90_IRQHandler                         ;Reserved Interrupt 90
        DCD     CAN0_ORed_Message_buffer_IRQHandler           ;CAN0 OR'd message buffers interrupt
        DCD     CAN0_Bus_Off_IRQHandler                       ;CAN0 bus off interrupt
        DCD     CAN0_Error_IRQHandler                         ;CAN0 error interrupt
        DCD     CAN0_Tx_Warning_IRQHandler                    ;CAN0 Tx warning interrupt
        DCD     CAN0_Rx_Warning_IRQHandler                    ;CAN0 Rx warning interrupt
        DCD     CAN0_Wake_Up_IRQHandler                       ;CAN0 wake up interrupt
        DCD     Reserved97_IRQHandler                         ;Reserved Interrupt 97
        DCD     Reserved98_IRQHandler                         ;Reserved Interrupt 98
        DCD     Reserved99_IRQHandler                         ;Reserved Interrupt 99
        DCD     Reserved100_IRQHandler                        ;Reserved Interrupt 100
        DCD     Reserved101_IRQHandler                        ;Reserved Interrupt 101
        DCD     Reserved102_IRQHandler                        ;Reserved Interrupt 102
        DCD     Reserved103_IRQHandler                        ;Reserved Interrupt 103
        DCD     I2S1_Tx_IRQHandler                            ;I2S1 transmit interrupt
        DCD     I2S1_Rx_IRQHandler                            ;I2S1 receive interrupt
        DCD     Reserved106_IRQHandler                        ;Reserved Interrupt 106
        DCD     Reserved107_IRQHandler                        ;Reserved Interrupt 107
        DCD     Reserved108_IRQHandler                        ;Reserved Interrupt 108
        DCD     Reserved109_IRQHandler                        ;Reserved Interrupt 109
        DCD     CAN1_ORed_Message_buffer_IRQHandler           ;CAN0 OR'd message buffers interrupt
        DCD     CAN1_Bus_Off_IRQHandler                       ;CAN1 bus off interrupt
        DCD     CAN1_Error_IRQHandler                         ;CAN1 error interrupt
        DCD     CAN1_Tx_Warning_IRQHandler                    ;CAN1 Tx warning interrupt
        DCD     CAN1_Rx_Warning_IRQHandler                    ;CAN1 Rx warning interrupt
        DCD     CAN1_Wake_Up_IRQHandler                       ;CAN1 wake up interrupt
        DCD     DefaultISR                                    ;116
        DCD     DefaultISR                                    ;117
        DCD     DefaultISR                                    ;118
        DCD     DefaultISR                                    ;119
        DCD     DefaultISR                                    ;120
        DCD     DefaultISR                                    ;121
        DCD     DefaultISR                                    ;122
        DCD     DefaultISR                                    ;123
        DCD     DefaultISR                                    ;124
        DCD     DefaultISR                                    ;125
        DCD     DefaultISR                                    ;126
        DCD     DefaultISR                                    ;127
        DCD     DefaultISR                                    ;128
        DCD     DefaultISR                                    ;129
        DCD     DefaultISR                                    ;130
        DCD     DefaultISR                                    ;131
        DCD     DefaultISR                                    ;132
        DCD     DefaultISR                                    ;133
        DCD     DefaultISR                                    ;134
        DCD     DefaultISR                                    ;135
        DCD     DefaultISR                                    ;136
        DCD     DefaultISR                                    ;137
        DCD     DefaultISR                                    ;138
        DCD     DefaultISR                                    ;139
        DCD     DefaultISR                                    ;140
        DCD     DefaultISR                                    ;141
        DCD     DefaultISR                                    ;142
        DCD     DefaultISR                                    ;143
        DCD     DefaultISR                                    ;144
        DCD     DefaultISR                                    ;145
        DCD     DefaultISR                                    ;146
        DCD     DefaultISR                                    ;147
        DCD     DefaultISR                                    ;148
        DCD     DefaultISR                                    ;149
        DCD     DefaultISR                                    ;150
        DCD     DefaultISR                                    ;151
        DCD     DefaultISR                                    ;152
        DCD     DefaultISR                                    ;153
        DCD     DefaultISR                                    ;154
        DCD     DefaultISR                                    ;155
        DCD     DefaultISR                                    ;156
        DCD     DefaultISR                                    ;157
        DCD     DefaultISR                                    ;158
        DCD     DefaultISR                                    ;159
        DCD     DefaultISR                                    ;160
        DCD     DefaultISR                                    ;161
        DCD     DefaultISR                                    ;162
        DCD     DefaultISR                                    ;163
        DCD     DefaultISR                                    ;164
        DCD     DefaultISR                                    ;165
        DCD     DefaultISR                                    ;166
        DCD     DefaultISR                                    ;167
        DCD     DefaultISR                                    ;168
        DCD     DefaultISR                                    ;169
        DCD     DefaultISR                                    ;170
        DCD     DefaultISR                                    ;171
        DCD     DefaultISR                                    ;172
        DCD     DefaultISR                                    ;173
        DCD     DefaultISR                                    ;174
        DCD     DefaultISR                                    ;175
        DCD     DefaultISR                                    ;176
        DCD     DefaultISR                                    ;177
        DCD     DefaultISR                                    ;178
        DCD     DefaultISR                                    ;179
        DCD     DefaultISR                                    ;180
        DCD     DefaultISR                                    ;181
        DCD     DefaultISR                                    ;182
        DCD     DefaultISR                                    ;183
        DCD     DefaultISR                                    ;184
        DCD     DefaultISR                                    ;185
        DCD     DefaultISR                                    ;186
        DCD     DefaultISR                                    ;187
        DCD     DefaultISR                                    ;188
        DCD     DefaultISR                                    ;189
        DCD     DefaultISR                                    ;190
        DCD     DefaultISR                                    ;191
        DCD     DefaultISR                                    ;192
        DCD     DefaultISR                                    ;193
        DCD     DefaultISR                                    ;194
        DCD     DefaultISR                                    ;195
        DCD     DefaultISR                                    ;196
        DCD     DefaultISR                                    ;197
        DCD     DefaultISR                                    ;198
        DCD     DefaultISR                                    ;199
        DCD     DefaultISR                                    ;200
        DCD     DefaultISR                                    ;201
        DCD     DefaultISR                                    ;202
        DCD     DefaultISR                                    ;203
        DCD     DefaultISR                                    ;204
        DCD     DefaultISR                                    ;205
        DCD     DefaultISR                                    ;206
        DCD     DefaultISR                                    ;207
        DCD     DefaultISR                                    ;208
        DCD     DefaultISR                                    ;209
        DCD     DefaultISR                                    ;210
        DCD     DefaultISR                                    ;211
        DCD     DefaultISR                                    ;212
        DCD     DefaultISR                                    ;213
        DCD     DefaultISR                                    ;214
        DCD     DefaultISR                                    ;215
        DCD     DefaultISR                                    ;216
        DCD     DefaultISR                                    ;217
        DCD     DefaultISR                                    ;218
        DCD     DefaultISR                                    ;219
        DCD     DefaultISR                                    ;220
        DCD     DefaultISR                                    ;221
        DCD     DefaultISR                                    ;222
        DCD     DefaultISR                                    ;223
        DCD     DefaultISR                                    ;224
        DCD     DefaultISR                                    ;225
        DCD     DefaultISR                                    ;226
        DCD     DefaultISR                                    ;227
        DCD     DefaultISR                                    ;228
        DCD     DefaultISR                                    ;229
        DCD     DefaultISR                                    ;230
        DCD     DefaultISR                                    ;231
        DCD     DefaultISR                                    ;232
        DCD     DefaultISR                                    ;233
        DCD     DefaultISR                                    ;234
        DCD     DefaultISR                                    ;235
        DCD     DefaultISR                                    ;236
        DCD     DefaultISR                                    ;237
        DCD     DefaultISR                                    ;238
        DCD     DefaultISR                                    ;239
__Vectors_End

#ifdef BL_HAS_BOOTLOADER_CONFIG

__bootloaderConfigurationArea ; 0x3c0
        DCD     'kcfg'        ; [00:03] tag - Tag value used to validate the bootloader configuration data. Must be set to 'kcfg'.
        DCD     0xFFFFFFFF    ; [04:07] crcStartAddress
        DCD     0xFFFFFFFF    ; [08:0b] crcByteCount
        DCD     0xFFFFFFFF    ; [0c:0f] crcExpectedValue
        DCB     0xFF          ; [10:10] enabledPeripherals
        DCB     0xFF          ; [11:11] i2cSlaveAddress
        DCW     5000           ; [12:13] peripheralDetectionTimeoutMs - Timeout in milliseconds for peripheral detection before jumping to application code
        DCW     0xFFFF        ; [14:15] usbVid
        DCW     0xFFFF        ; [16:17] usbPid
        DCD     0xFFFFFFFF    ; [18:1b] usbStringsPointer
        DCB     0xFF          ; [1c:1c] clockFlags - High Speed and other clock options
        DCB     0xFF          ; [1d:1d] clockDivider - One's complement of clock divider, zero divider is divide by 1
        DCW     0xFFFF        ; [1e:1f] reserved
        ; Fill to align with flash configuration field. 
        REPT    (0x400-0x3e0)/4   ; 0x3E0 - 0x3FF
        DCD     0xFFFFFFFF        ; Reserved for user TRIM value
        ENDR 
#else        
        ; Fill to align with flash configuration field. 
        REPT    (0x400-0x3c0)/4 ; 0x3c0:0x400
        DCD     0xFFFFFFFF      ; Reserved for user TRIM value
        ENDR
#endif // BL_HAS_BOOTLOADER_CONFIG

        SECTION FlashConfig:CODE
__FlashConfig
      	DCD	0xFFFFFFFF
      	DCD	0xFFFFFFFF
      	DCD	0xFFFFFFFF
      	DCD	0xFFFFFFFE
__FlashConfig_End

__Vectors       EQU   __vector_table
__Vectors_Size 	EQU   __Vectors_End - __Vectors


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Default interrupt handlers.
;;
        THUMB

        PUBWEAK Reset_Handler
        SECTION .text:CODE:REORDER:NOROOT(2)
Reset_Handler
        CPSID   I               ; Mask interrupts
        LDR     R0, =SystemInit
        BLX     R0
        LDR     R0, =init_data_bss
        BLX     R0
        CPSIE   I               ; Unmask interrupts
        LDR     R0, =__iar_program_start
        BX      R0

        PUBWEAK NMI_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
NMI_Handler
        B .

        PUBWEAK HardFault_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
HardFault_Handler
        B .

        PUBWEAK MemManage_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
MemManage_Handler
        B .

        PUBWEAK BusFault_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
BusFault_Handler
        B .

        PUBWEAK UsageFault_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
UsageFault_Handler
        B .

        PUBWEAK SVC_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
SVC_Handler
        B .

        PUBWEAK DebugMon_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
DebugMon_Handler
        B .

        PUBWEAK PendSV_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
PendSV_Handler
        B .

        PUBWEAK SysTick_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
SysTick_Handler
        B .

        PUBWEAK DMA0_IRQHandler
        PUBWEAK DMA1_IRQHandler
        PUBWEAK DMA2_IRQHandler
        PUBWEAK DMA3_IRQHandler
        PUBWEAK DMA4_IRQHandler
        PUBWEAK DMA5_IRQHandler
        PUBWEAK DMA6_IRQHandler
        PUBWEAK DMA7_IRQHandler
        PUBWEAK DMA8_IRQHandler
        PUBWEAK DMA9_IRQHandler
        PUBWEAK DMA10_IRQHandler
        PUBWEAK DMA11_IRQHandler
        PUBWEAK DMA12_IRQHandler
        PUBWEAK DMA13_IRQHandler
        PUBWEAK DMA14_IRQHandler
        PUBWEAK DMA15_IRQHandler
        PUBWEAK DMA_Error_IRQHandler
        PUBWEAK MCM_IRQHandler
        PUBWEAK FTF_IRQHandler
        PUBWEAK Read_Collision_IRQHandler
        PUBWEAK LVD_LVW_IRQHandler
        PUBWEAK LLWU_IRQHandler
        PUBWEAK WDOG_EWM_IRQHandler
        PUBWEAK RNG_IRQHandler
        PUBWEAK LPI2C0_IRQHandler
        PUBWEAK LPI2C1_IRQHandler
        PUBWEAK SPI0_IRQHandler
        PUBWEAK SPI1_IRQHandler
        PUBWEAK I2S0_Tx_IRQHandler
        PUBWEAK I2S0_Rx_IRQHandler
        PUBWEAK LPUART0_IRQHandler
        PUBWEAK UART0_RX_TX_IRQHandler
        PUBWEAK UART0_ERR_IRQHandler
        PUBWEAK UART1_RX_TX_IRQHandler
        PUBWEAK UART1_ERR_IRQHandler
        PUBWEAK UART2_RX_TX_IRQHandler
        PUBWEAK UART2_ERR_IRQHandler
        PUBWEAK Reserved53_IRQHandler
        PUBWEAK Reserved54_IRQHandler
        PUBWEAK ADC0_IRQHandler
        PUBWEAK CMP0_IRQHandler
        PUBWEAK Reserved57_IRQHandler
        PUBWEAK TPM0_IRQHandler
        PUBWEAK TPM1_IRQHandler
        PUBWEAK TPM2_IRQHandler
        PUBWEAK Reserved61_IRQHandler
        PUBWEAK RTC_IRQHandler
        PUBWEAK RTC_Seconds_IRQHandler
        PUBWEAK PIT0_IRQHandler
        PUBWEAK PIT1_IRQHandler
        PUBWEAK PIT2_IRQHandler
        PUBWEAK PIT3_IRQHandler
        PUBWEAK PDB0_IRQHandler
        PUBWEAK USB0_IRQHandler
        PUBWEAK Reserved70_IRQHandler
        PUBWEAK Reserved71_IRQHandler
        PUBWEAK DAC0_IRQHandler
        PUBWEAK MCG_IRQHandler
        PUBWEAK LPTMR0_IRQHandler
        PUBWEAK PORTA_IRQHandler
        PUBWEAK PORTB_IRQHandler
        PUBWEAK PORTC_IRQHandler
        PUBWEAK PORTD_IRQHandler
        PUBWEAK PORTE_IRQHandler
        PUBWEAK SWI_IRQHandler
        PUBWEAK Reserved81_IRQHandler
        PUBWEAK Reserved82_IRQHandler
        PUBWEAK Reserved83_IRQHandler
        PUBWEAK Reserved84_IRQHandler
        PUBWEAK Reserved85_IRQHandler
        PUBWEAK FLEXIO_IRQHandler
        PUBWEAK Reserved87_IRQHandler
        PUBWEAK Reserved88_IRQHandler
        PUBWEAK Reserved89_IRQHandler
        PUBWEAK Reserved90_IRQHandler
        PUBWEAK CAN0_ORed_Message_buffer_IRQHandler
        PUBWEAK CAN0_Bus_Off_IRQHandler
        PUBWEAK CAN0_Error_IRQHandler
        PUBWEAK CAN0_Tx_Warning_IRQHandler
        PUBWEAK CAN0_Rx_Warning_IRQHandler
        PUBWEAK CAN0_Wake_Up_IRQHandler
        PUBWEAK Reserved97_IRQHandler
        PUBWEAK Reserved98_IRQHandler
        PUBWEAK Reserved99_IRQHandler
        PUBWEAK Reserved100_IRQHandler
        PUBWEAK Reserved101_IRQHandler
        PUBWEAK Reserved102_IRQHandler
        PUBWEAK Reserved103_IRQHandler
        PUBWEAK I2S1_Tx_IRQHandler
        PUBWEAK I2S1_Rx_IRQHandler
        PUBWEAK Reserved106_IRQHandler
        PUBWEAK Reserved107_IRQHandler
        PUBWEAK Reserved108_IRQHandler
        PUBWEAK Reserved109_IRQHandler
        PUBWEAK CAN1_ORed_Message_buffer_IRQHandler
        PUBWEAK CAN1_Bus_Off_IRQHandler
        PUBWEAK CAN1_Error_IRQHandler
        PUBWEAK CAN1_Tx_Warning_IRQHandler
        PUBWEAK CAN1_Rx_Warning_IRQHandler
        PUBWEAK CAN1_Wake_Up_IRQHandler
        PUBWEAK DefaultISR
        SECTION .text:CODE:REORDER:NOROOT(1)
DMA0_IRQHandler
DMA1_IRQHandler
DMA2_IRQHandler
DMA3_IRQHandler
DMA4_IRQHandler
DMA5_IRQHandler
DMA6_IRQHandler
DMA7_IRQHandler
DMA8_IRQHandler
DMA9_IRQHandler
DMA10_IRQHandler
DMA11_IRQHandler
DMA12_IRQHandler
DMA13_IRQHandler
DMA14_IRQHandler
DMA15_IRQHandler
DMA_Error_IRQHandler
MCM_IRQHandler
FTF_IRQHandler
Read_Collision_IRQHandler
LVD_LVW_IRQHandler
LLWU_IRQHandler
WDOG_EWM_IRQHandler
RNG_IRQHandler
LPI2C0_IRQHandler
LPI2C1_IRQHandler
SPI0_IRQHandler
SPI1_IRQHandler
I2S0_Tx_IRQHandler
I2S0_Rx_IRQHandler
LPUART0_IRQHandler
UART0_RX_TX_IRQHandler
UART0_ERR_IRQHandler
UART1_RX_TX_IRQHandler
UART1_ERR_IRQHandler
UART2_RX_TX_IRQHandler
UART2_ERR_IRQHandler
Reserved53_IRQHandler
Reserved54_IRQHandler
ADC0_IRQHandler
CMP0_IRQHandler
Reserved57_IRQHandler
TPM0_IRQHandler
TPM1_IRQHandler
TPM2_IRQHandler
Reserved61_IRQHandler
RTC_IRQHandler
RTC_Seconds_IRQHandler
PIT0_IRQHandler
PIT1_IRQHandler
PIT2_IRQHandler
PIT3_IRQHandler
PDB0_IRQHandler
USB0_IRQHandler
Reserved70_IRQHandler
Reserved71_IRQHandler
DAC0_IRQHandler
MCG_IRQHandler
LPTMR0_IRQHandler
PORTA_IRQHandler
PORTB_IRQHandler
PORTC_IRQHandler
PORTD_IRQHandler
PORTE_IRQHandler
SWI_IRQHandler
Reserved81_IRQHandler
Reserved82_IRQHandler
Reserved83_IRQHandler
Reserved84_IRQHandler
Reserved85_IRQHandler
FLEXIO_IRQHandler
Reserved87_IRQHandler
Reserved88_IRQHandler
Reserved89_IRQHandler
Reserved90_IRQHandler
CAN0_ORed_Message_buffer_IRQHandler
CAN0_Bus_Off_IRQHandler
CAN0_Error_IRQHandler
CAN0_Tx_Warning_IRQHandler
CAN0_Rx_Warning_IRQHandler
CAN0_Wake_Up_IRQHandler
Reserved97_IRQHandler
Reserved98_IRQHandler
Reserved99_IRQHandler
Reserved100_IRQHandler
Reserved101_IRQHandler
Reserved102_IRQHandler
Reserved103_IRQHandler
I2S1_Tx_IRQHandler
I2S1_Rx_IRQHandler
Reserved106_IRQHandler
Reserved107_IRQHandler
Reserved108_IRQHandler
Reserved109_IRQHandler
CAN1_ORed_Message_buffer_IRQHandler
CAN1_Bus_Off_IRQHandler
CAN1_Error_IRQHandler
CAN1_Tx_Warning_IRQHandler
CAN1_Rx_Warning_IRQHandler
CAN1_Wake_Up_IRQHandler
DefaultISR
        B DefaultISR

        END
