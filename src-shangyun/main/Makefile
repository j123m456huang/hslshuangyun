
all:	compile 

include ../Makefile.env

TARGET			= encoder

DEPEND_FILES	= main.o
INC_FILE		= 

#SSL_PATH=/home/jwchen/cjw-share/work-device/device/bsp/Ingenic-SDK-T10T20-3.12.0-20180320/opensource/rootfs-uclibc/lib
SSL_PATH=/home/jwchen/cjw-share/work-device/device/third_lib/openssl/mips/lib

CFLAGS 	+= -I./ -I./include -D_FILE_OFFSET_BITS=64 -DLINUX

LIBS_PERSON =    $(WORK_PATH)/lib/lib_factory.a				\
				$(WORK_PATH)/lib/lib_main_service.a		\
				$(WORK_PATH)/lib/lib_hw.a					\
				$(WORK_PATH)/lib/lib_media_service.a		\
				$(WORK_PATH)/lib/lib_net_service.a			\
				$(WORK_PATH)/lib/lib_net_date.a			\
				$(WORK_PATH)/lib/lib_net_ftp.a				\
				$(WORK_PATH)/lib/lib_net_mail.a			\
				$(WORK_PATH)/lib/lib_net_ntp.a				\
				$(WORK_PATH)/lib/lib_net_web.a			\
				$(WORK_PATH)/lib/lib_net_search.a			\
				$(WORK_PATH)/lib/lib_net_p2p.a				\
				$(WORK_PATH)/lib/lib_os_system.a			\
				$(WORK_PATH)/lib/lib_hw_audio.a			\
				$(WORK_PATH)/lib/lib_audio_adpcm.a		\
				$(WORK_PATH)/lib/lib_audio_aac.a			\
				$(WORK_PATH)/lib/lib_audio_g711.a			\
				$(WORK_PATH)/lib/lib_hw_eeprom.a			\
				$(WORK_PATH)/lib/lib_hw_gpio.a				\
				$(WORK_PATH)/lib/lib_hw_iic433.a			\
				$(WORK_PATH)/lib/lib_hw_iic.a				\
				$(WORK_PATH)/lib/lib_hw_irled.a			\
				$(WORK_PATH)/lib/lib_hw_jpeg.a			\
				$(WORK_PATH)/lib/lib_hw_led.a				\
				$(WORK_PATH)/lib/lib_hw_pmu.a			\
				$(WORK_PATH)/lib/lib_hw_cw.a				\
				$(WORK_PATH)/lib/lib_hw_moto.a			\
				$(WORK_PATH)/lib/lib_soft_moto.a			\
				$(WORK_PATH)/lib/lib_hw_alarm.a			\
				$(WORK_PATH)/lib/lib_net_push.a			\
				$(WORK_PATH)/lib/lib_hw_network.a			\
				$(WORK_PATH)/lib/lib_hw_eth.a				\
				$(WORK_PATH)/lib/lib_router_filter.a			\
				$(WORK_PATH)/lib/lib_hw_wifi_8188.a		\
				$(WORK_PATH)/lib/lib_hw_wifi_7601.a		\
				$(WORK_PATH)/lib/lib_hw_wifi_7682.a		\
				$(WORK_PATH)/lib/lib_hw_param.a			\
				$(WORK_PATH)/lib/hsl_web_c.a				\
				$(WORK_PATH)/lib/lib_hw_rtc.a				\
				$(WORK_PATH)/lib/lib_hw_sdcard.a			\
				$(WORK_PATH)/lib/lib_hw_sensor.a			\
				$(WORK_PATH)/lib/lib_hw_mcu_serial.a		\
				$(WORK_PATH)/lib/lib_hw_mcu_led.a			\
				$(WORK_PATH)/lib/lib_hw_4g.a				\
				$(WORK_PATH)/lib/lib_hw_serial.a			\
				$(WORK_PATH)/lib/lib_hw_simpleconfig.a		\
				$(WORK_PATH)/lib/lib_hw_video.a			\
				$(WORK_PATH)/lib/lib_hw_wdt.a				\
				$(WORK_PATH)/lib/lib_hw_h264.a			\
				$(WORK_PATH)/lib/lib_hw_lcd_2911.a			\
				$(WORK_PATH)/lib/lib_hw_bmp.a			\
				$(WORK_PATH)/lib/lib_hw_track.a			\
				$(WORK_PATH)/lib/lib_hw_upgrade.a			\
				$(WORK_PATH)/lib/lib_com_message.a		\
				$(WORK_PATH)/lib/lib_net_oss.a				\
				$(WORK_PATH)/lib/lib_comm.a

LIBS_THIRD = 

LIBS += $(LIBS_THIRD)

#track
ifeq ($(TRACK),1)
CFALGS+=-I$(INGENIC_IAAC)/include
CFALGS+=-I$(INGENIC_IIAL)/IVS/include
LIBS += $(LIBS_THIRD)
endif


