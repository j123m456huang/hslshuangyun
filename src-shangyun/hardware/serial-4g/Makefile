
all:	compile 

include ../../Makefile.env

TARGET		= lib_hw_4g.a

DEPEND_FILES	= hsl_hw_4g_serial.o hsl_serial_at.o hsl_hw_4g_serial_sim.o hsl_hw_4g_serial_yuge.o
INC_FILE	= hsl_hw_4g_serial.h hsl_serial_at.h hsl_hw_4g_serial_sim.h hsl_hw_4g_serial_yuge.h

CFLAGS 	+= -I./ -I$(INCDIR)

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)

hsl_hw_4g_serial.o:  hsl_hw_4g_serial.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_hw_4g_serial_sim.o:  hsl_hw_4g_serial_sim.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_hw_4g_serial_yuge.o:  hsl_hw_4g_serial_yuge.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_serial_at.o:  hsl_serial_at.c
	$(CPP) -c -o $@ $(CFLAGS) $<
