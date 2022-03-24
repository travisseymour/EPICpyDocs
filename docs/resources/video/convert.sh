# ffmpeg -i choice_vid_one_trimmed.mp4 -vf "fps=15,scale=2048:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 -y choice_vid_one.gif
# ffmpeg -i choice_vid_one_trimmed.mp4 -vf "fps=15,scale=800:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 -y choice_vid_one_small.gif
# ffmpeg -i choice_vid_two_trimmed.mp4 -vf "fps=15,scale=2048:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 -y choice_vid_two.gif
# ffmpeg -i choice_vid_two_trimmed.mp4 -vf "fps=15,scale=800:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 -y choice_vid_two_small.gif
# ffmpeg -i  williams67trim.mov -vf "fps=15,scale=1280:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 -y williams67.gif

# ffmpeg -i choice_audio_views.mp4 -ss 00:00:05 -to 00:00:37 -c:v copy -c:a copy choice_audio_views_cut.mp4
# ffmpeg -i choice_audio_views_cut.mp4 -vf "fps=15,scale=1280:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 -y choice_audio_views_cut.gif

ffmpeg -i linux_install.mp4 -vf "fps=15,scale=1352:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 -y linux_install.gif
ffmpeg -i linux_install.mp4 -vf "fps=15,scale=676:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 -y linux_install_smallxzsdssd.gif

