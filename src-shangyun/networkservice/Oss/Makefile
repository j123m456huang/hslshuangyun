
all:	compile 

include ../../Makefile.env

TARGET			= lib_net_oss.a

DEPEND_FILES	= oss.o
INC_FILE			= oss.h

CFLAGS 	+= -I./ -I$(INCDIR) -I/home/jwchen/cjw-share/work-device/device/third_lib/openssl/mips/include

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)
	rm -f $(INCDIR)/$(INC_FILE)

oss.o:  oss.c
	$(CPP) -c -o $@ $(CFLAGS) $<

