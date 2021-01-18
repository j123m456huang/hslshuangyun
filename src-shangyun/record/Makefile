
all:	compile 

include ../Makefile.env

TARGET		= lib_record.a

DEPEND_FILES	= hsl_record.o hsl_record_bat.o hsl_record_file.o hsl_record_search.o hsl_record_mp4.o hsl_record_avi.o avilib.o
INC_FILE	= hsl_record.h hsl_record_bat.h hsl_record_file.h hsl_record_search.h hsl_record_mp4.h hsl_record_avi.h avilib.h

CFLAGS 	+= -I./ -I$(INCDIR)

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)

hsl_record.o:  hsl_record.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_record_bat.o:  hsl_record_bat.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_record_file.o: hsl_record_file.c
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_record_avi.o: hsl_record_avi.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

avilib.o: avilib.c
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_record_search.o: hsl_record_search.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_record_mp4.o: hsl_record_mp4.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<
