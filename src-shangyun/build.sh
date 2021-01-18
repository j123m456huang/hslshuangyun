#!/bin/bash
set -e
show_help()
{
printf "
SYNOPSIS
    build product

OPTIONS
    -h             Display help message

Examples:
    $0 clean
    $0 productid 

Notes:
    clear ==>clear obj
    productid ==> t10-bc101 t20-bc102 t10-db306 t20-db308 t20-db309 t20-db309-sc2135
    MEDIA_PLATFORM==>1----danale 2----tuya 3----shangyun
"
}

declare -a LIBDIRS_ARR_SHANGYUN=( 				\
           networkservice/Oss 						\
           networkservice/push						\
           hardware/audiocodec/aac				\
           hardware/audiocodec/adpcm				\
           hardware/audiocodec/g711				\
           hardware/simpleconfig/simpleconfig		\
           hardware/gpio							\
           hardware/audio							\
           hardware/iic							\
           hardware/irled							\
           hardware/rtc							\
           hardware/sensor						\
           hardware/video							\
           hardware/track							\
           hardware/watchdog						\
           hardware/eeprom						\
           hardware/iic433							\
           hardware/power						\
           hardware/cw2015						\
           hardware/led							\
           hardware/serial							\
           hardware/mcu-serial						\
           hardware/moto							\
           hardware/soft-moto						\
           hardware/mediaservice					\
           hardware/wifi-8188						\
           hardware/wifi-7601						\
           hardware/wifi-7682						\
           hardware/serial-4g						\
           hardware/mcu-led						\
           hardware/eth							\
           hardware/routefilter						\
           hardware/network						\
           hardware/sdcard						\
           hardware/system						\
           hardware/alarm							\
           hardware/upgrade						\
           hardware/videocodec/bmp				\
           hardware/videocodec/people				\
           hardware/videocodec/face				\
           hardware/videocodec/lcd					\
           hardware/videocodec/h264enc			\
           hardware/videocodec/jpeg				\
           networkservice/date						\
           networkservice/ftp						\
           networkservice/mail						\
           networkservice/ntp						\
           networkservice/web/web-c				\
           networkservice/web						\
           networkservice/search					\
           networkservice/netservice 				\
           record									\
           hardware/hsl_hw						\
           factory								\
           smartvideo								\
           daemon								\
           smartaudio								\
           mainservice/mainservice					\
)


declare -a PRODUCT_ARR=( 					\
	    t21-7601-h62							\
	    t31-bat-7682-sc3235					\
	    t31-bat-7682-gc2063-a89				\
	    t31-bat-7682-imx307					\
	    t31-bat-7682-imx327					\
	    t31-7601-h62							\
	    t31-7601-gc2063						\
	    t31-7601-imx307						\
	    t31-8188-h62							\
	    t31-8188-h63-ht3001					\
	    t31-8188-gc2063-ht3003					\
	    t31-8188-gc2063-ht3006					\
	    t31-8188-f37-ht3006					\
	    t31-8188-gc2063						\
	    t31-8188-imx307						\
	    t31-8189-sc3235						\
	    t31-7601-sc3235						\
	    t31-bat-4g-gc2063-a89					\
	    t31-bat-4g-imx307						\
	    t31-bat-4g-imx327						\
	    t21-8188-h63							\
	    t21-7601-h63							\
	    t21-7601-h63-wifikey					\
	    t21-8188-h62							\
	    t21-8188-h63-a79						\
		t21-7601-h62-a79						\
		t21-7601-h63-a79						\
	    t21-8188-h63-w195						\
	    t21-7601-h62-w195						\
	    t21-8188-h63-w147						\
	    t21-8188-h63-ht2001a					\
		t21-7601-h63-ht2001a					\
		t21-h63-ht2012						\
		t21-8188-h63-ht2010					\
	    t21-8188-h62-w115					\
	    t21-6155-h63-ht2001b					\
	    t21-8188-h63-ht2009					\
	    t21-8188-h62-ht2009b					\
		t21-8188-h62-w144					\
		t21-8188-h63-w144					\
	    t21-8188-h62-w196						\
	    t21-7601-h62-ht2002					\
	    t21-7601-h62-ht2004					\
	    t21-8188-h62-ht2007					\
	    t21-8188-f37-ht3001					\
)

function MAKE_LIB()
{
	DIRNAME=$1
	echo "=====make lib<$DIRNAME> starting====="
	curpath=`pwd`
	pushd $curpath > /dev/null 2>&1
	cd $DIRNAME
	make clean
	make
	echo "=====make $DIRNAME complete====="
	popd > /dev/null 2>&1
}

function CLEAN_LIB()
{
	DIRNAME=$1
	curpath=`pwd`
	pushd $curpath > /dev/null 2>&1
	echo "=====clean $DIRNAME ====="
	cd $DIRNAME
	make clean
	popd > /dev/null 2>&1
	echo "=====clean $DIRNAME done====="
}

