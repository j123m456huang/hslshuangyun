
all:	compile 

include ../../Makefile.env

TARGET			= lib_hw_iic433.a

DEPEND_FILES	= hsl_hw_iic433.o
INC_FILE			= hsl_hw_iic433.h

CFLAGS 	+= -I./ -I$(INCDIR)

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)
	rm -f $(INCDIR)/$(INC_FILE)

hsl_hw_iic433.o:  hsl_hw_iic433.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

