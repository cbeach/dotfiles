import os
import re
import subprocess
import platform
from powerline_shell.utils import ThreadedSegment


class Segment(ThreadedSegment):
    def run(self):
        self.num_jobs = 0
        if platform.system().startswith('CYGWIN'):
            # cygwin ps is a special snowflake...
            output_proc = subprocess.Popen(['ps', '-af'], stdout=subprocess.PIPE)
            output = map(lambda l: int(l.split()[2].strip()),
                output_proc.communicate()[0].decode("utf-8").splitlines()[1:])
            self.num_jobs = output.count(os.getppid()) - 1
        else:
            pppid_proc = subprocess.Popen(['ps', '-p', str(os.getppid()), '-oppid='],
                                          stdout=subprocess.PIPE)
            jobs_proc = subprocess.Popen(['jobs', str(os.getppid()), '-oppid='],
                                          stdout=subprocess.PIPE)
            pppid = pppid_proc.communicate()[0].decode("utf-8").strip()
            jobs = jobs_proc.communicate()[0].decode("utf-8").strip()
            print(jobs)
            output_proc = subprocess.Popen(['ps', '-a', '-o', 'ppid'],
                                           stdout=subprocess.PIPE)
            output = output_proc.communicate()[0].decode("utf-8")
            print(output)
            self.num_jobs = len(re.findall(str(pppid), output)) - 1
            print(re.findall(str(pppid), output))

    def add_to_powerline(self):
        self.join()
        if self.num_jobs > 0:
            self.powerline.append(' %d ' % self.num_jobs,
                                  self.powerline.theme.JOBS_FG,
                                  self.powerline.theme.JOBS_BG)

pppid_proc = subprocess.Popen(['ps', '-p', str(os.getppid()), '-oppid='],
stdout=subprocess.PIPE)
jobs_proc = subprocess.Popen(['jobs', str(os.getppid()), '-oppid='],
stdout=subprocess.PIPE)
pppid = pppid_proc.communicate()[0].decode("utf-8").strip()
jobs = jobs_proc.communicate()[0].decode("utf-8").strip()
print(jobs)
output_proc = subprocess.Popen(['ps', '-a', '-o', 'ppid'],
stdout=subprocess.PIPE)
output = output_proc.communicate()[0].decode("utf-8")
print(output)
self.num_jobs = len(re.findall(str(pppid), output)) - 1
print(re.findall(str(pppid), output))
