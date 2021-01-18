
all:	compile 

include ../../Makefile.env

TARGET			= lib_hw_video.a

DEPEND_FILES	= hsl_hw_video.o
INC_FILE			= hsl_hw_video.h

CFLAGS 	+= -I./ -I$(INCDIR) -DFIXED_STREAM_TIME_OUT

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)
	rm -f $(INCDIR)/$(INC_FILE)

hsl_hw_video.o:  hsl_hw_video.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

