
all:	compile 

include ../../Makefile.env

TARGET		= lib_hw_track.a

DEPEND_FILES	= hsl_hw_track.o
INC_FILE	= hsl_hw_track.h

CFLAGS 	+= -I./ -I$(INCDIR) -I/home/jwchen/cjw-share/work-device/device/third_lib/track/Ingenic-IAAC/include -I/home/jwchen/cjw-share/work-device/device/third_lib/track/Ingenic-IIAL/IVS/include

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)
	rm -f $(INCDIR)/$(INC_FILE)

hsl_hw_track.o:  hsl_hw_track.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<