function MAKE_FLASH()
{
	curpath=`pwd`
	pushd $curpath > /dev/null 2>&1
	echo "=====Build system bin======"
	echo $1
	echo $2
	echo "=====Build system bin end======"
	

	if [ "$1" = "t21-7601-h63" ]; then
		#cp sensor .bin
		rm -f /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os/rootfs-uclibc-hsl/etc/sensor/*.bin
		cp /home/xhzeng/work-device/device/release/t21/jxh63-t21.bin /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os/rootfs-uclibc-h63/etc/sensor/

		#cp sensor ko
		rm -f /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os/resource-7601-hsl/ko/sensor_*.ko
		cp /home/xhzeng/work-device/device/release/t21/sensor_jxh63_t21.ko /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os/resource-7601-hsl/ko
		
	       cd /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os
		rm -f rootfs-uclibc-h63.bin
		md5sum rootfs-uclibc-h63/camera/system/bin/encoder > rootfs-uclibc-h63/camera/system/bin/system.md5
		mksquashfs rootfs-uclibc-h63 rootfs-uclibc-h63.bin -comp xz -b 64K
		cp rootfs-uclibc-h63.bin /home/xhzeng/work-device/device/release/t21

		rm -f resource-7601-hsl.bin
		mksquashfs resource-7601-hsl resource-7601-hsl.bin -comp xz -b 64K
		cp resource-7601-hsl.bin /home/xhzeng/work-device/device/release/t21
		
	   	echo "=====build t21-7601-h63 flash.bin done====="
	    	cd /home/xhzeng/work-device/device/release/t21
	    	./build-flash-shangyun.sh t21-7601-h63
	fi

	if [ "$1" = "t21-7601-h63-wifikey" ]; then
		#cp sensor .bin
		rm -f /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os/rootfs-uclibc-hsl/etc/sensor/*.bin
		cp /home/xhzeng/work-device/device/release/t21/jxh63-t21.bin /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os/rootfs-uclibc-h63/etc/sensor/

		#cp sensor ko
		rm -f /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os/resource-7601-hsl/ko/sensor_*.ko
		cp /home/xhzeng/work-device/device/release/t21/sensor_jxh63_t21.ko /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os/resource-7601-hsl/ko
		
	       cd /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os
		rm -f rootfs-uclibc-h63.bin
		md5sum rootfs-uclibc-h63/camera/system/bin/encoder > rootfs-uclibc-h63/camera/system/bin/system.md5
		mksquashfs rootfs-uclibc-h63 rootfs-uclibc-h63.bin -comp xz -b 64K
		cp rootfs-uclibc-h63.bin /home/xhzeng/work-device/device/release/t21

		rm -f resource-7601-hsl.bin
		mksquashfs resource-7601-hsl resource-7601-hsl.bin -comp xz -b 64K
		cp resource-7601-hsl.bin /home/xhzeng/work-device/device/release/t21
		
	   	echo "=====build t21-7601-h63-wifikey flash.bin done====="
	    	cd /home/xhzeng/work-device/device/release/t21
	    	./build-flash-shangyun.sh t21-7601-h63-wifikey
	fi


	if [ "$1" = "t21-8188-h63" ]; then
		#cp sensor .bin
		rm -f /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os/rootfs-uclibc-hsl/etc/sensor/*.bin
		cp /home/xhzeng/work-device/device/release/t21/jxh63-t21-shangyun-20201031.bin /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os/rootfs-uclibc-h63/etc/sensor/jxh63-t21.bin

		#cp sensor ko
		rm -f /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os/resource-8188-hsl/ko/sensor_*.ko
		cp /home/xhzeng/work-device/device/release/t21/sensor_jxh63_t21.ko /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os/resource-8188-hsl/ko/sensor_jxh63_t21.ko
		
	       cd /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os
		rm -f rootfs-uclibc-h63.bin
		md5sum rootfs-uclibc-h63/camera/system/bin/encoder > rootfs-uclibc-h63/camera/system/bin/system.md5
		mksquashfs rootfs-uclibc-h63 rootfs-uclibc-h63.bin -comp xz -b 64K
		cp rootfs-uclibc-h63.bin /home/xhzeng/work-device/device/release/t21

		rm -f resource-8188-hsl.bin
		mksquashfs resource-8188-hsl resource-8188-hsl.bin -comp xz -b 64K
		cp resource-8188-hsl.bin /home/xhzeng/work-device/device/release/t21
		
	   	echo "=====build t21-8188-h63 flash.bin done====="
	    	cd /home/xhzeng/work-device/device/release/t21
	    	./build-flash-shangyun.sh t21-8188-h63
	fi

	if [ "$1" = "t21-8188-h63-ht2001a" ]; then
		#cp sensor .bin
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-h63/etc/sensor/*.bin
		cp /home/jwchen/cjw-share/work-device/release/t21/jxh63-t21-shangyun-20201031.bin /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-h63/etc/sensor/jxh63-t21.bin

		#cp sensor ko
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-8188-hsl/ko/sensor_*.ko
		cp /home/jwchen/cjw-share/work-device/release/t21/sensor_jxh63_t21.ko /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-8188-hsl/ko/sensor_jxh63_t21.ko
		
	       cd /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs
		rm -f rootfs-uclibc-h63.bin
		md5sum rootfs-uclibc-h63/camera/system/bin/encoder > rootfs-uclibc-h63/camera/system/bin/system.md5
		mksquashfs rootfs-uclibc-h63 rootfs-uclibc-h63.bin -comp xz -b 64K
		cp rootfs-uclibc-h63.bin /home/jwchen/cjw-share/work-device/release/t21

		rm -f resource-8188-hsl.bin
		mksquashfs resource-8188-hsl resource-8188-hsl.bin -comp xz -b 64K
		cp resource-8188-hsl.bin /home/jwchen/cjw-share/work-device/release/t21
		
	   	echo "=====build t21-8188-h63-ht2001a flash.bin done====="
	    	cd /home/jwchen/cjw-share/work-device/release/t21
	    	./build-flash-shangyun.sh t21-8188-h63-ht2001a
	fi
	
	if [ "$1" = "t21-7601-h63-ht2001a" ]; then
		#cp sensor .bin
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-h63/etc/sensor/*.bin
		cp /home/jwchen/cjw-share/work-device/release/t21/jxh63-t21-shangyun-20201031.bin /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-h63/etc/sensor/jxh63-t21.bin

		#cp sensor ko
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-7601-hsl/ko/sensor_*.ko
		cp /home/jwchen/cjw-share/work-device/release/t21/sensor_jxh63_t21.ko /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-7601-hsl/ko/sensor_jxh63_t21.ko
		
	    cd /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs
		rm -f rootfs-uclibc-h63.bin
		md5sum rootfs-uclibc-h63/camera/system/bin/encoder > rootfs-uclibc-h63/camera/system/bin/system.md5
		mksquashfs rootfs-uclibc-h63 rootfs-uclibc-h63.bin -comp xz -b 64K
		cp rootfs-uclibc-h63.bin /home/jwchen/cjw-share/work-device/release/t21

		rm -f resource-7601-hsl.bin
		mksquashfs resource-7601-hsl resource-7601-hsl.bin -comp xz -b 64K
		cp resource-7601-hsl.bin /home/jwchen/cjw-share/work-device/release/t21
		
	   	echo "=====build t21-7601-h63-ht2001a flash.bin done====="
	    	cd /home/jwchen/cjw-share/work-device/release/t21
	    	./build-flash-shangyun.sh t21-7601-h63-ht2001a
	fi
	
	if [ "$1" = "t21-h63-ht2012" ]; then
		#cp sensor .bin
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-h63/etc/sensor/*.bin
		cp /home/jwchen/cjw-share/work-device/release/t21/jxh63-t21-shangyun-20201031.bin /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-h63/etc/sensor/jxh63-t21.bin

		#cp sensor ko
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-8188-hsl/ko/sensor_*.ko
		cp /home/jwchen/cjw-share/work-device/release/t21/sensor_jxh63_t21.ko /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-8188-hsl/ko/sensor_jxh63_t21.ko
		
	       cd /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs
		rm -f rootfs-uclibc-h63.bin
		md5sum rootfs-uclibc-h63/camera/system/bin/encoder > rootfs-uclibc-h63/camera/system/bin/system.md5
		mksquashfs rootfs-uclibc-h63 rootfs-uclibc-h63.bin -comp xz -b 64K
		cp rootfs-uclibc-h63.bin /home/jwchen/cjw-share/work-device/release/t21

		rm -f resource-8188-hsl.bin
		mksquashfs resource-8188-hsl resource-8188-hsl.bin -comp xz -b 64K
		cp resource-8188-hsl.bin /home/jwchen/cjw-share/work-device/release/t21
		
	   	echo "=====build t21-h63-ht2012 flash.bin done====="
	    	cd /home/jwchen/cjw-share/work-device/release/t21
	    	./build-flash-shangyun.sh t21-h63-ht2012
	fi
	
	if [ "$1" = "t21-8188-h63-ht2010" ]; then
		#cp sensor .bin
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-h63/etc/sensor/*.bin
		cp /home/jwchen/cjw-share/work-device/release/t21/jxh63-t21-shangyun-20201031.bin /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-h63/etc/sensor/jxh63-t21.bin

		#cp sensor ko
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-8188-hsl/ko/sensor_*.ko
		cp /home/jwchen/cjw-share/work-device/release/t21/sensor_jxh63_t21.ko /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-8188-hsl/ko/sensor_jxh63_t21.ko
		
	       cd /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs
		rm -f rootfs-uclibc-h63.bin
		md5sum rootfs-uclibc-h63/camera/system/bin/encoder > rootfs-uclibc-h63/camera/system/bin/system.md5
		mksquashfs rootfs-uclibc-h63 rootfs-uclibc-h63.bin -comp xz -b 64K
		cp rootfs-uclibc-h63.bin /home/jwchen/cjw-share/work-device/release/t21

		rm -f resource-8188-hsl.bin
		mksquashfs resource-8188-hsl resource-8188-hsl.bin -comp xz -b 64K
		cp resource-8188-hsl.bin /home/jwchen/cjw-share/work-device/release/t21
		
	   	echo "=====build t21-8188-h63-ht2010 flash.bin done====="
	    	cd /home/jwchen/cjw-share/work-device/release/t21
	    	./build-flash-shangyun.sh t21-8188-h63-ht2010
	fi
	
	if [ "$1" = "t21-8188-h62-w115" ]; then
		#cp sensor .bin
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-h63/etc/sensor/*.bin
		cp /home/jwchen/cjw-share/work-device/release/t21/jxh62-t21-shangyun-20201031.bin /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-h63/etc/sensor/jxh62-t21.bin

	   #cp sensor ko
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-8188-hsl/ko/sensor_*.ko
		cp /home/jwchen/cjw-share/work-device/release/t21/sensor_jxh62_t21_shangyun.ko /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-8188-hsl/ko/sensor_jxh62_t21.ko
		
	       cd /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs
		rm -f rootfs-uclibc-h62.bin
		md5sum rootfs-uclibc-h63/camera/system/bin/encoder > rootfs-uclibc-h63/camera/system/bin/system.md5
		mksquashfs rootfs-uclibc-h63 rootfs-uclibc-h62.bin -comp xz -b 64K
		cp rootfs-uclibc-h62.bin /home/jwchen/cjw-share/work-device/release/t21

		rm -f resource-8188-hsl.bin
		mksquashfs resource-8188-hsl resource-8188-hsl.bin -comp xz -b 64K
		cp resource-8188-hsl.bin /home/jwchen/cjw-share/work-device/release/t21
		
	   	echo "=====build t21-8188-h62-w115 flash.bin done====="
	    	cd /home/jwchen/cjw-share/work-device/release/t21
	    	./build-flash-shangyun.sh t21-8188-h62-w115
	fi
	
	if [ "$1" = "t21-8188-h62-w115-hsl" ]; then
		#cp sensor .bin
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-hsl/etc/sensor/*.bin
		cp /home/jwchen/cjw-share/work-device/release/t21/jxh62-t21-shangyun-20201031.bin /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-hsl/etc/sensor/jxh62-t21.bin

	   #cp sensor ko
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-8188-hsl/ko/sensor_*.ko
		cp /home/jwchen/cjw-share/work-device/release/t21/sensor_jxh62_t21_shangyun.ko /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-8188-hsl/ko/sensor_jxh62_t21.ko
		
	       cd /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs
		rm -f rootfs-uclibc-h62.bin
		md5sum rootfs-uclibc-hsl/camera/system/bin/encoder > rootfs-uclibc-hsl/camera/system/bin/system.md5
		mksquashfs rootfs-uclibc-hsl rootfs-uclibc-h62.bin -comp xz -b 64K
		cp rootfs-uclibc-h62.bin /home/jwchen/cjw-share/work-device/release/t21

		rm -f resource-8188-hsl.bin
		mksquashfs resource-8188-hsl resource-8188-hsl.bin -comp xz -b 64K
		cp resource-8188-hsl.bin /home/jwchen/cjw-share/work-device/release/t21
		
	   	echo "=====build t21-8188-h62-w115 flash.bin done====="
	    	cd /home/jwchen/cjw-share/work-device/release/t21
	    	./build-flash-shangyun.sh t21-8188-h62-w115
	fi

	if [ "$1" = "t21-6155-h63-ht2001b" ]; then
		#cp sensor .bin
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-hsl/etc/sensor/*.bin
		cp /home/jwchen/cjw-share/work-device/release/t21/jxh63-t21-shangyun-20201031.bin /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-h63/etc/sensor/jxh63-t21.bin

		#cp sensor ko
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-8188-hsl/ko/sensor_*.ko
		cp /home/jwchen/cjw-share/work-device/release/t21/sensor_jxh63_t21.ko /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-8188-hsl/ko/sensor_jxh63_t21.ko
		
	       cd /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs
		rm -f rootfs-uclibc-h63.bin
		md5sum rootfs-uclibc-h63/camera/system/bin/encoder > rootfs-uclibc-h63/camera/system/bin/system.md5
		mksquashfs rootfs-uclibc-h63 rootfs-uclibc-h63.bin -comp xz -b 64K
		cp rootfs-uclibc-h63.bin /home/jwchen/cjw-share/work-device/release/t21

		rm -f resource-6155-hsl.bin
		mksquashfs resource-6155-hsl resource-6155-hsl.bin -comp xz -b 64K
		cp resource-6155-hsl.bin /home/jwchen/cjw-share/work-device/release/t21
		
	   	echo "=====build t21-6155-h63-ht2001b flash.bin done====="
	    	cd /home/jwchen/cjw-share/work-device/release/t21
	    	./build-flash-shangyun.sh t21-6155-h63-ht2001b
	fi

	if [ "$1" = "t21-8188-h63-ht2009" ]; then
		#cp sensor .bin
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-hsl/etc/sensor/*.bin
		cp /home/jwchen/cjw-share/work-device/release/t21/jxh63-t21-shangyun-20201031.bin /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-h63/etc/sensor/jxh63-t21.bin

		#cp sensor ko
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/Ingenic-SDK-T21-1.0.25-20180807/os/resource-8188-hsl/ko/sensor_*.ko
		cp /home/jwchen/cjw-share/work-device/release/t21/sensor_jxh63_t21.ko /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-8188-hsl/ko/sensor_jxh63_t21.ko
		
	       cd /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs
		rm -f rootfs-uclibc-h63.bin
		md5sum rootfs-uclibc-h63/camera/system/bin/encoder > rootfs-uclibc-h63/camera/system/bin/system.md5
		mksquashfs rootfs-uclibc-h63 rootfs-uclibc-h63.bin -comp xz -b 64K
		cp rootfs-uclibc-h63.bin /home/jwchen/cjw-share/work-device/release/t21

		rm -f resource-8188-hsl.bin
		mksquashfs resource-8188-hsl resource-8188-hsl.bin -comp xz -b 64K
		cp resource-8188-hsl.bin /home/jwchen/cjw-share/work-device/release/t21
		
	   	echo "=====build t21-8188-h63-ht2009 flash.bin done====="
	    	cd /home/jwchen/cjw-share/work-device/release/t21
	    	./build-flash-shangyun.sh t21-8188-h63-ht2009
	fi


	if [ "$1" = "t21-8188-h62-ht2009b" ]; then
		#cp sensor .bin
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-h63/etc/sensor/*.bin
		cp /home/jwchen/cjw-share/work-device/release/t21/jxh62-t21-shangyun-20201031.bin /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-h63/etc/sensor/jxh62-t21.bin

		#cp sensor ko
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfsresource-8188-hsl/ko/sensor_*.ko
		cp /home/jwchen/cjw-share/work-device/release/t21/sensor_jxh62_t21.ko /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-8188-hsl/ko/sensor_jxh62_t21.ko
		
	       cd /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/
		rm -f rootfs-uclibc-h63.bin
		md5sum rootfs-uclibc-h63/camera/system/bin/encoder > rootfs-uclibc-h63/camera/system/bin/system.md5
		mksquashfs rootfs-uclibc-h63 rootfs-uclibc-h63.bin -comp xz -b 64K
		cp rootfs-uclibc-h63.bin /home/jwchen/cjw-share/work-device/release/t21

		rm -f resource-8188-hsl.bin
		mksquashfs resource-8188-hsl resource-8188-hsl.bin -comp xz -b 64K
		cp resource-8188-hsl.bin /home/jwchen/cjw-share/work-device/release/t21
		
	   	echo "=====build t21-8188-h62-ht2009b flash.bin done====="
	    	cd /home/jwchen/cjw-share/work-device/release/t21
	    	./build-flash-shangyun.sh t21-8188-h62-ht2009b
	fi

	if [ "$1" = "t21-8188-h62-w144" ]; then
		#cp sensor .bin
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-h63/etc/sensor/*.bin
		cp /home/jwchen/cjw-share/work-device/release/t21/jxh62-t21-shangyun-20201031.bin /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-h63/etc/sensor/jxh62-t21.bin

		#cp sensor ko
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfsresource-8188-hsl/ko/sensor_*.ko
		cp /home/jwchen/cjw-share/work-device/release/t21/sensor_jxh62_t21.ko /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-8188-hsl/ko/sensor_jxh62_t21.ko
		
	       cd /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/
		rm -f rootfs-uclibc-h62.bin
		md5sum rootfs-uclibc-h63/camera/system/bin/encoder > rootfs-uclibc-h63/camera/system/bin/system.md5
		mksquashfs rootfs-uclibc-h63 rootfs-uclibc-h62.bin -comp xz -b 64K
		cp rootfs-uclibc-h62.bin /home/jwchen/cjw-share/work-device/release/t21

		rm -f resource-8188-hsl.bin
		mksquashfs resource-8188-hsl resource-8188-hsl.bin -comp xz -b 64K
		cp resource-8188-hsl.bin /home/jwchen/cjw-share/work-device/release/t21
		
	   	echo "=====build t21-8188-h62-w144 flash.bin done====="
	    	cd /home/jwchen/cjw-share/work-device/release/t21
	    	./build-flash-shangyun.sh t21-8188-h62-w144
	fi
	
	if [ "$1" = "t21-8188-h63-w144" ]; then
		#cp sensor .bin
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-h63/etc/sensor/*.bin
		cp /home/jwchen/cjw-share/work-device/release/t21/jxh63-t21-shangyun-20201031.bin /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-h63/etc/sensor/jxh63-t21.bin

		#cp sensor ko
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfsresource-8188-hsl/ko/sensor_*.ko
		cp /home/jwchen/cjw-share/work-device/release/t21/sensor_jxh63_t21.ko /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-8188-hsl/ko/sensor_jxh63_t21.ko
		
	       cd /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/
		rm -f rootfs-uclibc-h63.bin
		md5sum rootfs-uclibc-h63/camera/system/bin/encoder > rootfs-uclibc-h63/camera/system/bin/system.md5
		mksquashfs rootfs-uclibc-h63 rootfs-uclibc-h63.bin -comp xz -b 64K
		cp rootfs-uclibc-h63.bin /home/jwchen/cjw-share/work-device/release/t21

		rm -f resource-8188-hsl.bin
		mksquashfs resource-8188-hsl resource-8188-hsl.bin -comp xz -b 64K
		cp resource-8188-hsl.bin /home/jwchen/cjw-share/work-device/release/t21
		
	   	echo "=====build t21-8188-h63-w144 flash.bin done====="
	    	cd /home/jwchen/cjw-share/work-device/release/t21
	    	./build-flash-shangyun.sh t21-8188-h63-w144
	fi
	
	if [ "$1" = "t21-8188-h63-w195" ]; then
		#cp sensor .bin
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-h63/etc/sensor/*.bin
		cp /home/jwchen/cjw-share/work-device/release/t21/jxh63-t21-a79-w195.bin /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-h63/etc/sensor/jxh63-t21.bin

		#cp sensor ko
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-8188-hsl/ko/sensor_*.ko
		cp /home/jwchen/cjw-share/work-device/release/t21/sensor_jxh63_t21.ko /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-8188-hsl/ko
		
	       cd /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/
		rm -f rootfs-uclibc-h63.bin
		md5sum rootfs-uclibc-h63/camera/system/bin/encoder > rootfs-uclibc-h63/camera/system/bin/system.md5
		mksquashfs rootfs-uclibc-h63 rootfs-uclibc-h63.bin -comp xz -b 64K
		cp rootfs-uclibc-h63.bin /home/jwchen/cjw-share/work-device/release/t21

		rm -f resource-8188-hsl.bin
		mksquashfs resource-8188-hsl resource-8188-hsl.bin -comp xz -b 64K
		cp resource-8188-hsl.bin /home/jwchen/cjw-share/work-device/release/t21
		
	   	echo "=====build t21-8188-h63-w195 flash.bin done====="
	    	cd /home/jwchen/cjw-share/work-device/release/t21
	    	./build-flash-shangyun.sh t21-8188-h63-w195
	fi
	
	
	if [ "$1" = "t21-7601-h62-w195" ]; then
		#cp sensor .bin
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-hsl/etc/sensor/*.bin
		cp /home/jwchen/cjw-share/work-device/release/t21/jxh62-t21-shangyun-20201031.bin /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-hsl/etc/sensor/jxh62-t21.bin

		#cp sensor ko
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-7601-hsl/ko/sensor_*.ko
		cp /home/jwchen/cjw-share/work-device/release/t21/sensor_jxh62_t21_shangyun.ko /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-7601-hsl/ko/sensor_jxh62_t21.ko
		
	       cd /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/
		rm -f rootfs-uclibc-h62.bin
		md5sum rootfs-uclibc-hsl/camera/system/bin/encoder > rootfs-uclibc-hsl/camera/system/bin/system.md5
		mksquashfs rootfs-uclibc-hsl rootfs-uclibc-h62.bin -comp xz -b 64K
		cp rootfs-uclibc-h62.bin /home/jwchen/cjw-share/work-device/release/t21

		rm -f resource-7601-hsl.bin
		mksquashfs resource-7601-hsl resource-7601-hsl.bin -comp xz -b 64K
		cp resource-7601-hsl.bin /home/jwchen/cjw-share/work-device/release/t21
		
	   	echo "=====build t21-7601-h62-w195 flash.bin done====="
	    	cd /home/jwchen/cjw-share/work-device/release/t21
	    	./build-flash-shangyun.sh t21-7601-h62-w195
	fi
	
	if [ "$1" = "t21-8188-h63-w147" ]; then
		#cp sensor .bin
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-hsl/etc/sensor/*.bin
		cp /home/jwchen/cjw-share/work-device/release/t21/jxh63-t21-a79-w195.bin /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-h63/etc/sensor/jxh63-t21.bin

		#cp sensor ko
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-8188-hsl/ko/sensor_*.ko
		cp /home/jwchen/cjw-share/work-device/release/t21/sensor_jxh63_t21.ko /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-8188-hsl/ko
		
	       cd /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs
		rm -f rootfs-uclibc-h63.bin
		md5sum rootfs-uclibc-h63/camera/system/bin/encoder > rootfs-uclibc-h63/camera/system/bin/system.md5
		mksquashfs rootfs-uclibc-h63 rootfs-uclibc-h63.bin -comp xz -b 64K
		cp rootfs-uclibc-h63.bin /home/jwchen/cjw-share/work-device/release/t21

		rm -f resource-8188-hsl.bin
		mksquashfs resource-8188-hsl resource-8188-hsl.bin -comp xz -b 64K
		cp resource-8188-hsl.bin /home/jwchen/cjw-share/work-device/release/t21
		
	   	echo "=====build t21-8188-h63-w147 flash.bin done====="
	    	cd /home/jwchen/cjw-share/work-device/release/t21
	    	./build-flash-shangyun.sh t21-8188-h63-w147
	fi

	if [ "$1" = "t21-8188-h63-a79" ]; then
		#cp sensor .bin
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-h63/etc/sensor/*.bin
		cp /home/jwchen/cjw-share/work-device/release/t21/jxh63-t21-a79-w195.bin /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-h63/etc/sensor/jxh63-t21.bin

		#cp sensor ko
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-8188-hsl/ko/sensor_*.ko
		cp /home/jwchen/cjw-share/work-device/release/t21/sensor_jxh63_t21.ko /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-8188-hsl/ko
		
	       cd /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs
		rm -f rootfs-uclibc-h63.bin
		md5sum rootfs-uclibc-h63/camera/system/bin/encoder > rootfs-uclibc-h63/camera/system/bin/system.md5
		mksquashfs rootfs-uclibc-h63 rootfs-uclibc-h63.bin -comp xz -b 64K
		cp rootfs-uclibc-h63.bin /home/jwchen/cjw-share/work-device/release/t21

		rm -f resource-8188-hsl.bin
		mksquashfs resource-8188-hsl resource-8188-hsl.bin -comp xz -b 64K
		cp resource-8188-hsl.bin /home/jwchen/cjw-share/work-device/release/t21
		
	   	echo "=====build t21-8188-h63-a79 flash.bin done====="
	    	cd /home/jwchen/cjw-share/work-device/release/t21
	    	./build-flash-shangyun.sh t21-8188-h63-a79
	fi

	if [ "$1" = "t21-7601-h63-a79" ]; then
		#cp sensor .bin
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-hsl/etc/sensor/*.bin
		cp /home/jwchen/cjw-share/work-device/release/t21/jxh63-t21-a79-w195.bin /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-hsl/etc/sensor/jxh63-t21.bin

		#cp sensor ko
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-7601-hsl/ko/sensor_*.ko
		cp /home/jwchen/cjw-share/work-device/release/t21/sensor_jxh63_t21.ko /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-7601-hsl/ko/
		
	    cd /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/
		rm -f rootfs-uclibc-h62.bin
		md5sum rootfs-uclibc-hsl/camera/system/bin/encoder > rootfs-uclibc-hsl/camera/system/bin/system.md5
		mksquashfs rootfs-uclibc-hsl rootfs-uclibc-h62.bin -comp xz -b 64K
		cp rootfs-uclibc-h62.bin /home/jwchen/cjw-share/work-device/release/t21

		rm -f resource-7601-hsl.bin
		mksquashfs resource-7601-hsl resource-7601-hsl.bin -comp xz -b 64K
		cp resource-7601-hsl.bin /home/jwchen/cjw-share/work-device/release/t21
		
	   	echo "=====build t21-7601-h63-a79 flash.bin done====="
	    	cd /home/jwchen/cjw-share/work-device/release/t21
	    	./build-flash-shangyun.sh t21-7601-h63-a79
	fi
	
	if [ "$1" = "t21-7601-h62-a79" ]; then
		#cp sensor .bin
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-hsl/etc/sensor/*.bin
		cp /home/jwchen/cjw-share/work-device/release/t21/jxh62-t21-shangyun-20201031.bin /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-hsl/etc/sensor/jxh62-t21.bin

		#cp sensor ko
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-7601-hsl/ko/sensor_*.ko
		cp /home/jwchen/cjw-share/work-device/release/t21/sensor_jxh62_t21_shangyun.ko /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-7601-hsl/ko/sensor_jxh62_t21.ko
		
	    cd /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/
		rm -f rootfs-uclibc-h62.bin
		md5sum rootfs-uclibc-hsl/camera/system/bin/encoder > rootfs-uclibc-hsl/camera/system/bin/system.md5
		mksquashfs rootfs-uclibc-hsl rootfs-uclibc-h62.bin -comp xz -b 64K
		cp rootfs-uclibc-h62.bin /home/jwchen/cjw-share/work-device/release/t21

		rm -f resource-7601-hsl.bin
		mksquashfs resource-7601-hsl resource-7601-hsl.bin -comp xz -b 64K
		cp resource-7601-hsl.bin /home/jwchen/cjw-share/work-device/release/t21
		
	   	echo "=====build t21-7601-h62-a79 flash.bin done====="
	    	cd /home/jwchen/cjw-share/work-device/release/t21
	    	./build-flash-shangyun.sh t21-7601-h62-a79
	fi
	
	if [ "$1" = "t21-8188-h62" ]; then
		#cp sensor .bin
		rm -f /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os/rootfs-uclibc-h63/etc/sensor/*.bin
		cp /home/xhzeng/work-device/device/release/t21/jxh62-t21-shangyun-20201031.bin /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os/rootfs-uclibc-h63/etc/sensor/jxh62-t21.bin

		#cp sensor ko
		rm -f /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os/resource-8188-hsl/ko/sensor_*.ko
		cp /home/xhzeng/work-device/device/release/t21/sensor_jxh62_t21_shangyun.ko /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os/resource-8188-hsl/ko/sensor_jxh62_t21.ko
		
	       cd /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os
		rm -f rootfs-uclibc-h62.bin
		md5sum rootfs-uclibc-h63/camera/system/bin/encoder > rootfs-uclibc-h63/camera/system/bin/system.md5
		mksquashfs rootfs-uclibc-h63 rootfs-uclibc-h63.bin -comp xz -b 64K
		cp rootfs-uclibc-h63.bin /home/xhzeng/work-device/device/release/t21

		rm -f resource-8188-hsl.bin
		mksquashfs resource-8188-hsl resource-8188-hsl.bin -comp xz -b 64K
		cp resource-8188-hsl.bin /home/xhzeng/work-device/device/release/t21
		
	   	echo "=====build t21-8188-h62 flash.bin done====="
	    	cd /home/xhzeng/work-device/device/release/t21
	    	./build-flash-shangyun.sh t21-8188-h62
	fi

	if [ "$1" = "t21-8188-h62-w196" ]; then
		#cp sensor .bin
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-h63/etc/sensor/*.bin
		cp /home/jwchen/cjw-share/work-device/release/t21/jxh62-t21-shangyun-20201031.bin /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-h63/etc/sensor/jxh62-t21.bin

		#cp sensor ko
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-8188-hsl/ko/sensor_*.ko
		cp /home/jwchen/cjw-share/work-device/release/t21/sensor_jxh62_t21_shangyun.ko /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-8188-hsl/ko/sensor_jxh62_t21.ko
		
	       cd /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs
		rm -f rootfs-uclibc-h63.bin
		md5sum rootfs-uclibc-h63/camera/system/bin/encoder > rootfs-uclibc-h63/camera/system/bin/system.md5
		mksquashfs rootfs-uclibc-h63 rootfs-uclibc-h63.bin -comp xz -b 64K
		cp rootfs-uclibc-h63.bin /home/jwchen/cjw-share/work-device/release/t21

		rm -f resource-8188-hsl.bin
		mksquashfs resource-8188-hsl resource-8188-hsl.bin -comp xz -b 64K
		cp resource-8188-hsl.bin /home/jwchen/cjw-share/work-device/release/t21
		
	   	echo "=====build t21-8188-h62-w196 flash.bin done====="
	    	cd /home/jwchen/cjw-share/work-device/release/t21
	    	./build-flash-shangyun.sh t21-8188-h62-w196
	fi

	if [ "$1" = "t21-8188-h62-ht2004" ]; then
		#cp sensor .bin
		rm -f /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os/rootfs-uclibc-h63/etc/sensor/*.bin
		cp /home/xhzeng/work-device/device/release/t21/jxh62-t21-shangyun-20201031.bin /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os/rootfs-uclibc-h63/etc/sensor/jxh62-t21.bin

		#cp sensor ko
		rm -f /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os/resource-8188-hsl/ko/sensor_*.ko
		cp /home/xhzeng/work-device/device/release/t21/sensor_jxh62_t21_shangyun.ko /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os/resource-8188-hsl/ko/sensor_jxh62_t21.ko
		
	       cd /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os
		rm -f rootfs-uclibc-h62.bin
		md5sum rootfs-uclibc-h63/camera/system/bin/encoder > rootfs-uclibc-h63/camera/system/bin/system.md5
		mksquashfs rootfs-uclibc-h63 rootfs-uclibc-h63.bin -comp xz -b 64K
		cp rootfs-uclibc-h63.bin /home/xhzeng/work-device/device/release/t21

		rm -f resource-8188-hsl.bin
		mksquashfs resource-8188-hsl resource-8188-hsl.bin -comp xz -b 64K
		cp resource-8188-hsl.bin /home/xhzeng/work-device/device/release/t21
		
	   	echo "=====build t21-8188-h62-ht2004 flash.bin done====="
	    	cd /home/xhzeng/work-device/device/release/t21
	    	./build-flash-shangyun.sh t21-8188-h62-ht2004
	fi

	if [ "$1" = "t21-8188-h62-ht2007" ]; then
		#cp sensor .bin
		rm -f /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os/rootfs-uclibc-h63/etc/sensor/*.bin
		cp /home/xhzeng/work-device/device/release/t21/jxh62-t21-shangyun-20201031.bin /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os/rootfs-uclibc-h63/etc/sensor/jxh62-t21.bin

		#cp sensor ko
		rm -f /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os/resource-8188-hsl/ko/sensor_*.ko
		cp /home/xhzeng/work-device/device/release/t21/sensor_jxh62_t21_shangyun.ko /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os/resource-8188-hsl/ko/sensor_jxh62_t21.ko
		
	       cd /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os
		rm -f rootfs-uclibc-h62.bin
		md5sum rootfs-uclibc-h63/camera/system/bin/encoder > rootfs-uclibc-h63/camera/system/bin/system.md5
		mksquashfs rootfs-uclibc-h63 rootfs-uclibc-h62.bin -comp xz -b 64K
		cp rootfs-uclibc-h63.bin /home/xhzeng/work-device/device/release/t21

		rm -f resource-8188-hsl.bin
		mksquashfs resource-8188-hsl resource-8188-hsl.bin -comp xz -b 64K
		cp resource-8188-hsl.bin /home/xhzeng/work-device/device/release/t21
		
	   	echo "=====build t21-8188-h62-ht2007 flash.bin done====="
	    	cd /home/xhzeng/work-device/device/release/t21
	    	./build-flash-shangyun.sh t21-8188-h62-ht2007
	fi

	if [ "$1" = "t21-8188-f37-ht3001" ]; then
		#cp sensor .bin
		rm -f /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os/rootfs-uclibc-hsl/etc/sensor/*.bin
		cp /home/xhzeng/work-device/device/release/t21/jxh62-t21-shangyun-20201031.bin /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os/rootfs-uclibc-hsl/etc/sensor/jxh62-t21.bin

		#cp sensor ko
		rm -f /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os/resource-8188-hsl/ko/sensor_*.ko
		cp /home/xhzeng/work-device/device/release/t21/sensor_jxh62_t21_shangyun.ko /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os/resource-8188-hsl/ko/sensor_jxh62_t21.ko
		
	       cd /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os
		rm -f rootfs-uclibc-h62.bin
		md5sum rootfs-uclibc-hsl/camera/system/bin/encoder > rootfs-uclibc-hsl/camera/system/bin/system.md5
		mksquashfs rootfs-uclibc-hsl rootfs-uclibc-h62.bin -comp xz -b 64K
		cp rootfs-uclibc-h62.bin /home/xhzeng/work-device/device/release/t21

		rm -f resource-8188-hsl.bin
		mksquashfs resource-8188-hsl resource-8188-hsl.bin -comp xz -b 64K
		cp resource-8188-hsl.bin /home/xhzeng/work-device/device/release/t21
		
	   	echo "=====build t21-8188-f37-ht3001 flash.bin done====="
	    	cd /home/xhzeng/work-device/device/release/t21
	    	./build-flash-shangyun.sh t21-8188-f37-ht3001
	fi


	if [ "$1" = "t21-7601-h62-ht2004" ]; then
		#cp sensor .bin
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-hsl/etc/sensor/*.bin
		cp /home/jwchen/cjw-share/work-device/release/t21/jxh62-t21-shangyun-20201031.bin /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-hsl/etc/sensor/jxh62-t21.bin

		#cp sensor ko
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-7601-hsl/ko/sensor_*.ko
		cp /home/jwchen/cjw-share/work-device/release/t21/sensor_jxh62_t21_shangyun.ko /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-7601-hsl/ko/sensor_jxh62_t21.ko
		
	       cd /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/
		rm -f rootfs-uclibc-h62.bin
		md5sum rootfs-uclibc-hsl/camera/system/bin/encoder > rootfs-uclibc-hsl/camera/system/bin/system.md5
		mksquashfs rootfs-uclibc-hsl rootfs-uclibc-h62.bin -comp xz -b 64K
		cp rootfs-uclibc-h62.bin /home/jwchen/cjw-share/work-device/release/t21

		rm -f resource-7601-hsl.bin
		mksquashfs resource-7601-hsl resource-7601-hsl.bin -comp xz -b 64K
		cp resource-7601-hsl.bin /home/jwchen/cjw-share/work-device/release/t21
		
	   	echo "=====build t21-7601-ht2004 flash.bin done====="
	    	cd /home/jwchen/cjw-share/work-device/release/t21
	    	./build-flash-shangyun.sh t21-7601-h62-ht2004
	fi

	if [ "$1" = "t21-7601-h62-ht2002" ]; then
		#cp sensor .bin
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-hsl/etc/sensor/*.bin
		cp /home/jwchen/cjw-share/work-device/release/t21/jxh62-t21-shangyun-20201031.bin /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/rootfs-uclibc-hsl/etc/sensor/jxh62-t21.bin

		#cp sensor ko
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-7601-hsl/ko/sensor_*.ko
		cp /home/jwchen/cjw-share/work-device/release/t21/sensor_jxh62_t21_shangyun.ko /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/resource-7601-hsl/ko/sensor_jxh62_t21.ko
		
	    cd /home/jwchen/cjw-share/work-device/device/bsp/t21/rootfs/
		rm -f rootfs-uclibc-h62.bin
		md5sum rootfs-uclibc-hsl/camera/system/bin/encoder > rootfs-uclibc-hsl/camera/system/bin/system.md5
		mksquashfs rootfs-uclibc-hsl rootfs-uclibc-h62.bin -comp xz -b 64K
		cp rootfs-uclibc-h62.bin /home/jwchen/cjw-share/work-device/release/t21

		rm -f resource-7601-hsl.bin
		mksquashfs resource-7601-hsl resource-7601-hsl.bin -comp xz -b 64K
		cp resource-7601-hsl.bin /home/jwchen/cjw-share/work-device/release/t21
		
	   	echo "=====build t21-7601-ht2002 flash.bin done====="
	    	cd /home/jwchen/cjw-share/work-device/release/t21
	    	./build-flash-shangyun.sh t21-7601-h62-ht2002
	fi

	if [ "$1" = "t21-7601-h62" ]; then
		#cp sensor .bin
		rm -f /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os/rootfs-uclibc-hsl/etc/sensor/*.bin
		cp /home/xhzeng/work-device/device/release/t21/jxh62-t21-shangyun-20201031.bin /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os/rootfs-uclibc-hsl/etc/sensor/

		#cp sensor ko
		rm -f /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os/resource-7601-hsl/ko/sensor_*.ko
		cp /home/xhzeng/work-device/device/release/t21/sensor_jxh62_t21.ko /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os/resource-7601-hsl/ko
		
	       cd /home/xhzeng/work-device/device/bsp/T21/Ingenic-SDK-T21-1.0.25-20180807/os
		rm -f rootfs-uclibc-hsl.bin
		md5sum rootfs-uclibc-hsl/camera/system/bin/encoder > rootfs-uclibc-hsl/camera/system/bin/system.md5
		mksquashfs rootfs-uclibc-hsl rootfs-uclibc-hsl.bin -comp xz -b 64K
		cp rootfs-uclibc-hsl.bin /home/xhzeng/work-device/device/release/t21

		rm -f resource-7601-hsl.bin
		mksquashfs resource-7601-hsl resource-7601-hsl.bin -comp xz -b 64K
		cp resource-7601-hsl.bin /home/xhzeng/work-device/device/release/t21
		
	   	echo "=====build t21-7601-h62 flash.bin done====="
	    	cd /home/xhzeng/work-device/device/release/t21
	    	./build-flash-shangyun.sh t21-7601-h62
	fi
	
	if [ "$1" = "t31-bat-7682-sc3235" ]; then
		#cp sensor .bin
	       cd /home/xhzeng/work-device/device/bsp/t31z/Zeratul_Release_20200323/rootfs-t31-shangyun
		find . | cpio -H newc -o > ../rootfs-t31-shangyun.cpio
		cd ..
		lzop -9 -f rootfs-t31-shangyun.cpio -o rootfs-t31-shangyun.cpio.lzo
		rm -rf rootfs-t31-shangyun.cpio
		cp rootfs-t31-shangyun.cpio.lzo /home/xhzeng/work-device/device/release/t31z

		rm -f resource-t31-shangyun.bin
		mksquashfs resource-t31-shangyun resource-t31-shangyun.bin -comp xz -b 64K
		cp resource-t31-shangyun.bin /home/xhzeng/work-device/device/release/t31z
		
	   	echo "=====build t31-bat-7682-sc3235 flash.bin done====="
	    	cd /home/xhzeng/work-device/device/release/t31z
	    	./build-flash-shangyun.sh t31-bat-7682-sc3235
	fi

	if [ "$1" = "t31-bat-4g-gc2063-a89" ]; then
		#cp sensor .bin
	       cd /home/xhzeng/work-device/device/bsp/t31z/Zeratul_Release_20200323/rootfs-t31-4g-shangyun
		find . | cpio -H newc -o > ../rootfs-t31-4g-shangyun.cpio
		cd ..
		lzop -9 -f rootfs-t31-4g-shangyun.cpio -o rootfs-t31-4g-shangyun.cpio.lzo
		rm -rf rootfs-t31-4g-shangyun.cpio
		cp rootfs-t31-4g-shangyun.cpio.lzo /home/xhzeng/work-device/device/release/t31z

		rm -f resource-t31-4g-shangyun.bin
		mksquashfs resource-t31-4g-shangyun resource-t31-4g-shangyun.bin -comp xz -b 64K
		cp resource-t31-4g-shangyun.bin /home/xhzeng/work-device/device/release/t31z
		
	   	echo "=====build t31-bat-4g-gc2063-a89 flash.bin done====="
	    	cd /home/xhzeng/work-device/device/release/t31z
	    	./build-flash-shangyun.sh t31-bat-4g-gc2063-a89
	fi
	
	if [ "$1" = "t31-bat-7682-gc2063-a89" ]; then
		#cp sensor .bin
	       cd /home/xhzeng/work-device/device/bsp/t31z/Zeratul_Release_20200323/rootfs-t31-7682-cam
		find . | cpio -H newc -o > ../rootfs-t31-7682-gc2063.cpio
		cd ..
		lzop -9 -f rootfs-t31-7682-gc2063.cpio -o rootfs-t31-7682-gc2063.cpio.lzo
		rm -rf rootfs-t31-7682-gc2063.cpio
		cp rootfs-t31-7682-gc2063.cpio.lzo /home/xhzeng/work-device/device/release/t31z

		rm -f resource-t31-7682-gc2063.bin
		mksquashfs resource-t31-7682-gc2063 resource-t31-7682-gc2063.bin -comp xz -b 64K
		cp resource-t31-7682-gc2063.bin /home/xhzeng/work-device/device/release/t31z
		
	   	echo "=====build t31-bat-7682-gc2063-a89 flash.bin done====="
	    	cd /home/xhzeng/work-device/device/release/t31z
	    	./build-flash.sh t31-bat-7682-gc2063-a89
			./build-flash.sh t31-bat-7682-gc2063-a89-enspk
	fi
	
    if [ "$1" = "t31-bat-7682-gc2063-a89-enspk" ]; then
		#cp sensor .bin
	       cd /home/xhzeng/work-device/device/bsp/t31z/Zeratul_Release_20200323/rootfs-t31-7682-cam
		find . | cpio -H newc -o > ../rootfs-t31-7682-gc2063.cpio
		cd ..
		lzop -9 -f rootfs-t31-7682-gc2063.cpio -o rootfs-t31-7682-gc2063.cpio.lzo
		rm -rf rootfs-t31-7682-gc2063.cpio
		cp rootfs-t31-7682-gc2063.cpio.lzo /home/xhzeng/work-device/device/release/t31z

		rm -f resource-t31-7682-gc2063.bin
		mksquashfs resource-t31-7682-gc2063 resource-t31-7682-gc2063.bin -comp xz -b 64K
		cp resource-t31-7682-gc2063.bin /home/xhzeng/work-device/device/release/t31z
		
	   	echo "=====build t31-bat-7682-gc2063-a89 flash.bin done====="
	    	cd /home/xhzeng/work-device/device/release/t31z
			./build-flash.sh t31-bat-7682-gc2063-a89-enspk
	fi

	if [ "$1" = "t31-8189-sc3235" ]; then
		#cp sensor .bin

		rm -f /home/xhzeng/work-device/device/bsp/T31/Ingenic-SDK-T31-1.1.0-20200115/opensource/root-t31-shangyun/etc/sensor/*.bin
		cp /home/xhzeng/work-device/device/release/t31/sc3235-t31-shangyun.bin /home/xhzeng/work-device/device/bsp/T31/Ingenic-SDK-T31-1.1.0-20200115/opensource/root-t31-shangyun/etc/sensor/sc3235-t31.bin

		#cp sensor ko
		rm -f /home/xhzeng/work-device/device/bsp/T31/Ingenic-SDK-T31-1.1.0-20200115/opensource/resource-7601-h62-shangyun/ko/sensor_*.ko
		cp /home/xhzeng/work-device/device/release/t31/sensor_sc3235_t31_shangyun.ko /home/xhzeng/work-device/device/bsp/T31/Ingenic-SDK-T31-1.1.0-20200115/opensource/resource-7601-h62/ko/sensor_sc3235_t31.ko
		
	       cd /home/xhzeng/work-device/device/bsp/T31/Ingenic-SDK-T31-1.1.0-20200115/opensource
		rm -f rootfs-t31-8189-sc3235.bin
		md5sum root-t31-shangyun/camera/system/bin/encoder > root-t31-shangyun/camera/system/bin/system.md5
		mksquashfs root-t31-shangyun rootfs-t31-8189-sc3235.bin -comp xz -b 64K
		cp rootfs-t31-8189-sc3235.bin /home/xhzeng/work-device/device/release/t31

		rm -f resource-t31-8189-sc3235.bin
		mksquashfs resource-t31-8189-sc3235 resource-t31-8189-sc3235.bin -comp xz -b 64K
		cp resource-t31-8189-sc3235.bin /home/xhzeng/work-device/device/release/t31
		
	   	echo "=====build t31-8189-sc3235 flash.bin done====="
	    	cd /home/xhzeng/work-device/device/release/t31
	    	./build-flash-shangyun.sh t31-8189-sc3235
	fi

	if [ "$1" = "t31-7601-sc3235" ]; then
		#cp sensor .bin

		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t31/Ingenic-SDK-T31-1.1.0-20200115/opensource/root-t31-shangyun/etc/sensor/*.bin
		cp /home/jwchen/cjw-share/work-device/release/t31/sc3235-t31-shangyun.bin /home/jwchen/cjw-share/work-device/device/bsp/T31/Ingenic-SDK-T31-1.1.0-20200115/opensource/root-t31-shangyun/etc/sensor/sc3235-t31.bin

		#cp sensor ko
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/T31/Ingenic-SDK-T31-1.1.0-20200115/opensource/resource-7601-sc3235/ko/sensor_*.ko
		cp /home/jwchen/cjw-share/work-device/release/t31/sensor_sc3235_t31_shangyun.ko /home/jwchen/cjw-share/work-device/device/bsp/T31/Ingenic-SDK-T31-1.1.0-20200115/opensource/resource-7601-sc3235/ko/sensor_sc3235_t31.ko
		
	       cd /home/jwchen/cjw-share/work-device/device/bsp/t31/Ingenic-SDK-T31-1.1.0-20200115/opensource
		rm -f rootfs-t31-7601-sc3235.bin
		md5sum root-t31-shangyun/camera/system/bin/encoder > root-t31-shangyun/camera/system/bin/system.md5
		mksquashfs root-t31-shangyun rootfs-t31-7601-sc3235.bin -comp xz -b 64K
		cp rootfs-t31-7601-sc3235.bin /home/jwchen/cjw-share/work-device/release/t31

		rm -f resource-7601-sc3235-shangyun.bin
		mksquashfs resource-7601-sc3235 resource-7601-sc3235-shangyun.bin -comp xz -b 64K
		cp resource-7601-sc3235-shangyun.bin /home/jwchen/cjw-share/work-device/release/t31
		
	   	echo "=====build t31-7601-sc3235 flash.bin done====="
	    	cd /home/jwchen/cjw-share/work-device/release/t31
	    	./build-flash-shangyun.sh t31-7601-sc3235
	fi

	if [ "$1" = "t31-7601-h62" ]; then
		#cp sensor .bin

		rm -f /home/xhzeng/work-device/device/bsp/T31/Ingenic-SDK-T31-1.1.0-20200115/opensource/root-t31-shangyun/etc/sensor/*.bin
		cp /home/xhzeng/work-device/device/release/t31/jxh62-t31-shangyun.bin /home/xhzeng/work-device/device/bsp/T31/Ingenic-SDK-T31-1.1.0-20200115/opensource/root-t31-shangyun/etc/sensor/h62-t31.bin

		#cp sensor ko
		rm -f /home/xhzeng/work-device/device/bsp/T31/Ingenic-SDK-T31-1.1.0-20200115/opensource/resource-7601-h62-shangyun/ko/sensor_*.ko
		cp /home/xhzeng/work-device/device/release/t31/sensor_jxh62_t31_shangyun.ko /home/xhzeng/work-device/device/bsp/T31/Ingenic-SDK-T31-1.1.0-20200115/opensource/resource-7601-h62/ko/sensor_h62_t31.ko
		
	       cd /home/xhzeng/work-device/device/bsp/T31/Ingenic-SDK-T31-1.1.0-20200115/opensource
		rm -f rootfs-t31-7601-h62.bin
		md5sum root-t31-shangyun/camera/system/bin/encoder > root-t31-shangyun/camera/system/bin/system.md5
		mksquashfs root-t31-shangyun rootfs-t31-7601-h62.bin -comp xz -b 64K
		cp rootfs-t31-7601-h62.bin /home/xhzeng/work-device/device/release/t31

		rm -f resource-7601-h62.bin
		mksquashfs resource-7601-h62 resource-7601-h62.bin -comp xz -b 64K
		cp resource-7601-h62.bin /home/xhzeng/work-device/device/release/t31
		
	   	echo "=====build t31-7601-h62 flash.bin done====="
	    	cd /home/xhzeng/work-device/device/release/t31
	    	./build-flash-shangyun.sh t31-7601-h62
	fi

	if [ "$1" = "t31-8188-h62" ]; then
		#cp sensor .bin

		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t31/Ingenic-SDK-T31-1.1.0-20200115/opensource/root-t31-shangyun/etc/sensor/*.bin
		cp /home/jwchen/cjw-share/work-device/release/t31/jxh62-t31-shangyun.bin /home/jwchen/cjw-share/work-device/device/bsp/t31/Ingenic-SDK-T31-1.1.0-20200115/opensource/root-t31-shangyun/etc/sensor/h62-t31.bin

		#cp sensor ko
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t31/Ingenic-SDK-T31-1.1.0-20200115/opensource/resource-7601-h62-shangyun/ko/sensor_*.ko
		cp /home/jwchen/cjw-share/work-device/release/t31/sensor_jxh62_t31_shangyun.ko /home/jwchen/cjw-share/work-device/device/bsp/t31/Ingenic-SDK-T31-1.1.0-20200115/opensource/resource-8188-h62/ko/sensor_h62_t31.ko
		
	       cd /home/jwchen/cjw-share/work-device/device/bsp/t31/Ingenic-SDK-T31-1.1.0-20200115/opensource
		rm -f rootfs-t31-8188-h62.bin
		md5sum root-t31-shangyun/camera/system/bin/encoder > root-t31-shangyun/camera/system/bin/system.md5
		mksquashfs root-t31-shangyun rootfs-t31-8188-h62.bin -comp xz -b 64K
		cp rootfs-t31-8188-h62.bin /home/jwchen/cjw-share/work-device/release/t31

		rm -f resource-8188-h62.bin
		mksquashfs resource-8188-h62 resource-8188-h62.bin -comp xz -b 64K
		cp resource-8188-h62.bin /home/jwchen/cjw-share/work-device/release/t31
		
	   	echo "=====build t31-8188-h62 flash.bin done====="
	    	cd /home/jwchen/cjw-share/work-device/release/t31
	    	./build-flash-shangyun.sh t31-8188-h62
	fi

	if [ "$1" = "t31-8188-h63-ht3001" ]; then
		#cp sensor .bin

		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t31/Ingenic-SDK-T31-1.1.0-20200115/opensource/rootfs-uclibc-h63/etc/sensor/*.bin
		cp /home/jwchen/cjw-share/work-device/release/t31/jxh63-t31.bin /home/jwchen/cjw-share/work-device/device/bsp/t31/Ingenic-SDK-T31-1.1.0-20200115/opensource/rootfs-uclibc-h63/etc/sensor/jxh63-t31.bin

		#cp sensor ko
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t31/Ingenic-SDK-T31-1.1.0-20200115/opensource/resource-8188-hsl/ko/sensor_*.ko
		cp /home/jwchen/cjw-share/work-device/release/t31/sensor_jxh63_t31.ko /home/jwchen/cjw-share/work-device/device/bsp/t31/Ingenic-SDK-T31-1.1.0-20200115/opensource/resource-8188-hsl/ko/sensor_jxh63_t31.ko
		
	       cd /home/jwchen/cjw-share/work-device/device/bsp/t31/Ingenic-SDK-T31-1.1.0-20200115/opensource
		rm -f rootfs-uclibc-h63.bin
		md5sum rootfs-uclibc-h63/camera/system/bin/encoder > rootfs-uclibc-h63/camera/system/bin/system.md5
		mksquashfs rootfs-uclibc-h63 rootfs-uclibc-h63.bin -comp xz -b 64K
		cp rootfs-uclibc-h63.bin /home/jwchen/cjw-share/work-device/release/t31

		rm -f resource-8188-hsl.bin
		mksquashfs resource-8188-hsl resource-8188-hsl.bin -comp xz -b 64K
		cp resource-8188-hsl.bin /home/jwchen/cjw-share/work-device/release/t31
		
	   	echo "=====build t31-8188-h63-ht3001 flash.bin done====="
	    	cd /home/jwchen/cjw-share/work-device/release/t31
	    	./build-flash-shangyun.sh t31-8188-h63-ht3001
	fi
	
    if [ "$1" = "t31-8188-gc2063-ht3003" ]; then
		#cp sensor .bin

		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t31/Ingenic-SDK-T31-1.1.0-20200115/opensource/rootfs-uclibc-h63/etc/sensor/*.bin
		cp /home/jwchen/cjw-share/work-device/release/t31/gc2063-t31-shangyun.bin /home/jwchen/cjw-share/work-device/device/bsp/t31/Ingenic-SDK-T31-1.1.0-20200115/opensource/rootfs-uclibc-h63/etc/sensor/gc2053-t31.bin

		#cp sensor ko
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t31/Ingenic-SDK-T31-1.1.0-20200115/opensource/resource-8188-hsl/ko/sensor_*.ko
		cp /home/jwchen/cjw-share/work-device/release/t31/sensor_gc2063_t31.ko /home/jwchen/cjw-share/work-device/device/bsp/t31/Ingenic-SDK-T31-1.1.0-20200115/opensource/resource-8188-hsl/ko/sensor_gc2053_t31.ko
		
	       cd /home/jwchen/cjw-share/work-device/device/bsp/t31/Ingenic-SDK-T31-1.1.0-20200115/opensource
		rm -f rootfs-uclibc-h63.bin
		md5sum rootfs-uclibc-h63/camera/system/bin/encoder > rootfs-uclibc-h63/camera/system/bin/system.md5
		mksquashfs rootfs-uclibc-h63 rootfs-uclibc-h63.bin -comp xz -b 64K
		cp rootfs-uclibc-h63.bin /home/jwchen/cjw-share/work-device/release/t31

		rm -f resource-8188-hsl.bin
		mksquashfs resource-8188-hsl resource-8188-hsl.bin -comp xz -b 64K
		cp resource-8188-hsl.bin /home/jwchen/cjw-share/work-device/release/t31
		
	   	echo "=====build t31-8188-gc2603-ht3003 flash.bin done====="
	    	cd /home/jwchen/cjw-share/work-device/release/t31
	    	./build-flash-shangyun.sh t31-8188-gc2063-ht3003
	fi

    if [ "$1" = "t31-8188-gc2063-ht3006" ]; then
		#cp sensor .bin

		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t31/Ingenic-SDK-T31-1.1.0-20200115/opensource/rootfs-uclibc-h63/etc/sensor/*.bin
		cp /home/jwchen/cjw-share/work-device/release/t31/gc2063-t31-shangyun.bin /home/jwchen/cjw-share/work-device/device/bsp/t31/Ingenic-SDK-T31-1.1.0-20200115/opensource/rootfs-uclibc-h63/etc/sensor/gc2053-t31.bin

		#cp sensor ko
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t31/Ingenic-SDK-T31-1.1.0-20200115/opensource/resource-8188-hsl/ko/sensor_*.ko
		cp /home/jwchen/cjw-share/work-device/release/t31/sensor_gc2063_t31.ko /home/jwchen/cjw-share/work-device/device/bsp/t31/Ingenic-SDK-T31-1.1.0-20200115/opensource/resource-8188-hsl/ko/sensor_gc2053_t31.ko
		
	       cd /home/jwchen/cjw-share/work-device/device/bsp/t31/Ingenic-SDK-T31-1.1.0-20200115/opensource
		rm -f rootfs-uclibc-h63.bin
		md5sum rootfs-uclibc-h63/camera/system/bin/encoder > rootfs-uclibc-h63/camera/system/bin/system.md5
		mksquashfs rootfs-uclibc-h63 rootfs-uclibc-h63.bin -comp xz -b 64K
		cp rootfs-uclibc-h63.bin /home/jwchen/cjw-share/work-device/release/t31

		rm -f resource-8188-hsl.bin
		mksquashfs resource-8188-hsl resource-8188-hsl.bin -comp xz -b 64K
		cp resource-8188-hsl.bin /home/jwchen/cjw-share/work-device/release/t31
		
	   	echo "=====build t31-8188-gc2603-ht3006 flash.bin done====="
	    	cd /home/jwchen/cjw-share/work-device/release/t31
	    	./build-flash-shangyun.sh t31-8188-gc2063-ht3006
	fi

    if [ "$1" = "t31-8188-f37-ht3006" ]; then
		#cp sensor .bin

		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t31/Ingenic-SDK-T31-1.1.0-20200115/opensource/rootfs-uclibc-h63/etc/sensor/*.bin
		cp /home/jwchen/cjw-share/work-device/release/t31/jxf37-t31-shangyun.bin /home/jwchen/cjw-share/work-device/device/bsp/t31/Ingenic-SDK-T31-1.1.0-20200115/opensource/rootfs-uclibc-h63/etc/sensor/jxf37-t31.bin

		#cp sensor ko
		rm -f /home/jwchen/cjw-share/work-device/device/bsp/t31/Ingenic-SDK-T31-1.1.0-20200115/opensource/resource-8188-hsl/ko/sensor_*.ko
		cp /home/jwchen/cjw-share/work-device/release/t31/sensor_jxf37_t31.ko /home/jwchen/cjw-share/work-device/device/bsp/t31/Ingenic-SDK-T31-1.1.0-20200115/opensource/resource-8188-hsl/ko/sensor_jxf37_t31.ko
		
	       cd /home/jwchen/cjw-share/work-device/device/bsp/t31/Ingenic-SDK-T31-1.1.0-20200115/opensource
		rm -f rootfs-uclibc-h63.bin
		md5sum rootfs-uclibc-h63/camera/system/bin/encoder > rootfs-uclibc-h63/camera/system/bin/system.md5
		mksquashfs rootfs-uclibc-h63 rootfs-uclibc-h63.bin -comp xz -b 64K
		cp rootfs-uclibc-h63.bin /home/jwchen/cjw-share/work-device/release/t31

		rm -f resource-8188-hsl.bin
		mksquashfs resource-8188-hsl resource-8188-hsl.bin -comp xz -b 64K
		cp resource-8188-hsl.bin /home/jwchen/cjw-share/work-device/release/t31
		
	   	echo "=====build t31-8188-f37-ht3006 flash.bin done====="
	    	cd /home/jwchen/cjw-share/work-device/release/t31
	    	./build-flash-shangyun.sh t31-8188-f37-ht3006
	fi
	
	if [ "$1" = "t31-7601-gc2063" ]; then
		#cp sensor .bin

		rm -f /home/xhzeng/work-device/device/bsp/T31/Ingenic-SDK-T31-1.1.0-20200115/opensource/root-t31-shangyun/etc/sensor/*.bin
		cp /home/xhzeng/work-device/device/release/t31/gc2063-t31-shangyun.bin /home/xhzeng/work-device/device/bsp/T31/Ingenic-SDK-T31-1.1.0-20200115/opensource/root-t31-shangyun/etc/sensor/h62-t31.bin

		#cp sensor ko
		rm -f /home/xhzeng/work-device/device/bsp/T31/Ingenic-SDK-T31-1.1.0-20200115/opensource/resource-7601-h62-shangyun/ko/sensor_*.ko
		cp /home/xhzeng/work-device/device/release/t31/sensor_gc2063_t31_shangyun.ko /home/xhzeng/work-device/device/bsp/T31/Ingenic-SDK-T31-1.1.0-20200115/opensource/resource-7601-h62/ko/sensor_gc2063_t31.ko
		
	       cd /home/xhzeng/work-device/device/bsp/T31/Ingenic-SDK-T31-1.1.0-20200115/opensource
		rm -f rootfs-t31-7601-gc2063.bin
		md5sum root-t31-shangyun/camera/system/bin/encoder > root-t31-shangyun/camera/system/bin/system.md5
		mksquashfs root-t31-shangyun rootfs-t31-7601-gc2063.bin -comp xz -b 64K
		cp rootfs-t31-7601-gc2063.bin /home/xhzeng/work-device/device/release/t31

		rm -f resource-7601-gc2063.bin
		mksquashfs resource-7601-gc2063 resource-7601-gc2063.bin -comp xz -b 64K
		cp resource-7601-gc2063.bin /home/xhzeng/work-device/device/release/t31
		
	   	echo "=====build t31-7601-gc2063 flash.bin done====="
	    	cd /home/xhzeng/work-device/device/release/t31
	    	./build-flash-shangyun.sh t31-7601-gc2063
	fi

	if [ "$1" = "t31-8188-gc2063" ]; then
		#cp sensor .bin

		rm -f /home/xhzeng/work-device/device/bsp/T31/Ingenic-SDK-T31-1.1.0-20200115/opensource/root-t31-shangyun/etc/sensor/*.bin
		cp /home/xhzeng/work-device/device/release/t31/gc2063-t31-shangyun.bin /home/xhzeng/work-device/device/bsp/T31/Ingenic-SDK-T31-1.1.0-20200115/opensource/root-t31-shangyun/etc/sensor/h62-t31.bin

		#cp sensor ko
		rm -f /home/xhzeng/work-device/device/bsp/T31/Ingenic-SDK-T31-1.1.0-20200115/opensource/resource-7601-h62-shangyun/ko/sensor_*.ko
		cp /home/xhzeng/work-device/device/release/t31/sensor_gc2063_t31_shangyun.ko /home/xhzeng/work-device/device/bsp/T31/Ingenic-SDK-T31-1.1.0-20200115/opensource/resource-7601-h62/ko/sensor_gc2063_t31.ko
		
	       cd /home/xhzeng/work-device/device/bsp/T31/Ingenic-SDK-T31-1.1.0-20200115/opensource
		rm -f rootfs-t31-8188-gc2063.bin
		md5sum root-t31-shangyun/camera/system/bin/encoder > root-t31-shangyun/camera/system/bin/system.md5
		mksquashfs root-t31-shangyun rootfs-t31-8188-gc2063.bin -comp xz -b 64K
		cp rootfs-t31-8188-gc2063.bin /home/xhzeng/work-device/device/release/t31

		rm -f resource-8188-gc2063.bin
		mksquashfs resource-8188-gc2063 resource-8188-gc2063.bin -comp xz -b 64K
		cp resource-8188-gc2063.bin /home/xhzeng/work-device/device/release/t31
		
	   	echo "=====build t31-8188-gc2063 flash.bin done====="
	    	cd /home/xhzeng/work-device/device/release/t31
	    	./build-flash-shangyun.sh t31-8188-gc2063
	fi

	if [ "$1" = "t31-7601-imx307" ]; then
		#cp sensor .bin

		rm -f /home/xhzeng/work-device/device/bsp/T31/Ingenic-SDK-T31-1.1.0-20200115/opensource/root-t31-shangyun/etc/sensor/*.bin
		cp /home/xhzeng/work-device/device/release/t31/imx307-t31-shangyun.bin /home/xhzeng/work-device/device/bsp/T31/Ingenic-SDK-T31-1.1.0-20200115/opensource/root-t31-shangyun/etc/sensor/imx307-t31.bin

		#cp sensor ko
		rm -f /home/xhzeng/work-device/device/bsp/T31/Ingenic-SDK-T31-1.1.0-20200115/opensource/resource-7601-h62-shangyun/ko/sensor_*.ko
		cp /home/xhzeng/work-device/device/release/t31/sensor_imx307_t31_shangyun.ko /home/xhzeng/work-device/device/bsp/T31/Ingenic-SDK-T31-1.1.0-20200115/opensource/resource-7601-imx307/ko/sensor_imx307_t31.ko
		
	       cd /home/xhzeng/work-device/device/bsp/T31/Ingenic-SDK-T31-1.1.0-20200115/opensource
		rm -f rootfs-t31-7601-imx307.bin
		md5sum root-t31-shangyun/camera/system/bin/encoder > root-t31-shangyun/camera/system/bin/system.md5
		mksquashfs root-t31-shangyun rootfs-t31-7601-imx307.bin -comp xz -b 64K
		cp rootfs-t31-7601-imx307.bin /home/xhzeng/work-device/device/release/t31

		rm -f resource-7601-imx307.bin
		mksquashfs resource-7601-imx307 resource-7601-imx307.bin -comp xz -b 64K
		cp resource-7601-imx307.bin /home/xhzeng/work-device/device/release/t31
		
	   	echo "=====build t31-7601-imx307 flash.bin done====="
	    	cd /home/xhzeng/work-device/device/release/t31
	    	./build-flash-shangyun.sh t31-7601-imx307
	fi

	if [ "$1" = "t31-8188-imx307" ]; then
		#cp sensor .bin

		rm -f /home/xhzeng/work-device/device/bsp/T31/Ingenic-SDK-T31-1.1.0-20200115/opensource/root-t31-shangyun/etc/sensor/*.bin
		cp /home/xhzeng/work-device/device/release/t31/imx307-t31-shangyun.bin /home/xhzeng/work-device/device/bsp/T31/Ingenic-SDK-T31-1.1.0-20200115/opensource/root-t31-shangyun/etc/sensor/imx307-t31.bin

		#cp sensor ko
		rm -f /home/xhzeng/work-device/device/bsp/T31/Ingenic-SDK-T31-1.1.0-20200115/opensource/resource-8188-h62-shangyun/ko/sensor_*.ko
		cp /home/xhzeng/work-device/device/release/t31/sensor_imx307_t31_shangyun.ko /home/xhzeng/work-device/device/bsp/T31/Ingenic-SDK-T31-1.1.0-20200115/opensource/resource-8188-imx307/ko/sensor_imx307_t31.ko
		
	       cd /home/xhzeng/work-device/device/bsp/T31/Ingenic-SDK-T31-1.1.0-20200115/opensource
		rm -f rootfs-t31-8188-imx307.bin
		md5sum root-t31-shangyun/camera/system/bin/encoder > root-t31-shangyun/camera/system/bin/system.md5
		mksquashfs root-t31-shangyun rootfs-t31-8188-imx307.bin -comp xz -b 64K
		cp rootfs-t31-8188-imx307.bin /home/xhzeng/work-device/device/release/t31

		rm -f resource-8188-imx307.bin
		mksquashfs resource-8188-imx307 resource-8188-imx307.bin -comp xz -b 64K
		cp resource-8188-imx307.bin /home/xhzeng/work-device/device/release/t31
		
	   	echo "=====build t31-8188-imx307 flash.bin done====="
	    	cd /home/xhzeng/work-device/device/release/t31
	    	./build-flash-shangyun.sh t31-8188-imx307
	fi
	
   	popd > /dev/null 2>&1
    echo "=====Build system.bin done====="

}



function MAKE_ENCODER()
{
	curpath=`pwd`
	pushd $curpath > /dev/null 2>&1
	echo "=====Build ENCODER======"
	cd main
	rm -f encoder
	

	if [ "$2" = "shangyun" ]; then
		if [ "$1" = "t31-bat-7682-sc3235" ]; then
			make PPP=SHANGYUN  MP4_RECORD=1
		elif [ "$1" = "t21-7601-h63" ]; then
			make PPP=SHANGYUN  IVS_TRACK=1
		elif [ "$1" = "t21-7601-h63-wifikey" ]; then
			make PPP=SHANGYUN  IVS_TRACK=1
		elif [ "$1" = "t21-8188-h63" ]; then
			make PPP=SHANGYUN  IVS_TRACK=1
		elif [ "$1" = "t21-8188-h63-w195" ]; then
			make PPP=SHANGYUN  IVS_TRACK=1
		elif [ "$1" = "t21-7601-h62-w195" ]; then
			make PPP=SHANGYUN  IVS_TRACK=1
	    elif [ "$1" = "t21-8188-h63-w147" ]; then
			make PPP=SHANGYUN  IVS_TRACK=1
		elif [ "$1" = "t21-8188-h63-a79" ]; then
			make PPP=SHANGYUN  IVS_TRACK=1
		elif [ "$1" = "t21-7601-h62-a79" ]; then
			make PPP=SHANGYUN  IVS_TRACK=1
		elif [ "$1" = "t21-7601-h63-a79" ]; then
			make PPP=SHANGYUN  IVS_TRACK=1
		elif [ "$1" = "t21-8188-h63-ht2001a" ]; then
			make PPP=SHANGYUN  IVS_TRACK=1
		elif [ "$1" = "t21-7601-h63-ht2001a" ]; then
			make PPP=SHANGYUN  IVS_TRACK=1
		elif [ "$1" = "t21-h63-ht2012" ]; then
			make PPP=SHANGYUN  IVS_TRACK=1
		elif [ "$1" = "t21-8188-h63-ht2010" ]; then
			make PPP=SHANGYUN  IVS_TRACK=1
		elif [ "$1" = "t21-8188-h62-w115" ]; then
			make PPP=SHANGYUN  IVS_TRACK=1
		elif [ "$1" = "t21-6155-h63-ht2001b" ]; then
			make PPP=SHANGYUN  IVS_TRACK=1
		elif [ "$1" = "t21-8188-h63-ht2009" ]; then
			make PPP=SHANGYUN  IVS_TRACK=1
		elif [ "$1" = "t21-8188-h62-ht2009b" ]; then
			make PPP=SHANGYUN  IVS_TRACK=1
		elif [ "$1" = "t21-8188-h62-w144" ]; then
			make PPP=SHANGYUN  IVS_TRACK=1
		elif [ "$1" = "t21-8188-h63-w144" ]; then
			make PPP=SHANGYUN  IVS_TRACK=1
		elif [ "$1" = "t21-8188-h62-w196" ]; then
			make PPP=SHANGYUN  IVS_TRACK=1
		elif [ "$1" = "t21-7601-h62-ht2004" ]; then
			make PPP=SHANGYUN  IVS_TRACK=1
		elif [ "$1" = "t21-7601-h62-ht2002" ]; then
			make PPP=SHANGYUN  IVS_TRACK=1
		elif [ "$1" = "t21-8188-h62-ht2007" ]; then
			make PPP=SHANGYUN  IVS_TRACK=1
		elif [ "$1" = "t21-8188-f37-ht3001" ]; then
			make PPP=SHANGYUN  IVS_TRACK=1
		elif [ "$1" = "t21-8188-h62" ]; then
			make PPP=SHANGYUN  IVS_TRACK=1
		elif [ "$1" = "t21-7601-ht2004" ]; then
			make PPP=SHANGYUN  IVS_TRACK=1
		elif [ "$1" = "t21-7601-h62" ]; then
			make PPP=SHANGYUN  IVS_TRACK=1
		elif [ "$1" = "t31-8189-sc3235" ]; then
			make PPP=SHANGYUN  MP4_RECORD=1
		elif [ "$1" = "t31-7601-sc3235" ]; then
			#make PPP=SHANGYUN IVS_TRACK=1
			make PPP=SHANGYUN IVS_PEOPLE=1
		elif [ "$1" = "t31-bat-7682-gc2063" ];then
			make PPP=SHANGYUN MP4_RECORD=1
		elif [ "$1" = "t31-bat-7682-gc2063-a89" ];then
			make PPP=SHANGYUN MP4_RECORD=1
		elif [ "$1" = "t31-bat-4g-gc2063-a89" ]; then
			make PPP=SHANGYUN  MP4_RECORD=1
		elif [ "$1" = "t31-bat-7682-imx307" ];then
			make PPP=SHANGYUN MP4_RECORD=1
		elif [ "$1" = "t31-bat-7682-imx327" ];then
			make PPP=SHANGYUN MP4_RECORD=1
		elif [ "$1" = "t31-7601-h62" ];then
			make PPP=SHANGYUN MP4_RECORD=1
		elif [ "$1" = "t31-7601-imx307" ];then
			make PPP=SHANGYUN MP4_RECORD=1
		elif [ "$1" = "t31-8188-h62" ];then
			make PPP=SHANGYUN MP4_RECORD=1
		elif [ "$1" = "t31-8188-h63-ht3001" ];then
			make PPP=SHANGYUN MP4_RECORD=1
		elif [ "$1" = "t31-8188-gc2603-ht3003" ];then
			make PPP=SHANGYUN MP4_RECORD=1
		elif [ "$1" = "t31-8188-gc2063" ];then
			make PPP=SHANGYUN MP4_RECORD=1
		elif [ "$1" = "t31-8188-imx307" ];then
			make PPP=SHANGYUN MP4_RECORD=1
		elif [ "$1" = "t31-7601-gc2063" ];then
			make PPP=SHANGYUN MP4_RECORD=1
		else
			make PPP=SHANGYUN
		fi
		echo "=====encoder for shangyun======"
	fi
   	popd > /dev/null 2>&1
    echo "=====Build Encoder done====="
}

# IVS_TRACK=1

function MAKE_WIFIDAEMON()
{
	curpath=`pwd`
    pushd $curpath > /dev/null 2>&1
    echo "=====Build WIFIDAEMON======"
    cd ../wifirun/wifiupdate
    make clean
    make
    popd > /dev/null 2>&1
    echo "=====Build WIFIDAEMON done====="
}

function MAKE_ALL_LIB()
{
	if [ "$2" = "danale" ]; then
	for DIRNAME in ${LIBDIRS_ARR_DANALE[@]}
        do
            MAKE_LIB $DIRNAME
        done
       fi
	if [ "$2" = "shangyun" ]; then
	for DIRNAME in ${LIBDIRS_ARR_SHANGYUN[@]}
        do
            MAKE_LIB $DIRNAME
        done
       fi
}

function MAKE_MEDIA_LIB
{
	if [ "$2" = "shangyun" ]; then
	       MAKE_LIB common
	       MAKE_LIB mainservice/message
	       MAKE_LIB hardware/sysparam
	
		MAKE_LIB networkservice/cgi
		MAKE_LIB networkservice/p2p/shangyun
           	MAKE_LIB networkservice/p2p
           	MAKE_LIB hardware/zbar
		echo "===shangyun==="
	fi
	
	if [ "$2" = "danale" ]; then
	       MAKE_LIB common
	       MAKE_LIB mainservice/message
	       MAKE_LIB hardware/sysparam
	
		MAKE_LIB networkservice/cgi
		MAKE_LIB networkservice/p2p/danale
           	MAKE_LIB networkservice/p2p
           	MAKE_LIB hardware/zbar
		echo "===danale=============="
	fi
}

function CLEAN_ALL_LIB()
{
	for DIRNAME in ${LIBDIRS_ARR_DANALE[@]}
        do
            CLEAN_LIB $DIRNAME
        done

	for DIRNAME in ${LIBDIRS_ARR_SHANGYUN[@]}
        do
            CLEAN_LIB $DIRNAME
        done
}

function CLEAN_ENCODER()
{

    curpath=`pwd`
    pushd $curpath > /dev/null 2>&1
    echo "=====Clean ENCODER======"
    rm ../release/*.*
    popd > /dev/null 2>&1
    echo "=====Clean ENCODER done====="
}


function CLEAN_TEST()
{
        curpath=`pwd`
        pushd $curpath > /dev/null 2>&1
        echo "=====Clean TEST======"
        cd ./test
        make clean
        popd > /dev/null 2>&1
        echo "=====Clean TEST done====="
}

function DIST_CLEAN()
{
	echo "============dist clean=========="
	rm -rf ../release/*.*
	rm -rf ../lib/*.*
	rm -rf ../include/*.*
}

function CHECK_DIR()
{
	mkdir -p ../lib
	mkdir -p ../include
	mkdir -p ../release

}

function CHECK_MEDIA_HEADER
{
	if [ "$2" = "shangyun" ]; then
		cp modules/hsl_p2p_shangyun_mediaplat.h  ../include/hsl_p2p.h
		cp modules/hsl_config.h  ../include
		cp hardware/sysparam/hsl_hw_ping.h ../include

		cp record/avilib.h ../include
		cp networkservice/p2p/shangyun/hsl_p2p_factory.h ../include/hsl_p2p_config_init.h
		cp networkservice/p2p/shangyun/hsl_ppp_init.h ../include
		cp networkservice/p2p/shangyun/hsl_ppp_cmd.h ../include
		cp networkservice/p2p/shangyun/hsl_ppp_media.h ../include
		cp networkservice/p2p/shangyun/hsl_ppp_record.h ../include
		cp networkservice/p2p/shangyun/hsl_ppp_upgrade.h ../include
		cp networkservice/p2p/shangyun/hsl_p2p_run.h ../include
		cp networkservice/p2p/shangyun/hsl_p2p_factory.h ../include
		echo "===shangyun=============="
	fi
	
	if [ "$2" = "danale" ]; then
		cp modules/hsl_p2p_danale_mediaplat.h  ../include/hsl_p2p.h
		cp modules/hsl_config.h  ../include
		cp hardware/sysparam/hsl_hw_ping.h ../include

		cp networkservice/p2p/danale/hsl_p2p_init.h ../include/hsl_p2p_config_init.h
		cp networkservice/p2p/danale/hsl_p2p_cmd.h ../include
		cp networkservice/p2p/danale/hsl_p2p_factory.h ../include
		echo "===danale=============="
	fi
}

function CHECK_HEADER()
{
	if [ "$1" = "t21-7601-h63" ]; then
		cp env/Makefile-t21-shangyun.env Makefile.env
		cp modules/hsl_t21_7601_h63_shangyun.h ../include/hsl_product.h
         fi
	if [ "$1" = "t21-7601-h63-wifikey" ]; then
		cp env/Makefile-t21-shangyun.env Makefile.env
		cp modules/hsl_t21_7601_h63_wifikey_shangyun.h ../include/hsl_product.h
         fi
	if [ "$1" = "t21-8188-h63" ]; then
		cp env/Makefile-t21-shangyun.env Makefile.env
		cp modules/hsl_t21_8188_h63_shangyun.h ../include/hsl_product.h
         fi
	if [ "$1" = "t21-8188-h63-w195" ]; then
		cp env/Makefile-t21-shangyun.env Makefile.env
		cp modules/hsl_t21_8188_h63_shangyun_w195.h ../include/hsl_product.h
         fi
	if [ "$1" = "t21-7601-h62-w195" ]; then
		#cp env/Makefile-t21-shangyun.env Makefile.env
		cp env/Makefile-t21-hsl-shangyun.env Makefile.env
		cp modules/hsl_t21_7601_h62_shangyun_w195.h ../include/hsl_product.h
         fi
	if [ "$1" = "t21-8188-h63-w147" ]; then
		cp env/Makefile-t21-shangyun.env Makefile.env
		cp modules/hsl_t21_8188_h63_shangyun_w147.h ../include/hsl_product.h
       fi
	if [ "$1" = "t21-8188-h63-a79" ]; then
		cp env/Makefile-t21-shangyun.env Makefile.env
		cp modules/hsl_t21_8188_h63_shangyun_a79.h ../include/hsl_product.h
         fi
	if [ "$1" = "t21-7601-h62-a79" ]; then
		#cp env/Makefile-t21-shangyun.env Makefile.env
		cp env/Makefile-t21-hsl-shangyun.env Makefile.env
		cp modules/hsl_t21_7601_h62_shangyun_a79.h ../include/hsl_product.h
         fi
	if [ "$1" = "t21-7601-h63-a79" ]; then
		#cp env/Makefile-t21-shangyun.env Makefile.env
		cp env/Makefile-t21-hsl-shangyun.env Makefile.env
		cp modules/hsl_t21_7601_h63_shangyun_a79.h ../include/hsl_product.h
         fi
	if [ "$1" = "t21-8188-h63-ht2001a" ]; then
		cp env/Makefile-t21-shangyun.env Makefile.env
		cp modules/hsl_t21_8188_h63_shangyun_ht2001a.h ../include/hsl_product.h
         fi
	if [ "$1" = "t21-7601-h63-ht2001a" ]; then
		cp env/Makefile-t21-shangyun.env Makefile.env
		cp modules/hsl_t21_7601_h63_shangyun_ht2001a.h ../include/hsl_product.h
         fi
	if [ "$1" = "t21-h63-ht2012" ]; then
		cp env/Makefile-t21-shangyun.env Makefile.env
		cp modules/hsl_t21_h63_ht2012.h ../include/hsl_product.h
         fi
	if [ "$1" = "t21-8188-h63-ht2010" ]; then
		cp env/Makefile-t21-shangyun.env Makefile.env
		cp modules/hsl_t21_8188_h63_shangyun_ht2010.h ../include/hsl_product.h
         fi	 
	if [ "$1" = "t21-8188-h62-w115" ]; then
		cp env/Makefile-t21-shangyun.env Makefile.env
		#cp env/Makefile-t21-hsl-shangyun.env Makefile.env
		cp modules/hsl_t21_8188_h62_shangyun_w115.h ../include/hsl_product.h
        fi
	if [ "$1" = "t21-6155-h63-ht2001b" ]; then
		cp env/Makefile-t21-shangyun.env Makefile.env
		cp modules/hsl_t21_6155_h63_shangyun_ht2001b.h ../include/hsl_product.h
         fi
	if [ "$1" = "t21-8188-h63-ht2009" ]; then
		cp env/Makefile-t21-shangyun.env Makefile.env
		cp modules/hsl_t21_8188_h63_shangyun_ht2009.h ../include/hsl_product.h
         fi
	if [ "$1" = "t21-8188-h62-ht2009b" ]; then
		cp env/Makefile-t21-shangyun.env Makefile.env
		cp modules/hsl_t21_8188_h62_shangyun_ht2009.h ../include/hsl_product.h
         fi
	if [ "$1" = "t21-8188-h62-w144" ]; then
		cp env/Makefile-t21-shangyun.env Makefile.env
		cp modules/hsl_t21_8188_h62_shangyun_w144.h ../include/hsl_product.h
         fi
    if [ "$1" = "t21-8188-h63-w144" ]; then
		cp env/Makefile-t21-shangyun.env Makefile.env
		cp modules/hsl_t21_8188_h63_shangyun_w144.h ../include/hsl_product.h
         fi
	if [ "$1" = "t21-8188-h62-w196" ]; then
		cp env/Makefile-t21-shangyun.env Makefile.env
		cp modules/hsl_t21_8188_h62_shangyun_w196.h ../include/hsl_product.h
         fi
	if [ "$1" = "t21-7601-h62-ht2004" ]; then
		#cp env/Makefile-t21-shangyun.env Makefile.env
		cp env/Makefile-t21-hsl-shangyun.env Makefile.env
		cp modules/hsl_t21_7601_h62_shangyun_ht2004.h ../include/hsl_product.h
         fi
	if [ "$1" = "t21-7601-h62-ht2002" ]; then
		cp env/Makefile-t21-hsl-shangyun.env Makefile.env
		cp modules/hsl_t21_7601_h62_shangyun_ht2002.h ../include/hsl_product.h
         fi
	if [ "$1" = "t21-8188-h62-ht2007" ]; then
		cp env/Makefile-t21-shangyun.env Makefile.env
		cp modules/hsl_t21_8188_h62_shangyun_ht2007.h ../include/hsl_product.h
         fi
	if [ "$1" = "t21-8188-f37-ht3001" ]; then
		cp env/Makefile-t21-shangyun.env Makefile.env
		cp modules/hsl_t21_8188_f37_shangyun_ht3001.h ../include/hsl_product.h
         fi
         
	if [ "$1" = "t21-8188-h62" ]; then
		cp env/Makefile-t21-shangyun.env Makefile.env
		cp modules/hsl_t21_8188_h62_shangyun.h ../include/hsl_product.h
         fi
	if [ "$1" = "t21-7601-ht2004" ]; then
		cp env/Makefile-t21-shangyun.env Makefile.env
		cp modules/hsl_t21_7601_ht2004_shangyun.h ../include/hsl_product.h
         fi
	if [ "$1" = "t21-7601-h62" ]; then
		cp env/Makefile-t21-shangyun.env Makefile.env
		cp modules/hsl_t21_7601_h62_shangyun.h ../include/hsl_product.h
         fi
	if [ "$1" = "t31-bat-7682-sc3235" ]; then
  		cp env/Makefile-bat-t31-shangyun.env Makefile.env
		cp modules/hsl_t31_bat_7682_sc3235_shangyun.h ../include/hsl_product.h
         fi
	if [ "$1" = "t31-bat-7682-gc2063-a89" ]; then
  		cp env/Makefile-t31z-gc2063.env Makefile.env
		cp modules/hsl_t31_bat_7682_gc2063_a89.h ../include/hsl_product.h
         fi
	if [ "$1" = "t31-bat-4g-gc2063-a89" ]; then
  		cp env/Makefile-t31z-gc2063.env Makefile.env
		cp modules/hsl_t31_bat_4g_gc2063_a89.h ../include/hsl_product.h
         fi
	if [ "$1" = "t31-8189-sc3235" ]; then
  		cp env/Makefile-t31-shangyun.env Makefile.env
		cp modules/hsl_t31_8189_sc3235_shangyun.h ../include/hsl_product.h
         fi
	if [ "$1" = "t31-7601-sc3235" ]; then
  		cp env/Makefile-t31-shangyun.env Makefile.env
		cp modules/hsl_t31_7601_sc3235_shangyun.h ../include/hsl_product.h
		#cp modules/hsl_t21_8188_h62_shangyun_w196.h ../include/hsl_product.h
		
         fi
	if [ "$1" = "t31-7601-h62" ]; then
  		cp env/Makefile-t31-shangyun.env Makefile.env
		cp modules/hsl_t31_7601_h62_shangyun.h ../include/hsl_product.h
         fi
	if [ "$1" = "t31-7601-gc2063" ]; then
  		cp env/Makefile-t31-shangyun.env Makefile.env
		cp modules/hsl_t31_7601_gc2063_shangyun.h ../include/hsl_product.h
         fi
	if [ "$1" = "t31-7601-imx307" ]; then
  		cp env/Makefile-t31-shangyun.env Makefile.env
		cp modules/hsl_t31_7601_imx307_shangyun.h ../include/hsl_product.h
         fi
	if [ "$1" = "t31-8188-h62" ]; then
  		cp env/Makefile-t31-shangyun.env Makefile.env
		cp modules/hsl_t31_8188_h62_shangyun.h ../include/hsl_product.h
         fi
	if [ "$1" = "t31-8188-h63-ht3001" ]; then
  		cp env/Makefile-t31-shangyun.env Makefile.env
		cp modules/hsl_t31_8188_h63_shangyun_ht3001.h ../include/hsl_product.h
         fi
	if [ "$1" = "t31-8188-gc2063-ht3003" ]; then
  		cp env/Makefile-t31-shangyun.env Makefile.env
		cp modules/hsl_t31_8188_gc2063_shangyun_ht3003.h ../include/hsl_product.h
    fi
	if [ "$1" = "t31-8188-gc2063-ht3006" ]; then
  		cp env/Makefile-t31-shangyun.env Makefile.env
		cp modules/hsl_t31_8188_gc2063_shangyun_ht3006.h ../include/hsl_product.h
    fi
	if [ "$1" = "t31-8188-f37-ht3006" ]; then
  		cp env/Makefile-t31-shangyun.env Makefile.env
		cp modules/hsl_t31_8188_f37_shangyun_ht3006.h ../include/hsl_product.h
    fi
	if [ "$1" = "t31-8188-gc2063" ]; then
  		cp env/Makefile-t31-shangyun.env Makefile.env
		cp modules/hsl_t31_8188_gc2063_shangyun.h ../include/hsl_product.h
         fi
	if [ "$1" = "t31-8188-imx307" ]; then
  		cp env/Makefile-t31-shangyun.env Makefile.env
		cp modules/hsl_t31_8188_imx307_shangyun.h ../include/hsl_product.h
         fi
}

function MAKE_PRODUCT()
{
	for PRODUCTID in ${PRODUCT_ARR[@]}
        do
        if [ $1 = $PRODUCTID ];then
        	    echo "============Make $PRODUCTID LIB=============="
        	    DIST_CLEAN
	      	    CHECK_DIR $PRODUCTID $2
	      	    CHECK_MEDIA_HEADER $PRODUCTID $2
	      	    CHECK_HEADER $PRODUCTID $2
	      	    MAKE_MEDIA_LIB $PRODUCTID $2
	      	    MAKE_ALL_LIB $PRODUCTID $2
		    MAKE_ENCODER $PRODUCTID $2
		    MAKE_FLASH $PRODUCTID $3
		    exit 0
            fi
        done
}


echo $0 $1

if [ "$1" = "clean" ]; then
	DIST_CLEAN
	CLEAN_ALL_LIB
	CLEAN_ENCODER
	CLEAN_WIFIDAEMON
	exit 0
fi


MAKE_PRODUCT $1 $2 $3

while getopts hp:m:k: OPTION
do
	case $OPTION in
	h) show_help
	exit 0
	;;
	*) show_help
	exit 1
	;;
esac
done
