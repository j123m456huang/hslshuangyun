
all:	compile 

include ../../Makefile.env

TARGET			= lib_os_system.a

DEPEND_FILES	= hsl_os_system.o
INC_FILE	= hsl_os_system.h

CFLAGS 	+= -I./ -I$(INCDIR) -I/opt/mips-gcc472-glibc216-32bit/mips-linux-gnu/libc/usr/include -rdynamic

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)
	rm -f $(INCDIR)/$(INC_FILE)

hsl_os_system.o:  hsl_os_system.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

