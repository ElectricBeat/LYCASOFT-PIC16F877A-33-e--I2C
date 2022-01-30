#include<pic.h>
#define _XTAL_FREQ 20000000

void i2c_Wait(void)
{
    while ( ( SSPCON2 & 0x1F ) || ( SSPSTAT & 0x04 ) );
}

void i2c_Start(void)
{
    i2c_Wait();
    SEN=1;
}

void i2c_Stop(void)
{
    i2c_Wait();
    PEN=1;
}

char receive()
{
	char s;
	SSPIF=1;
	s=SSPBUF;
	__delay_ms(100);
	return s;
}

void cmd(char x,char y)
{
	RB0=y;
	RB1=0;
	RB2=1;
	PORTD=x;
	RB2=0;
	__delay_ms(70);
}

void main()
{
	int i;
	char ch;
	char a[]="STRING";
	
	TRISB=0x00;
	PORTB=0x00;

	TRISD=0x00;
	PORTD=0x00;

	TRISC3=1;
	TRISC4=1;
	PORTC=0x00;

	cmd(0x38,0);
	cmd(0x06,0);
	cmd(0x01,0);
	cmd(0x80,0);
	cmd(0x0d,0);
	__delay_ms(50);

	SSPSTAT=0x84;
	SSPCON=0x66;
	SSPCON2=0x00;
	SSPADD=0x24;
	SSPBUF=0;
	SSPIF=0;

	while(1)
	{
		i2c_Start();
		if(ACKSTAT==0)
		{
			SSPBUF=0;
			ch=receive();

			CKP=1;
			i2c_Stop();
		}
	}
}