
all:	compile 

include ../../Makefile.env

TARGET			= lib_hw_led.a

DEPEND_FILES	= hsl_hw_led.o
INC_FILE			= hsl_hw_led.h

CFLAGS 	+= -I./ -I$(INCDIR)

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)
	rm -f $(INCDIR)/$(INC_FILE)

hsl_hw_led.o:  hsl_hw_led.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

