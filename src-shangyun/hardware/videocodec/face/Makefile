
all:	compile 

include ../../../Makefile.env

TARGET		= lib_hw_face.a

DEPEND_FILES	= hsl_hw_face.o hsl_hw_face_det.o
INC_FILE	= hsl_hw_face.h hsl_hw_face_det.h

CFLAGS 	+= -I./ -I$(INCDIR) -I./face/include

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)

hsl_hw_face.o:  hsl_hw_face.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_hw_face_det.o:  hsl_hw_face_det.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<
