all:	compile 

include ../../../Makefile.env

TARGET			= lib_p2p_factory.a

DEPEND_FILES	= hsl_ppp_init.o
DEPEND_FILES += hsl_ppp_cmd.o
DEPEND_FILES += hsl_ppp_media.o
DEPEND_FILES += hsl_ppp_record.o
DEPEND_FILES += hsl_ppp_storage.o
DEPEND_FILES += hsl_cmd_list.o
DEPEND_FILES += hsl_ppp_upgrade.o 
DEPEND_FILES += hsl_p2p_run.o 

INC_FILE			= 	hsl_ppp_init.h 
INC_FILE			+= 	hsl_ppp_cmd.h
INC_FILE			+=  hsl_ppp_media.h
INC_FILE			+=  hsl_ppp_record.h
INC_FILE			+=  hsl_ppp_storage.h
INC_FILE			+=  hsl_ppp_upgrade.h
INC_FILE			+=  hsl_cmd_list.h
INC_FILE			+=  hsl_p2p_run.h
INC_FILE			+=  hsl_p2p_factory.h

CFLAGS 	+= -I./ -Iinclude -Izlib/include -I$(INCDIR) -DLINUX

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)
	cp -rf ppp $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)

%.o: %.c
	$(CPP) -c -o $@ $(CFLAGS) $<

%.o: %.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<
