import vapoursynth as vs
core = vs.core

video = core.lsmas.LWLibavSource(r"C:\01.mkv")
video.set_output()