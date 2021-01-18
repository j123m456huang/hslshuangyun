
all:	compile 

include ../../Makefile.env

TARGET			= lib_net_cgi.a

DEPEND_FILES	= hsl_cjson.o hsl_cgi_get.o  hsl_cgi_ioctl.o  hsl_cgi_media.o  hsl_cgi_set.o hsl_cgi_common.o hsl_net_cgi.o hsl_cgi_audio.o
INC_FILE	= hsl_cgi_common.h hsl_net_cgi.h hsl_cgi_get.h  hsl_cgi_ioctl.h  hsl_cgi_media.h  hsl_cgi_set.h hsl_cgi_audio.h hsl_cgi_cmd.h

CFLAGS 	+= -I./ -I$(INCDIR)

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)

hsl_net_cgi.o:  hsl_net_cgi.cpp
	 $(CPP) -c -o $@ $(CFLAGS) $<
hsl_cgi_get.o:  hsl_cgi_get.cpp
	 $(CPP) -c -o $@ $(CFLAGS) $<
hsl_cgi_ioctl.o: hsl_cgi_ioctl.cpp
	 $(CPP) -c -o $@ $(CFLAGS) $<
hsl_cgi_media.o: hsl_cgi_media.cpp
	 $(CPP) -c -o $@ $(CFLAGS) $<
hsl_cgi_set.o: hsl_cgi_set.cpp
	 $(CPP) -c -o $@ $(CFLAGS) $<
hsl_cgi_common.o: hsl_cgi_common.c
	 $(CPP) -c -o $@ $(CFLAGS) $<
hsl_cjson.o: hsl_cjson.c
	$(CPP) -c -o $@ $(CFLAGS) $<
hsl_cgi_audio.o: hsl_cgi_audio.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<
