
all:	compile 

include ../../Makefile.env

TARGET		= lib_hw_param.a

DEPEND_FILES	= hsl_hw_param.o hsl_sys_param.o hsl_hw_api.o hsl_hw_pipe.o hsl_hw_timer.o hsl_hw_ping.o hsl_hw_cc936.o hsl_hw_sha256.o
INC_FILE	= hsl_hw_param.h hsl_sys_param.h hsl_hw_api.h hsl_hw_pipe.h hsl_hw_timer.h hsl_hw_ping.h hsl_hw_cc936.h hsl_hw_sha256.h

CFLAGS 	+= -I./ -I$(INCDIR) -I/home/jwchen/cjw-share/work-device/device/third_lib/hslenc

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)

hsl_hw_param.o:  hsl_hw_param.c
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_sys_param.o:  hsl_sys_param.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_hw_api.o:  hsl_hw_api.c
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_hw_pipe.o:hsl_hw_pipe.c
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_hw_timer.o:hsl_hw_timer.c
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_hw_ping.o:hsl_hw_ping.c
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_hw_cc936.o:hsl_hw_cc936.c
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_hw_sha256.o:hsl_hw_sha256.c
	$(CPP) -c -o $@ $(CFLAGS) $<
