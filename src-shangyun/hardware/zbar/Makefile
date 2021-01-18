
all:	compile 

include ../../Makefile.env

TARGET			= lib_hw_zbar.a

ZBAR_PATH = /home/jwchen/cjw-share/work-device/device/third_lib/zbar
DEPEND_FILES	= scan_video.o
INC_FILE	= scan_video.h

CFLAGS 	+= -I./ -I$(INCDIR) -I$(ZBAR_PATH)/include

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f lib/*.a $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)
	rm -f $(INCDIR)/$(INC_FILE)

scan_video.o:  scan_video.c
	$(CC) -c -o $@ $(CFLAGS) $<

