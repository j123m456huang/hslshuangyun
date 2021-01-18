
all:	compile 

include ../../../Makefile.env

TARGET		= lib_hw_people.a

DEPEND_FILES	= hsl_hw_people.o hsl_hw_people_det.o
INC_FILE	= hsl_hw_people.h hsl_hw_people_det.h

CFLAGS 	+= -I./ -I$(INCDIR) -I./people/include 
#-I/home/xhzeng/work-device/device/third_lib/people/Ingenic-ADKV2-2238837-202004160923/Ingenic-IIAL/IVS/include -I/home/xhzeng/work-device/device/third_lib/people/Ingenic-ADKV2-2238837-202004160923/Ingenic-IAAC/include

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)

hsl_hw_people.o:  hsl_hw_people.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_hw_people_det.o:  hsl_hw_people_det.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<
