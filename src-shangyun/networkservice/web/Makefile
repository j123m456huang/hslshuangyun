
all:	compile 

include ../../Makefile.env

TARGET			= lib_net_web.a

DEPEND_FILES	= hsl_net_web.o
INC_FILE		= hsl_net_web.h

CFLAGS 	+= -I./ -I$(INCDIR)

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)
	cp -f *.a $(LIBDIR)
	cp -f *.h $(INCDIR) 
clean:
	rm -f $(TARGET) $(DEPEND_FILES)
	rm -f $(INCDIR)/$(INC_FILE)

hsl_net_web.o:  hsl_net_web.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

