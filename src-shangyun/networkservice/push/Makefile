
all:	compile 

include ../../Makefile.env

TARGET			= lib_net_push.a

DEPEND_FILES	= hsl_net_push.o md5.o
INC_FILE		= hsl_net_push.h

CFLAGS 	+= -I./ -I$(INCDIR)

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)

hsl_net_push.o:  hsl_net_push.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<
md5.o:  md5.c
	$(CC) -c -o $@ $(CFLAGS) $<

