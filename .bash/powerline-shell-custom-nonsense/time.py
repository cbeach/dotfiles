from __future__ import absolute_import
from powerline_shell.utils import BasicSegment
from datetime import datetime
from pytz import timezone


class Segment(BasicSegment):
    def add_to_powerline(self):
        powerline = self.powerline
        fmt = powerline.segment_conf('time', 'format')
        time_zones = powerline.segment_conf('time', 'time_zones')
        if time_zones is None or len(time_zones) == 0:
            time_ = self.format_time()
        else:
            time_ = '|'.join([self.format_time(fmt=fmt, tz=tz) for tz in time_zones])

        powerline.append(time_,
                         powerline.theme.TIME_FG,
                         powerline.theme.TIME_BG)

    def format_time(self, fmt, tz=None):
        if tz is None:
            dt = datetime.now() 
        else:
            dt = datetime.now(timezone(tz))

        if fmt:
            time_ = '%s' % dt.strftime(fmt)
        else:
            time_ = '%s' % dt.strftime('%H:%M:%S')
        return time_
