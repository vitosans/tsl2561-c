# TSL2561 C Library 

The tsl2561-c is a C library for communicating with the tsl2561 sensor. I did not write this; I found it in a forum post while I was looking for something that was a bit more powerful than the python reference code I was using. The poster on the forum and the name of the author in the files don't match so I am not sure the genesis of the code, however, it does state that its Apache 2.0 License so I added the License information and provided a Makefile. 

If you are the author, please let me know so I can give you appropriate attribution.



## Example output

Provided a test app that will print out: 

* Return Code
* Broadband
* IR sample
* Lux sample

```shell
$ ./tsl2561
Test. RC: 0(Success), broadband: 11066, ir: 2652, lux: 15433
```
``
