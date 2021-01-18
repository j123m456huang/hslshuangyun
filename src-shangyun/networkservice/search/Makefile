
all:	compile 

include ../../Makefile.env

TARGET			= lib_net_search.a

DEPEND_FILES	= hsl_net_search.o hsl_net_factory.o
INC_FILE	= hsl_net_search.h hsl_net_factory.h

CFLAGS 	+= -I./ -I$(INCDIR)

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)

hsl_net_search.o:  hsl_net_search.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<
hsl_net_factory.o:  hsl_net_factory.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

