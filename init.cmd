@echo off
Title Portable Python 3.10.6
SET PATH=%cd%\VapourSynth;%cd%\VapourSynth\Scripts;%PATH%
SET PYTHONPATH=%cd%\VapourSynth;%cd%\VapourSynth\Scripts;%cd%\VapourSynth\Lib\site-packages

::python -c "import sys; print('Python' + sys.version)"

doskey pip=python -m pip $*
doskey py=python $*
doskey vspreview=python -m vspreview $*

::echo PATH = %path%
::echo PYTHONPATH = %PYTHONPATH%

cmd /k
