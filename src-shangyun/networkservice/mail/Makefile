
all:	compile 

include ../../Makefile.env

TARGET			= lib_net_mail.a

DEPEND_FILES	= hsl_net_mail.o
INC_FILE		= hsl_net_mail.h

CFLAGS 	+= -I./ -I$(INCDIR)

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)
	rm -f $(INCDIR)/$(INC_FILE)

hsl_net_mail.o:  hsl_net_mail.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

