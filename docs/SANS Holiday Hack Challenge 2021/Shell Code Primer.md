<table border=1px>
<tr>
    <td colspan=3>
    <b>Challenge : </b> <br>
    Complete the Shellcode Primer in Jack's office.<br>
    According to the last challenge, what is the secret to KringleCon success? "All of our speakers and organizers, providing the gift of ____, free to the community." <br> 
    Talk to Chimney Scissorsticks in the NetWars area for hints.
    </td>
</tr>
<tr>
    <td>
    <b>Difficulty Level : </b> <br>
    <img src="../../images/hhc2021/difficulty_3.png" alt="drawing" width="100px"/><br>
    </td>
    <td>
     <b>Location : </b> <br>
        Jack’s Office                                                                                     
    </td>
    <td>
    <b>Elf/Troll : </b> <br>
   <img src="../../images/hhc2021/image027.png" alt="drawing" width="30px"/> Ruby Cyster <br>
    </td>
</tr>
</table>

<table>
<tr>
    <td>
    <img src="../../images/hhc2021/image056.png" alt="drawing" width="300px"/>
    </td>
    <td>
    <b> Hints from Ruby Cyster : </b> <br>
    I'm looking at this system, and it has me a little bit worried.<br>
    If I didn't know better, I'd say someone here is learning how to hack North Pole systems.<br>
    Who's got that kind of nerve!<br>
    Anyway, I hear some elf on the other roof knows a bit about this type of thing.<br>

    <b> Note:</b> <br>
    The website is <a href="https://tracer.kringlecastle.com/" target="_blank">https://tracer.kringlecastle.com/</a> <br>
    This objective has 11 steps. 1-10 are easy to follow tutorials which will be used for step 11. 
    Step 11 has no hints and solving that would answer this objective. <br>
    Therefore, in the interest of documentation for other objectives in the report we are doing to provide details on step 11 only.
    </td>
<tr>
</table>

<b>Shell Code for step 11. Reading a file (/var/northpolesecrets.txt)</b>
```shell
;sys_open
call doit
db '/var/northpolesecrets.txt',0
 
doit:
mov rax, 2
pop rdi
mov rsi, 0
mov rdx, 0
syscall
  
; TODO: Call sys_read on the file handle and read it into rsp
;sys_read
;push rdi ; Temporarily store the filename pointer
;push rax ; Temporarily store the handle
;pop rdi ; Move the file handle into rdi
;pop rsi ; 
mov rdi, rax ; sys_open returns the fd into rax, so move it to rdi before set rax to sys_read.
mov rax, 0 ; Syscall 0 = sys_read
mov rdx, 1000 ; rdx is the count
mov rsi,rsp; from the hint
syscall
 
; TODO: Call sys_write to write the contents from rsp to stdout (1)
mov rax, 1 ; Syscall 1 = sys_write
mov rdi, 1 ; File handle to write to = stdout = 1  ; (rsi is already the buffer)
mov rdx, 1000; rdx is the count again 
mov rsi, rsp; from the hint
syscall ; Perform the sys_write syscall, writing the data to stdout
 
; sys_exit
mov rax, 3Ch ; for sys_exit
mov rdi, 0 ; exit code
syscall
```
<b>The deugger</b> </br>
<img src="../../images/hhc2021/image067.png" alt="drawing" width="1000px"/>

The full content of the file (/var/northpolesecrets.txt) is below. <br>
<b>Secret to KringleCon success: all of our speakers and organizers, providing the gift of cyber security knowledge, free to the community</b> <br>

The missing part in the question is <b>"cyber security knowledge"</b>. <br>
We submit it as the answer to this objective and Its now Its completed.

<img src="../../images/hhc2021/image068.png" alt="drawing" width="400px"/>
