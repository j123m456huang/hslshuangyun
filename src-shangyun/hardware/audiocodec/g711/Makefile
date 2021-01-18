
all:	compile 

include ../../../Makefile.env

TARGET			= lib_audio_g711.a

DEPEND_FILES	= hsl_audio_g711.o
INC_FILE			= hsl_audio_g711.h

CFLAGS 	+= -I./ -I$(INCDIR)

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)
	rm -f $(INCDIR)/$(INC_FILE)

hsl_audio_g711.o:  hsl_audio_g711.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

