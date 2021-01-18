
all:	compile 

include ../../Makefile.env

TARGET		= lib_hw_upgrade.a

DEPEND_FILES	= hsl_hw_upgrade.o
INC_FILE	= hsl_hw_upgrade.h

CFLAGS 	+= -I./ -I$(INCDIR) -I./include

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)

hsl_hw_upgrade.o:  hsl_hw_upgrade.c
	$(CPP) -c -o $@ $(CFLAGS) $<

