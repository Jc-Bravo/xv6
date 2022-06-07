/*
 * FileName: vesamode.h 
 * Author: Liu Tongtong
 * Date: 2015.01.23
 * Version: 1.0
 *
 * TODO: 
 * 1. The GUI may not work properly if the width and height changes.
 *    You have to change the code according to SCREEN_WIDTH and SCREEN_HEIGHT.
 *
 */

// Global VESA mode information variables
extern unsigned short SCREEN_WIDTH;
extern unsigned short SCREEN_HEIGHT;
extern unsigned short* SCREEN_PHYSADDR;
extern unsigned short* VESA_ADDR;

// Get the VESA mode information
void vesamodeinit();