#LIBS+=/home/xhzeng/work-device/device/bsp/Zeratul_2.1.0_Zealot_20180529/lib/uclibc/libimp-t10.a
#LIBS+=/home/xhzeng/work-device/device/bsp/Zeratul_2.1.0_Zealot_20180529/lib/uclibc/libsysutils.a
#LIBS+=/home/xhzeng/work-device/device/bsp/Zeratul_2.1.0_Zealot_20180529/lib/uclibc/libalog.a
#LIBS+=/home/xhzeng/work-device/device/bsp/Zeratul_2.1.0_Zealot_20180529/lib/uclibc/libsysutils.a


#LIBS+=/home/xhzeng/work-device/device/third_lib/json/libjson.a
#				/home/xhzeng/work-device/device/third_lib/json/libjson.a


#=====================shangyun=====================================
ifeq ($(PPP),SHANGYUN)
$(warning SHANGYUN P2P)
LDFLAGS = -L$(SSL_PATH) -lpthread -lm -lrt -muclibc -lssl -lcrypto -ldl

#LIBS_PPP_PERSON=$(WORK_PATH)/lib/lib_p2p_danale.a
LIBS_PPP_PERSON=$(WORK_PATH)/lib/lib_p2p_factory.a
LIBS_PPP_PERSON +=$(WORK_PATH)/lib/lib_hw_zbar.a
LIBS_PPP_PERSON +=$(WORK_PATH)/lib/libzbar.a
LIBS_PPP_PERSON +=$(WORK_PATH)/lib/lib_record.a
LIBS_PPP_PERSON +=$(WORK_PATH)/lib/lib_audio_aac.a 
LIBS_PPP_PERSON +=$(WORK_PATH)/lib/lib_net_cgi.a
LIBS_PPP_PERSON+=/home/jwchen/cjw-share/work-device/device/third_lib/shangyun/lib/libPPCS_API.a
LIBS_PPP_PERSON+=/home/jwchen/cjw-share/work-device/device/third_lib/hslenc/lib_hslenc.a

LIBS += $(LIBS_PERSON)
LIBS +=$(LIB_SYSTEM)

LIBS+=/home/jwchen/cjw-share/work-device/device/third_lib/waveconfig/lib_wave_config-aplink.a
LIBS+=/home/jwchen/cjw-share/work-device/device/third_lib/curl/libcurl.a
LIBS+=/home/jwchen/cjw-share/work-device/device/third_lib/curl/libz.a


endif

#=====================danale=====================================
ifeq ($(PPP),DANALE)
LDFLAGS = -L$(SSL_PATH) -lpthread -lm -lrt -lssl  -muclibc -lcrypto -ldl
LIBS += $(LIBS_PERSON)
LIBS += $(LIB_SYSTEM)

LIBS_PPP_THIRD +=/home/xhzeng/work-device/device/third_lib/danale/libdana_video_plus.a
LIBS_PPP_PERSON=$(WORK_PATH)/lib/lib_p2p_factory.a
LIBS_PPP_PERSON +=$(WORK_PATH)/lib/lib_hw_zbar.a
LIBS_PPP_PERSON +=$(WORK_PATH)/lib/libzbar.a
LIBS_PPP_PERSON +=$(WORK_PATH)/lib/lib_record.a
LIBS_PPP_PERSON +=$(WORK_PATH)/lib/lib_audio_aac.a 


LIBS+=/home/jwchen/cjw-share/work-device/device/third_lib/waveconfig/lib_wave_config-aplink.a
LIBS+=/home/jwchen/cjw-share/work-device/device/third_lib/curl/libcurl.a
LIBS+=/home/jwchen/cjw-share/work-device/device/third_lib/curl/libz.a


$(warning DANALE P2P)
endif



#=====================tuya=====================================
ifeq ($(PPP),TUYA)
LDFLAGS = -L$(SSL_PATH) -lpthread -lm -lrt -lssl  -muclibc -lcrypto -ldl
LIBS += $(LIBS_PERSON)
LIBS += $(LIB_SYSTEM)

#LIBS_PPP_THIRD +=/home/xhzeng/work-device/device/third_lib/tuya/tuya_ipc_sdk/libs/libtuya_ipc.a
#LIBS_PPP_THIRD +=/home/xhzeng/work-device/device/third_lib/tuya/tuya_ipc_sdk/libs/libmbedtls.a
LIBS_PPP_PERSON =$(WORK_PATH)/lib/lib_hw_zbar.a
LIBS_PPP_PERSON +=$(WORK_PATH)/lib/libzbar.a
LIBS_PPP_PERSON +=$(WORK_PATH)/lib/lib_record.a
LIBS_PPP_PERSON +=$(WORK_PATH)/lib/lib_audio_aac.a 
LIBS_PPP_PERSON +=$(WORK_PATH)/lib/lib_p2p_factory.a
LIBS_PPP_PERSON +=$(WORK_PATH)/lib/lib_net_cgi.a

