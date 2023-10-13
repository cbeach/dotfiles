from powerline_shell.utils import BasicSegment
from powerline_shell.color_compliment import stringToHashToColorAndOpposite
from powerline_shell.colortrans import rgb2short
from socket import gethostname


class Segment(BasicSegment):
    def add_to_powerline(self):
        powerline = self.powerline
        hostname = gethostname().split(".")[0]
        if hostname == "u46787578a2e350":
            hostname = "wheatly"
        elif hostname == "dev-dsk-casebeac-2a-a88e73ff":
            hostname = "servitor1"
        elif hostname == "dev-dsk-casebeac-2a-446b42f6":
            hostname = "servitor2"

        if powerline.segment_conf("hostname", "colorize"):
            FG, BG = stringToHashToColorAndOpposite(hostname)
            FG, BG = (rgb2short(*color) for color in [FG, BG])
            host_prompt = " %s " % hostname.split(".")[0]
            powerline.append(host_prompt, FG, BG)
        else:
            if powerline.args.shell == "bash":
                host_prompt = r" \h "
            elif powerline.args.shell == "zsh":
                host_prompt = " %m "
            else:
                host_prompt = " %s " % hostname
            powerline.append(host_prompt,
                             powerline.theme.HOSTNAME_FG,
                             powerline.theme.HOSTNAME_BG)
