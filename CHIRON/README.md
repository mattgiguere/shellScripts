#shellScripts/CHIRON
**shell scripts related to CHIRON**
In this directory are shell scripts related to the [CHIRON Spectrometer](http://www.ctio.noao.edu/noao/content/chiron). There are several machines used for day to day operations of the instrument.

###Machine Descriptions

- **ctioe1**: The data taking machine. Scripts contained in this directory are involved with the collection of new data.

- **ctimac* **: There are four ctimac machines, which all provide a user interface to CHIRON. Scripts on these machines are used for the interactive observing scripts, and the collection and transmission of data to and from CTIO.

- **exoplanets**: The file server. Scripts replicate the MySQL DB to and from CTIO and sync data and routines.

- **aramis**: Contains scripts to run the quality control and reduction pipelines.

###Script Descriptions

The CHIRON scripts are separated into subdirectories based on the machines they run on.

- ####aramis
- ####ctimac*
 - **bon_countdown**: A csh script that takes three arguments and prints a countdown message. This is used to give the telescope operator a 5 minute warning before starting the CHIRON beginning of night calibrations.
#####parameters
   - *warningtime*: The amount of time (in seconds) the countdown message will be broadcast.
   - *checkfile*: A file that is checked to see if the countdown should continue. If the contents of `checkfile` > 0, then the countdown will continue.
   - *decrement*: The message refresh rate (in seconds).

   The syntax for the script is:
    ```sh
    ./bon_countdown warningtime checkfile decrement
    ```

    For example, the following will give a five minute countdown, updating the message every 1 second:

    ```sh
    ./bon_countdown 300 my_check_file 1
    ```
 - **bon_countdown.scpt**: An applescript for launching a Terminal window to start up `bon_countdown`. This was a hack to open a terminal window from a launch daemon script because it couldn't be done through a shell script.

 - **chi_object**: The middleware csh script driver for the interactive observing script. When the telescope operator clicks the send button, the 11 arguments pertaining to the observation are passed from `send_object.php` to this routine. `chi_object` logs the arguments received into a nightly log, and passes the them to `chi_object_wrapper`.
 - **chi_object_wrapper**: Another middleware csh script. This receives the input from `chi_object`, opens an x window to show the telescope operator the status of updating all systems with the new observation information, sends a status message back to `send_object.php`, and passes the information on to `chi_object_core`.
 - **chi_object_core**: The heart of the middleware, `chi_object_core` is the csh script that communicates all information for the next observation to CHIRON. It uses a few lines of perl to convert the ra and dec from hms to decimal degrees, and the exposure time from seconds to milliseconds.
 - **startboncountdown**
- ####ctioe1
- ####exoplanets