LIBS_PPP_PERSON +=/home/jwchen/cjw-share/work-device/device/third_lib/tuya/tuya_ipc_sdk/libs/libtuya_ipc.a
LIBS_PPP_PERSON +=/home/jwchen/cjw-share/work-device/device/third_lib/tuya/tuya_ipc_sdk/libs/libmbedtls.a
LIBS+=/home/jwchen/cjw-share/work-device/device/third_lib/waveconfig/lib_wave_config-aplink.a
LIBS+=/home/jwchen/cjw-share/work-device/device/third_lib/curl/libcurl.a
LIBS+=/home/jwchen/cjw-share/work-device/device/third_lib/curl/libz.a

$(warning UNICOM P2P)
endif

ifeq ($(IVS_TRACK),1)
LDFLAGS+=-L$(IAAC_PATH)/lib/uclibc -L$(IIAL_PATH)/IVS/lib/uclibc -liaac -lverify 
LIBS+=-ldynamic_tracker_inf
LIBS+=$(IIAL_PATH)/MXU/lib/uclibc/libmxu_merge.a
LIBS+=$(IIAL_PATH)/MXU/lib/uclibc/libmxu_objdetect.a
LIBS+=$(IIAL_PATH)/MXU/lib/uclibc/libmxu_contrib.a
LIBS+=$(IIAL_PATH)/MXU/lib/uclibc/libmxu_video.a
LIBS+=$(IIAL_PATH)/MXU/lib/uclibc/libmxu_imgproc.a
LIBS+=$(IIAL_PATH)/MXU/lib/uclibc/libmxu_core.a
endif

ifeq ($(MP4_RECORD),1)
#MP4_LIB=/home/xhzeng/work-device/device/third_lib/mp4
LIBS_PPP_THIRD += $(MP4_LIB)/lib/libmp4record.a
LIBS_PPP_THIRD += $(MP4_LIB)/lib/libmp4v2.a
LIBS_PPP_THIRD += $(MP4_LIB)/lib/libfdk-aac.a
endif
ifeq ($(IVS_PEOPLE),1)
IVS_PERSON =-L$(IAAC_PATH)/lib/uclibc -L$(IIAL_PATH)/IVS/lib/uclibc -liaac  -lpersonDet_inf
IVS_PERSON+=$(IIAL_PATH)/IVS/lib/uclibc/libjzdl.a
IVS_PERSON+=$(IIAL_PATH)/MXU/lib/uclibc/libmxu_merge.a
IVS_PERSON+=$(IIAL_PATH)/MXU/lib/uclibc/libmxu_objdetect.a
IVS_PERSON+=$(IIAL_PATH)/MXU/lib/uclibc/libmxu_contrib.a
IVS_PERSON+=$(IIAL_PATH)/MXU/lib/uclibc/libmxu_video.a
IVS_PERSON+=$(IIAL_PATH)/MXU/lib/uclibc/libmxu_imgproc.a
IVS_PERSON+=$(IIAL_PATH)/MXU/lib/uclibc/libmxu_core.a
endif

ifeq ($(JPEG),1)
LIBS+=$(YUVSCALE_PATH)/libjzscale_nv12.a
LDFLAGS +=  -Wall -Wl,-gc-sections -lpthread -lm -lrt
endif

ifeq ($(FACE_CHECK),1)
LDFLAGS+=-L$(FACE_PATH)/lib/uclibc -L$(FACE_PATH)/IVS/lib/uclibc -liaac -lfaceDet -lfr_core -ljzdl -lmxu_core -lmxu_imgproc
LIBS+=$(WORK_PATH)/lib/lib_hw_face.a
endif


compile: $(TARGET)

# -rdynamic 
$(TARGET): $(DEPEND_FILES)
		$(CPP) -o $(TARGET) $(DEPEND_FILES) $(LIBS) $(LIBS_PPP_PERSON) $(LIBS_PPP_THIRD) $(LDFLAGS) $(IVS_PERSON) -lstdc++ 
		$(STRIP) $(TARGET)
		cp -f $(TARGET) $(SYSTEM_BIN_PATH)
		cp -f $(TARGET) /home/jwchen/cjw-share/work-temp/download
#		cp -f $(TARGET) /home/xhzeng/work-device/device/bsp/Zeratul_2.1.0_Zealot_20180529/os/rootfs-uclibc-4g/camera/system/bin
#		cp -f $(TARGET) /home/xhzeng/work-device/device/bsp/Zeratul_2.1.0_Zealot_20180529/os/rootfs-uclibc-t20/camera/system/bin
#		cp -f $(TARGET) /home/xhzeng/work-device/device/bsp/Zeratul_2.1.0_Zealot_20180529/os/rootfs-uclibc-t10/camera/system/bin
#		cp -f $(TARGET)  /home/xhzeng/work-device/device/bsp/Zeratul_2.1.0_Zealot_20180529/os/rootfs-glibc-t20/camera/system/bin
#		cp -f $(TARGET) /var/lib/tftpboot/zxh
		

clean:
	rm -f $(TARGET) $(DEPEND_FILES)

main.o: main.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

test_main.o: test_main.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

