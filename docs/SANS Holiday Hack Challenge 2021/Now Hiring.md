<table border=1px>
<tr>
    <td colspan=3>
    <b>Challenge : </b> <br>
    What is the secret access key for the Jack Frost Tower job applications server? <br>
    Brave the perils of Jack's bathroom to get hints from Noxious O. D'or.
    </td>
</tr>
<tr>
    <td>
    <b>Difficulty Level : </b> <br>
    <img src="../../images/hhc2021/difficulty_3.png" alt="drawing" width="100px"/><br>
    </td>
    <td>
     <b>Location : </b> <br>
    Great Room
    </td>
    <td>
    <b>Elf/Troll : </b> <br>
   <img src="../../images/hhc2021/image010.png" alt="drawing" width="30px"/> Angel Candysalt <br>
    </td>
</tr>
</table>

<table>
<tr>
    <td>
    <img src="../../images/hhc2021/image114.png" alt="drawing" width="200px"/>
    </td>
    <td>
        <b>Hints from Noxious O. D’or </b> <br>
        <ol>
        <li>Did you know it's possible to harvest cloud keys through SSRF and IMDS attacks?</li>
        <li>Dr. Petabyte told us, "anytime you see URL as an input, test for SSRF."</li>
        <li>With an SSRF attack, we can make the server request a URL. This can reveal valuable data!</li>
        <li> The <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instancedata-data-retrieval.html" target="_blank">AWS documentation for IMDS</a> is interesting reading.</li>

        <b>Website:</b><br>
        <a href="https://apply.jackfrosttower.com/" target=_blank>https://apply.jackfrosttower.com/</a>
    </td>
<tr>
</table>

Thw website https://apply.jackfrosttower.com/ shows below : <br>
<img src="../../images/hhc2021/image119_1.png" alt="drawing" width="800px"/>

Career application has the URL textbox input (screenshot shortened below). <br>
We will use send the instance metadata URL to get the metadata and hopefully the secret access key of the application server.<br>
<img src="../../images/hhc2021/image120.png" alt="drawing" width="800px"/>

We will make use of burp suite and make sure we can see all requests (including images/stylesheets etc). <br>
A couple of tests indicate the output of the instance metadata URL is shown in the response of an image of the name same as the input "Name" submitted in the form.<br><br>
For example, when we submit <b>spiderman</b> as Name and <b>http://169.254.169.254/latest/meta-data/public-hostname</b> in the URL, we see the name of the EC2 instance in the response of the GET request of image /images/spiderman.jpg.<br>

>ec2-192-0-2-54.compute-1.amazonaws.com

<img src="../../images/hhc2021/image121.png" alt="drawing" width="1000px"/>

Using the Metadata URL <b>http://169.254.169.254/latest/meta-data/iam/security-credentials/</b> in the field "URL to your public NLBI report",
we can get the IAM role attached to the EC2 instance. <br>

> jf-deploy-role

<br>
<img src="../../images/hhc2021/image122.png" alt="drawing" width="1000px"/>

Using the Metadata URL <b>http://169.254.169.254/latest/meta-data/iam/security-credentials/jf-deploy-role</b> in the field "URL to your public NLBI report", we get the secret token. <br>

> CGgQcSdERePvGgr058r3PObPq3+0CfraKcsLREpX

<br>
<img src="../../images/hhc2021/image123.png" alt="drawing" width="1000px"/>

We submit the above as the answer to the objective It is now complete. <br>
<img src="../../images/hhc2021/image124.png" alt="drawing" width="400px"/>
