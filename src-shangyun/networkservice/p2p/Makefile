
all:	compile 

include ../../Makefile.env

TARGET		= lib_net_p2p.a

DEPEND_FILES	= hsl_net_p2p.o
INC_FILE	= hsl_net_p2p.h

CFLAGS 	+= -I./ -I./include -I$(INCDIR) -I./shangyun -DLINUX

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)
	rm -f $(INCDIR)/$(INC_FILE)

hsl_net_p2p.o:  hsl_net_p2p.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

