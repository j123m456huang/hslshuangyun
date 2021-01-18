
all:	compile 

include ../../Makefile.env

TARGET		= lib_hw_wifi_7682.a

DEPEND_FILES	= hsl_wifi_7682.o hsl_wifi_7682_scan.o hsl_hw_network_7682.o
INC_FILE	= hsl_hw_network_7682.h  hsl_wifi_7682.h

CFLAGS 	+= -I./ -I$(INCDIR)

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)

hsl_hw_network_7682.o:  hsl_hw_network_7682.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<
hsl_wifi_7682_scan.o:  hsl_wifi_7682_scan.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<
hsl_wifi_7682.o:  hsl_wifi_7682.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<
