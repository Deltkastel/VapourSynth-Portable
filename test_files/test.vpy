import vapoursynth as vs
core = vs.core

video = core.lsmas.LWLibavSource(r"F:\01.mkv")
video.set_output()
