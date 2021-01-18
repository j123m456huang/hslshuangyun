all:	compile 

include ../../../Makefile.env

ARCH	= hsl_web_c.a
UMSW	= -DUSER_MANAGEMENT_SUPPORT
DASW	= -DDIGEST_ACCESS_SUPPORT

DEPEND_FILES	= asp.o balloc.o base64.o cgi.o default.o ejlex.o ejparse.o form.o  h.o handler.o mime.o misc.o page.o  \
				  ringq.o rom.o  sock.o sockGen.o $(SSLPATCHFILE)  security.o sym.o uemf.o url.o value.o \
				  md5c.o um.o umui.o websda.o emfdb.o  webrom.o webs.o websuemf.o web.o
				  
CFLAGS	= -DWEBS -DUEMF -DOS="LINUX" -DLINUX $(UMSW) $(DASW) $(SSLSW) $(IFMODSW) -D__NO_CGI_BIN
DEBUG	= -Wall -O1
IFLAGS 	+= -I.. 
LDFLAGS	= 

compile: $(ARCH)

$(ARCH): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(ARCH) $?
	cp -f $(ARCH) ../
	cp -f web.h ../hsl_web_c.h
	cp -f web.h ../../../include/hsl_web_c.h

clean:
	rm -f $(NAME) $(ARCH) $(DEPEND_FILES)

asp.o:  asp.c webs.h wsIntrn.h ej.h ejIntrn.h uemf.h
balloc.o: balloc.c uemf.h
base64.o:  base64.c webs.h wsIntrn.h  ej.h ejIntrn.h uemf.h
cgi.o:  webs.h wsIntrn.h uemf.h
default.o:  default.c webs.h wsIntrn.h ej.h ejIntrn.h uemf.h
ejlex.o:  ejlex.c ej.h ejIntrn.h uemf.h
ejparse.o:  ejparse.c ej.h ejIntrn.h uemf.h
emfdb.o:  emfdb.h wsIntrn.h uemf.h
form.o:  form.c webs.h wsIntrn.h ej.h ejIntrn.h uemf.h
h.o:  h.c uemf.h
handler.o:  handler.c webs.h wsIntrn.h ej.h ejIntrn.h uemf.h
md5c.o:  md5.h wsIntrn.h uemf.h
mime.o:  mime.c webs.h wsIntrn.h ej.h ejIntrn.h uemf.h
misc.o:  misc.c uemf.h
page.o:  page.c webs.h wsIntrn.h ej.h ejIntrn.h uemf.h
ringq.o:  ringq.c uemf.h
rom.o:  rom.c webs.h wsIntrn.h ej.h ejIntrn.h uemf.h
security.o:  security.c webs.h wsIntrn.h ej.h ejIntrn.h uemf.h
sock.o:  sock.c uemf.h
sockGen.o:  sockGen.c uemf.h
sym.o:  sym.c uemf.h
uemf.o:  uemf.c uemf.h
um.o:  webs.h wsIntrn.h um.h uemf.h
umui.o:  webs.h wsIntrn.h um.h uemf.h
url.o:  url.c webs.h wsIntrn.h ej.h ejIntrn.h uemf.h
value.o:  value.c uemf.h
webrom.o:  webrom.c webs.h wsIntrn.h uemf.h
webs.o:  webs.c webs.h wsIntrn.h ej.h ejIntrn.h uemf.h
websda.o:  webs.h wsIntrn.h websda.h uemf.h
websuemf.o:  websuemf.c webs.h wsIntrn.h ej.h ejIntrn.h uemf.h
websSSL.o:  websSSL.c websSSL.h wsIntrn.h ej.h ejIntrn.h uemf.h
web.o:  web.c wsIntrn.h webs.h ej.h ejIntrn.h uemf.h

.c.o:
	$(CC) -c -o $@ $(DEBUG) $(CFLAGS) $(IFLAGS) $<
