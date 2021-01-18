
all:	compile 

include ../../Makefile.env

TARGET			= lib_soft_moto.a

DEPEND_FILES		= hsl_soft_moto.o	hsl_hw_ptz.o
INC_FILE		= hsl_soft_moto.h	hsl_hw_ptz.h

CFLAGS 	+= -I./ -I$(INCDIR)

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)

hsl_soft_moto.o:  hsl_soft_moto.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_hw_ptz.o:  hsl_hw_ptz.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<
