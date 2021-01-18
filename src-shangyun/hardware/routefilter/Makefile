
all:	compile 

include ../../Makefile.env

TARGET			= lib_router_filter.a

DEPEND_FILES	= hsl_router_filter.o
INC_FILE			= hsl_router_filter.h

CFLAGS 	+= -I./ -I$(INCDIR)

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)
	rm -f $(INCDIR)/$(INC_FILE)

hsl_router_filter.o:  hsl_router_filter.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

