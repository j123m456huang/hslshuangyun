
all:	compile 

include ../../Makefile.env

TARGET		= lib_hw_mcu_serial.a

DEPEND_FILES	= hsl_hw_mcu_serial.o hsl_hw_mcu_iot.o mcu_7682_serial.o spi_serial.o
INC_FILE	= hsl_hw_mcu_serial.h hsl_hw_mcu_iot.h mcu_7682_serial.h spi_serial.h z7682.h

CFLAGS 	+= -I./ -I$(INCDIR)

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)

hsl_hw_mcu_serial.o:  hsl_hw_mcu_serial.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<
hsl_hw_mcu_iot.o:  hsl_hw_mcu_iot.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<
mcu_7682_serial.o:  mcu_7682_serial.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<
spi_serial.o:  spi_serial.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<
