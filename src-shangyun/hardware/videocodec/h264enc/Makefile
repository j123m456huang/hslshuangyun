
all:	compile 

include ../../../Makefile.env

TARGET			= lib_hw_h264.a

DEPEND_FILES	= hsl_hw_h264_enc.o  hsl_hw_h264_isp.o  hsl_hw_h264_motion.o  hsl_hw_h264_osd.o hsl_hw_h264.o hsl_hw_h264_t31.o hsl_hw_h264_isp_t31.o hsl_hw_h264_lcd.o hsl_hw_h264_lcd_ui.o
INC_FILE	= hsl_hw_h264.h hsl_hw_h264_enc.h  hsl_hw_h264_isp.h  hsl_hw_h264_t31.h hsl_hw_h264_isp_t31.h hsl_hw_h264_motion.h  hsl_hw_h264_osd.h hsl_hw_h264_lcd.h hsl_hw_h264_lcd_ui.h

CFLAGS 	+= -I./ -I$(INCDIR) -I/home/jwchen/cjw-share/work-device/device/third_lib/track/Ingenic-IAAC/include -I/home/jwchen/cjw-share/work-device/device/third_lib/track/Ingenic-IIAL/IVS/include

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(ARCH) $(DEPEND_FILES)

hsl_hw_h264.o:  hsl_hw_h264.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<
hsl_hw_h264_t31.o:  hsl_hw_h264_t31.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<
hsl_hw_h264_isp_t31.o:  hsl_hw_h264_isp_t31.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<
hsl_hw_h264_lcd.o:  hsl_hw_h264_lcd.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<
hsl_hw_h264_lcd_ui.o:  hsl_hw_h264_lcd_ui.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<
hsl_hw_h264_enc.o:  hsl_hw_h264_enc.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<
hsl_hw_h264_isp.o:  hsl_hw_h264_isp.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<
hsl_hw_h264_motion.o: hsl_hw_h264_motion.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<
hsl_hw_h264_osd.o: hsl_hw_h264_osd.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<
