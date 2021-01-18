
all:	compile 

include ../../../Makefile.env

TARGET		= lib_hw_lcd_2911.a

DEPEND_FILES	= hsl_hw_lcd_2911.o lcd-i2c.o lcd-gpio.o lt2911r.o dcs.o
INC_FILE	= hsl_hw_lcd_2911.h lcd-i2c.h lcd-gpio.h lt2911r.h dcs.h

CFLAGS 	+= -I./ -I$(INCDIR) 

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(ARCH) $(DEPEND_FILES)

hsl_hw_lcd_2911.o:  hsl_hw_lcd_2911.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<
lcd-i2c.o:  lcd-i2c.c
	$(CC) -c -o $@ $(CFLAGS) $<
lt2911r.o:  lt2911r.c
	$(CC) -c -o $@ $(CFLAGS) $<
dcs.o: dcs.c
	$(CC) -c -o $@ $(CFLAGS) $<
