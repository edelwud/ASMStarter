# ASM Starter Template
ASM Starter templete
## Structure
- data
  - INPUT.TXT (Input file for your asm program)
  - OUTPUT.TXT (Output file for your asm program)
  - STARTUP.TXT
- debug
  - COMPILE.TXT (Complile log)
  - LINK.TXT (Link log)
- main.asm (your program)
- Makefile
- sio.asm (standart input and output functions)
## Usage
**1.** Use current files(TASM.EXE, TD.EXE, TLINK.EXE) or download TASM and load to **~/bin**


**2.** Configure Makefile with custom PATHs
```
DOSBOX_EXECUTOR=dosbox

MAKEFILE_PATH=$(abspath $(lastword $(MAKEFILE_LIST)))
CURRENT_FOLDER=$(patsubst %/,%,$(dir $(MAKEFILE_PATH)))
WORK_FOLDER=$(CURRENT_FOLDER)/bin
```
**DOSBOX_EXECUTOR** - dosbox or dosbox-x

**MAKEFILE_PATH** - Path to Makefile (automatically on linux)

**CURRENT_FOLDER** - Path to your current folder (automatically on linux)

**WORK_FOLDER** - PATH TO ASM execute binaries (automatically on linux)


**3.** Install DOSBox or DOSBox-X
```bash
sudo apt-get install dosbox
```


**4.** Initialize
```
make init
```


**5.** Execute:
```bash
make all
```


**6.** For visual studio code (tasks.json) execute with **CTRL+SHIFT+B**
