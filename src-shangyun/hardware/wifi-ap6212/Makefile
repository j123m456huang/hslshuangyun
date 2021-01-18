
all:	compile 

include ../../Makefile.env

TARGET		= lib_hw_ap6212.a

DEPEND_FILES	= hsl_hw_network_ap6212.o hsl_wifi_ap6212.o  ap6212_hw.o ap6212_eth.o hsl_wifi_ap6212_scan.o
INC_FILE	= hsl_hw_network_ap6212.h hsl_wifi_ap6212.h  ap6212_hw.h ap6212_eth.h

CFLAGS 	+= -I./ -I$(INCDIR)

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f ipconfig/libipconfig.a $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)

hsl_hw_network_ap6212.o:  hsl_hw_network_ap6212.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_wifi_ap6212.o:  hsl_wifi_ap6212.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

ap6212_hw.o:  ap6212_hw.c
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_wifi_ap6212_scan.o:  hsl_wifi_ap6212_scan.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

ap6212_eth.o:  ap6212_eth.c
	$(CPP) -c -o $@ $(CFLAGS) $<
