
all:	compile 

include ../../Makefile.env

TARGET			= lib_hw.a

DEPEND_FILES	= hsl_hw_ipc.o hsl_hw_eth_ipc.o hsl_hw_eth_wifi_4g.o hsl_hw_bat_4g.o hsl_hw_bat_4g_ipc.o hsl_hw_bat_camera_led.o hsl_hw_bat_ipc.o hsl_hw_bat_camera.o hsl_hw_bat_camera_lcd.o hsl_hw_bat_camera_lcd_7682.o hsl_hw_bat_sleep.o hsl_hw_mcu_event.o hsl_hw_mcu_event_door.o hsl_hw_mcu_event_lcd.o hsl_hw_bat_camera_7682.o
INC_FILE	= hsl_hw_ipc.h hsl_hw_eth_ipc.h hsl_hw_eth_wifi_4g.h hsl_hw_bat_4g.h hsl_hw_bat_4g_ipc.h hsl_hw_bat_camera_led.h hsl_hw_bat_ipc.h hsl_hw_bat_camera.h hsl_hw_bat_camera_lcd.h hsl_hw_bat_camera_lcd_7682.h hsl_hw_bat_sleep.h hsl_hw_mcu_event.h hsl_hw_bat_camera_7682.h

CFLAGS 	+= -I./ -I$(INCDIR)

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)

hsl_hw_ipc.o:  hsl_hw_ipc.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_hw_eth_ipc.o: hsl_hw_eth_ipc.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_hw_eth_wifi_4g.o: hsl_hw_eth_wifi_4g.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_hw_bat_camera_led.o:  hsl_hw_bat_camera_led.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_hw_bat_4g.o:  hsl_hw_bat_4g.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_hw_bat_4g_ipc.o:  hsl_hw_bat_4g_ipc.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_hw_bat_camera_lcd_7682.o:  hsl_hw_bat_camera_lcd_7682.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_hw_bat_ipc.o:  hsl_hw_bat_ipc.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_hw_bat_sleep.o:  hsl_hw_bat_sleep.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_hw_mcu_event.o: hsl_hw_mcu_event.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_hw_mcu_event_door.o: hsl_hw_mcu_event_door.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<


hsl_hw_mcu_event_lcd.o: hsl_hw_mcu_event_lcd.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_hw_bat_camera.o: hsl_hw_bat_camera.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_hw_bat_camera_lcd.o: hsl_hw_bat_camera_lcd.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<
hsl_hw_bat_camera_7682.o: hsl_hw_bat_camera_7682.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<
