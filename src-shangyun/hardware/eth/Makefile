
all:	compile 

include ../../Makefile.env

TARGET			= lib_hw_eth.a

DEPEND_FILES	= hsl_hw_eth.o hsl_hw_eth_4g.o
INC_FILE	= hsl_hw_eth.h hsl_hw_eth_4g.h

CFLAGS 	+= -I./ -I$(INCDIR)

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)

hsl_hw_eth.o:  hsl_hw_eth.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_hw_eth_4g.o:  hsl_hw_eth_4g.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<
