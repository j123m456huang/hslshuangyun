
all:	compile 

include ../Makefile.env

TARGET			= lib_hw.a

DEPEND_FILES	= hsl_hw.o
INC_FILE			= hsl_hw.h

CFLAGS 	+= -I./ -I$(INCDIR)

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(ARCH) $?
	cp -f $(ARCH) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(ARCH) $(DEPEND_FILES)
	rm -f $(INCDIR)/$(INC_FILE)

hsl_hw.o:  hsl_hw.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

