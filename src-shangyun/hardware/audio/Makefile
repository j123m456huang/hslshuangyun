
all:	compile 

include ../../Makefile.env

TARGET			= lib_hw_audio.a

DEPEND_FILES		= hsl_hw_audio.o hsl_hw_audio_detect.o
INC_FILE		= hsl_hw_audio.h

CFLAGS 	+= -I./ -I$(INCDIR)

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)
	rm -f $(INCDIR)/$(INC_FILE)

hsl_hw_audio.o:  hsl_hw_audio.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_hw_audio_detect.o:  hsl_hw_audio_detect.c
	$(CPP) -c -o $@ $(CFLAGS) $<

