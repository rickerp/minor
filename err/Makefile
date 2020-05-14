EXT=.min
EXE=../minor
LIB=../libminor.a
AS=nasm -felf32
LD=ld -m elf_i386
DIR=.

.SUFFIXES: .asm $(EXT)

ALL= 01ok.o 02ok.o 03ok.o 04ok.o 05ok 06ok 07ok 08ok 09ok 10ok 11ok 12ok \
	13ok 14ok 15ok 16ok 17ok 18ok 19ok 20ok 21ok 22ok 23ok 24ok 25ok \
	26ok 27ok 28ok 29ok 30ok 31ok 32ok 33ok 34ok 35ok 36ok 37ok 38ok \
	39ok 40ok 41ok 42ok 43ok 44ok

all::
	for i in $(ALL); do $(MAKE) $(MFLAGS) $$i; done

arm::
	$(MAKE) $(MFLAGS) AS=as LD=ld

$(EXT).asm:
	$(EXE) $< $@
.asm.o:
	$(AS) $< -o $@
%: %.o
	$(LD) -o $@ $< $(LIB)

15ok: 15ok.o mod15.o
	$(LD) -o $@ $^ $(LIB)

clean::
	rm -f *.asm *.o out $(ALL)
