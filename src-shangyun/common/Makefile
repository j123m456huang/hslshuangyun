
all:	compile 

include ../Makefile.env

TARGET		= lib_comm.a

DEPEND_FILES	= hsl_common.o
INC_FILE	= hsl_common.h

CFLAGS 	+= -I$(INCDIR)

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(ARCH) $(DEPEND_FILES)
	rm -f $(INCDIR)/$(INC_FILE)

hsl_common.o:  hsl_common.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

