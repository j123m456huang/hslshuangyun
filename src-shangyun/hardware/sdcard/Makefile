
all:	compile 

include ../../Makefile.env

TARGET			= lib_hw_sdcard.a

DEPEND_FILES	= hsl_hw_sdcard.o
INC_FILE			= hsl_hw_sdcard.h

CFLAGS 	+= -I./ -I$(INCDIR) -D_FILE_OFFSET_BITS=64

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)
	rm -f $(INCDIR)/$(INC_FILE)

hsl_hw_sdcard.o:  hsl_hw_sdcard.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

