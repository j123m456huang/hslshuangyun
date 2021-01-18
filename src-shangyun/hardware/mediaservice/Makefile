
all:	compile 

include ../../Makefile.env

TARGET			= lib_media_service.a

DEPEND_FILES	= hsl_media_service.o hsl_media_service_single.o hsl_media_service_single_t31.o hsl_media_service_sync.o hsl_media_service_mux.o
INC_FILE	= hsl_media_service.h

CFLAGS 	+= -I./ -I$(INCDIR)

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)
	rm -f $(INCDIR)/$(INC_FILE)

hsl_media_service.o:  hsl_media_service.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_media_service_single.o:hsl_media_service_single.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_media_service_single_t31.o:hsl_media_service_single_t31.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_media_service_sync.o:hsl_media_service_sync.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_media_service_mux.o:hsl_media_service_mux.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<
