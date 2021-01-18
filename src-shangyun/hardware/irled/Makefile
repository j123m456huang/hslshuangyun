
all:	compile 

include ../../Makefile.env

TARGET			= lib_hw_irled.a

DEPEND_FILES	= hsl_hw_pwm.o hsl_hw_irled.o  hsl_hw_irled_bat_by_ir.o  hsl_hw_irled_bat_by_ir_wt.o  hsl_hw_irled_by_ir.o  hsl_hw_irled_by_ir_wt.o  hsl_hw_irled_yn.o
INC_FILE	= hsl_hw_irled.h

CFLAGS 	+= -I./ -I$(INCDIR)

compile: $(TARGET)

$(TARGET): $(DEPEND_FILES)
	$(AR) $(ARFLAGS) $(TARGET) $?
	cp -f $(TARGET) $(LIBDIR)
	cp -f $(INC_FILE)  $(INCDIR)

clean:
	rm -f $(TARGET) $(DEPEND_FILES)
	rm -f $(INCDIR)/$(INC_FILE)

hsl_hw_irled.o:  hsl_hw_irled.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_hw_irled_by_ir.o:  hsl_hw_irled_by_ir.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_hw_irled_by_ir_wt.o:  hsl_hw_irled_by_ir_wt.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_hw_irled_bat_by_ir.o:  hsl_hw_irled_bat_by_ir.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_hw_irled_bat_by_ir_wt.o:  hsl_hw_irled_bat_by_ir_wt.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<

hsl_hw_irled_yn.o:  hsl_hw_irled_yn.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<


hsl_hw_pwm.o: hsl_hw_pwm.cpp
	$(CPP) -c -o $@ $(CFLAGS) $<
