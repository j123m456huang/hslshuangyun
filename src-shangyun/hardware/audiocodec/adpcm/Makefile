
all:	compile 

include ../../../Makefile.env

TARGET			= lib_audio_adpcm.a

DEPEND_FILES	= hsl_audio_adpcm.o
INC_FILE			= hsl_audio_adpcm.h

CFLAGS 	+= -I./ -I$(INCDIR)

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)
	rm -f $(INCDIR)/$(INC_FILE)

hsl_audio_adpcm.o:  hsl_audio_adpcm.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

