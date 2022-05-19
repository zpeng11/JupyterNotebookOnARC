# Jupyter Notebook on Ucalgary ARC server
This instruction will guide you through how to deploy Jupyter Notebook on ARC and access it from local machine.

## Abstract
Ucalgary ARC server provides powerful computational hardware to handle Machine Learning tasks. 
Developers are used to build up code on their local machine, and use `sbatch job-script.slurm`command to submit tasks to the ARC server. 
This is a good practice, but ARC server can do more than that and make our life much easier.

Jupyter Notebook is an web-based interactive development tool which is commonly used in Data Science and Machine Learning. 
This instruction assumes the reader has general knowledge with this tool. 

With Jupyter Notebook deployed on ARC, users can interactively develop code and perform computation from **any device** that is capable with just command-line-tool and browser.
This way better protects safety of data and code and saves time for configuring Machine Learning environment on local machine. 

## Prerequisites
+ General knowledge to the Ucalgary ARC commands.
+ General knowledge to the Jupyter Notebook.
+ An ARC account that has completed all necessary environment setup and has Jupyter Notebook installed.
## Setup
#### Step1
Download [JupyterOnARC.slurm](./JupyterOnARC.slurm) to your ARC server, or create a `.slurm` batch script on your ARC then copy-paste contents.

#### Step2
Login to your ARC through SSH.(if your are outside campus don't forget VPN) Find the location where you put the slurm script.
```
C:\>ssh zhanfei.peng@arc.ucalgary.ca
zhanfei.peng@arc.ucalgary.ca's password:
===========================================================================
                    __________________________
                        __     ____       __
                        / |    /    )   /    )
                    ---/__|---/___ /---/------
                      /   |  /    |   /
                    _/____|_/_____|__(____/___
                                    arc
(MSResearch) [zhanfei.peng@arc ~]$ ls
JupyterOnARC.slurm
```
#### Step3
Submit the slurm script and get job id.
```
(MSResearch) [zhanfei.peng@arc ~]$ sbatch JupyterOnARC.slurm
Submitted batch job 13948200
```

Look into output file of the job
```
(MSResearch) [zhanfei.peng@arc ~]$ cat slurm-13948200.out


****
Please use -L ssh option to link fg8:8888 to your local computer
****


[I 12:37:10.202 NotebookApp] Authentication of /metrics is OFF, since other authentication is disabled.
[W 12:37:10.643 NotebookApp] All authentication is disabled.  Anyone who can connect to this server will be able to run code.
[I 12:37:10.645 NotebookApp] Serving notebooks from local directory: /home/zhanfei.peng
[I 12:37:10.645 NotebookApp] Jupyter Notebook 6.4.11 is running at:
[I 12:37:10.645 NotebookApp] http://fg8:8888/
[I 12:37:10.645 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
```

This suggests the Jupyter Notebook has been turned on and held on the **8888** port of the **fg8** node.
We will then logout current session, and use SSH tool again to link **fg8:8888** port to our local machine.

#### Step4
```
(MSResearch) [zhanfei.peng@arc ~]$ exit
logout
Connection to arc.ucalgary.ca closed.

C:\>ssh -L localhost:8888:fg8:8888 zhanfei.peng@arc.ucalgary.ca
zhanfei.peng@arc.ucalgary.ca's password:
===========================================================================
                    __________________________
                        __     ____       __
                        / |    /    )   /    )
                    ---/__|---/___ /---/------
                      /   |  /    |   /
                    _/____|_/_____|__(____/___
                                    arc
```

`-L localhost:8888:fg8:8888` is the command added compare to the first SSH login. 
It asks the SSH tool to link **fg8:8888** to **localhost:8888** so that all access to  **localhost:8888** on your local machine will be redirected to **fg8:8888** on ARC.

#### Step5
If you followed the steps, you should now be able to access [localhost:8888/](http://localhost:8888/) from your browser and start working with Jupyter Notebook.

#### More Access Device
After Step3, configuration on the ARC server side is done. Therefore you can use any other devices to go through Step4 & Step5 to get access to the Jupyter Notebook on ARC.

## Customize your setting
Please look into [JupyterOnARC.slurm](./JupyterOnARC.slurm) file and make your own change. 

You may change computing resources you wish to reserve, or add more environmental set up before starting the Jupyter Notebook. 

You should keep in mind that the Jupyter Notebook server only servive within your reserve time.

## Useful tool
`jupyter nbconvert --to script notebook.ipynb` is a useful command line tool to convert your Jupyter Notebook to Python script. 
It will be useful if you wish to run your code in a non-interactive way.

Don't forget to comment interactive blocks before converting.

## References
- [ARC Cluster Guide](https://rcs.ucalgary.ca/ARC_Cluster_Guide)
- [ARC Jupyter Notebook](https://rcs.ucalgary.ca/Jupyter_Notebooks#ARC)
- [Jupyter Notebook Get Start](https://jupyter-notebook-beginner-guide.readthedocs.io/en/latest/what_is_jupyter.html)
