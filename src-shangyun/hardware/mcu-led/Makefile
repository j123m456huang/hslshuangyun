
all:	compile 

include ../../Makefile.env

TARGET		= lib_hw_mcu_led.a

DEPEND_FILES	= hsl_hw_mcu_led.o
INC_FILE	= hsl_hw_mcu_led.h

CFLAGS 	+= -I./ -I$(INCDIR)

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)

hsl_hw_mcu_led.o:  hsl_hw_mcu_led.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<
