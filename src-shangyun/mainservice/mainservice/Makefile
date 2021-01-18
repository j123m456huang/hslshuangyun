
all:	compile 

include ../../Makefile.env

TARGET			= lib_main_service.a

DEPEND_FILES	= hsl_main_service.o
INC_FILE		= hsl_main_service.h

CFLAGS 	+= -I./ -I$(INCDIR)

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)
	rm -f $(INCDIR)/$(INC_FILE)

hsl_main_service.o:  hsl_main_service.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

