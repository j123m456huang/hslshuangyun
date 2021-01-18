
all:	compile 

include ../../Makefile.env

TARGET			= lib_com_message.a

DEPEND_FILES	= hsl_com_message.o
INC_FILE		= hsl_com_message.h

CFLAGS 	+= -I./ -I$(INCDIR)

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)
	rm -f $(INCDIR)/$(INC_FILE)

hsl_com_message.o:  hsl_com_message.c
	$(CPP) -c -o $@ $(CFLAGS) $<

