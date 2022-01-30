#include<pic.h>
#include"LCD 4 BIT.h"
#include<htc.h>

#define I2C_WRITE 0
#define I2C_READ 1

void i2c_Wait()
{
    while ( ( SSPCON2 & 0x1F ) || ( SSPSTAT & 0x04 ) );
}

void i2c_Start(void)
{
    i2c_Wait();
    SEN=1;
	while(SSPIF==0);
}

void i2c_Write(unsigned char data)
{
    i2c_Wait();
	while(SSPIF==0);
    SSPBUF = data;
}

void i2c_Stop(void)
{
    i2c_Wait();
    PEN=1;
	while(SSPIF==0);
}

char k[]="STRING";

void main()
{
	int i;

	TRISD=0X00;
	PORTD=0X00;

	TRISC3=1;
	TRISC4=1;
	PORTC=0X00;

	Lcd_Intialization();

	SSPCON=0XA8;
	SSPCON2=0X00;
	SSPSTAT=0X80;		// SSPSTAT = 0X80;
	SSPADD=49;			// CLK = FCOS/(4*(SSPADD+1))

	Lcd_Command(0x80);
	Lcd_String("LYCA SOFT");

	while(1)
	{
		i2c_Start();
			i2c_Write(0x24);
			i2c_Write(0x85);
			i2c_Write(0xc4);
		i2c_Stop();
	}
}