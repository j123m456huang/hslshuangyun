
all:	compile 

include ../Makefile.env

TARGET			= lib_factory.a

DEPEND_FILES	= hsl_factory.o
INC_FILE			= hsl_factory.h

CFLAGS 	+= -I./ -I$(INCDIR)

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)
	rm -f $(INCDIR)/$(INC_FILE)

hsl_factory.o:  hsl_factory.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

