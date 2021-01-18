
all:	compile 

include ../../Makefile.env

TARGET			= lib_hw_network.a

DEPEND_FILES	= hsl_hw_network.o hsl_hw_network_wifi_eth_4g.o hsl_hw_network_wifi_8189.o
INC_FILE	= hsl_hw_network.h hsl_hw_network_wifi_eth_4g.h hsl_hw_network_wifi_8189.h

CFLAGS 	+= -I./ -I$(INCDIR)

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)

hsl_hw_network.o:  hsl_hw_network.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_hw_network_wifi_eth_4g.o:  hsl_hw_network_wifi_eth_4g.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_hw_network_wifi_8189.o:  hsl_hw_network_wifi_8189.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<
