<table border=1px>
<tr>
    <td colspan=3>
    <b>Challenge : </b> <br>
    Assist the elves in reverse engineering the strange USB device. Visit Santa's Talks Floor and hit up Jewel Loggins for advice.
    </td>
</tr>
<tr>
    <td>
    <b>Difficulty Level : </b> <br>
    <img src="../../images/hhc2021/difficulty_2.png" alt="drawing" width="100px"/><br>
    </td>
    <td>
     <b>Location : </b> <br>
    Santa’s talk floor 
    </td>
    <td>
    <b>Elf/Troll : </b> <br>
   <img src="../../images/hhc2021/image010.png" alt="drawing" width="30px"/> Morcel Nougat <br>
    </td>
</tr>
</table>

<table>
<tr>
    <td>
    <img src="../../images/hhc2021/image056.png" alt="drawing" width="300px"/>
    </td>
    <td>
    <b> Hints from Morcel Nougat : </b> <br>
        Do you know anything about USB Rubber Duckies?
        I've been playing around with them a bit myself.<br>
        Please see what you can do to help solve the Rubber Ducky Objective!<br>

        <b>Reference</b><br>
        Talk by Kevin Tyers  <br>
        <a href="https://www.youtube.com/watch?v=tkAYncGF-zw" target="_blank">HIDden Duckey, Deconstructed Payload</a>
    </td>
<tr>
</table>

We open the terminal and presented with a question <br>
Question: What is the troll username involved with this attack. <br>
<img src="../../images/hhc2021/image057.png" alt="drawing" width="600px"/>

We see there is an inject.bin under /mnt/USBDEVICE <br>
<img src="../../images/hhc2021/image058.png" alt="drawing" width="600px"/>

We do the file listing and we see a python file named “mallard.py”. <br>
If we look at the contents of the file, we see the python script takes an "inject.bin" file as an input
<img src="../../images/hhc2021/image059.png" alt="drawing" width="600px"/>
<img src="../../images/hhc2021/image060.png" alt="drawing" width="800px"/>

We run the mallard.py with the inject.bin as input.
```python
python ./mallard.py --file /mnt/USBDEVICE/inject.bin
```
The rubber ducky binary inject.bin is decoded.
We see a few interesting things being done in the original file. Numbered in the screenshot below :

<ol>
<li>There is a hardcoded base 64 string which looks like reversed ("==" in the front)</li>
<li>The "rev" used to reverse the already reversed base64 string making it a proper base64 string.</li>
<li>"base64" command with -d switch to decode the base64 string </li>
</ol>

<img src="../../images/hhc2021/image061.png" alt="drawing" width="1000px"/>

So we take the above line from the source code  and execute in the terminal <br>
The base64 is reversed and decoded to reveal the user’s name.

<img src="../../images/hhc2021/image062.png" alt="drawing" width="1000px"/>

In the above an authorized_key file is getting created with the public cert for the user <b>ickymcgoop</b>.
 The answer is <b>ickymcgoop</b> <br>

We submit that username as the answer. 
<img src="../../images/hhc2021/image063.png" alt="drawing" width="1000px"/>

The answer gets accepted and we complete this objective.
<img src="../../images/hhc2021/image064.png" alt="drawing" width="1000px"/>
<img src="../../images/hhc2021/image065.png" alt="drawing" width="400px"/>
