all:	compile 

include ../../../Makefile.env

ARCH	= libipconfig.a

DEPEND_FILES	= clientpacket.o  dhcpc.o  options.o  packet.o  script.o  socket.o 

VER := 0.9.8
				  
CFLAGS	= -muclibc -Wstrict-prototypes -DCOMBINED_BINARY -DVERSION='"$(VER)"'
DEBUG	= -Wall -O2
IFLAGS 	+= -I./
LDFLAGS	= 

compile: $(ARCH)

$(ARCH): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(ARCH) $?

clean:
	rm -f $(NAME) $(ARCH) $(DEPEND_FILES)


clientpacket.o: clientpacket.c
dhcpc.o: dhcpc.c
options.o: options.c
packet.o: packet.c
script.o: script.c
socket.o: socket.c

.c.o:
	$(CC) -c -o $@ $(DEBUG) $(CFLAGS) $(IFLAGS) $<
