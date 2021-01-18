
all:	compile 

include ../../../Makefile.env

TARGET			= lib_audio_aac.a

DEPEND_FILES	= hsl_audio_aac.o
INC_FILE			= hsl_audio_aac.h

CFLAGS 	+= -I./ -I$(INCDIR)

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)
	rm -f $(INCDIR)/$(INC_FILE)

hsl_audio_aac.o:  hsl_audio_aac.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

