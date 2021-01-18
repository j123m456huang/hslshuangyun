
all:	compile 

include ../../Makefile.env

TARGET		= lib_hw_moto.a

DEPEND_FILES	= hsl_hw_moto.o hsl_hw_moto_by_mcu.o
INC_FILE	= hsl_hw_moto.h hsl_hw_moto_by_mcu.h

CFLAGS 	+= -I./ -I$(INCDIR)

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)
#	rm -f $(INCDIR)/$(INC_FILE)

hsl_hw_moto.o:  hsl_hw_moto.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_hw_moto_by_mcu.o:  hsl_hw_moto_by_mcu.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<
