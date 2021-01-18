
all:	compile 

include ../../Makefile.env

TARGET			= lib_hw_eeprom.a

DEPEND_FILES	= hsl_hw_eeprom.o
INC_FILE			= hsl_hw_eeprom.h

CFLAGS 	+= -I./ -I$(INCDIR)

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)
	rm -f $(INCDIR)/$(INC_FILE)

hsl_hw_eeprom.o:  hsl_hw_eeprom.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

