# This is a sample commands.py.  You can add your own commands here.
#
# Please refer to commands_full.py for all the default commands and a complete
# documentation.  Do NOT add them all here, or you may end up with defunct
# commands when upgrading ranger.
# -----------------------------------------------------------------------------
import os
from ranger.core.loader import CommandLoader
from ranger.api.commands import *

class extract_here(Command):
    def execute(self):
        """ extract selected files to current directory."""
        cwd = self.fm.thisdir
        marked_files = tuple(cwd.get_selection())

        def refresh(_):
            cwd = self.fm.get_directory(original_path)
            cwd.load_content()

        one_file = marked_files[0]
        cwd = self.fm.thisdir
        original_path = cwd.path
        au_flags = ['-x', cwd.path]
        au_flags += self.line.split()[1:]
        au_flags += ['-e']

        self.fm.copy_buffer.clear()
        self.fm.cut_buffer = False
        if len(marked_files) == 1:
             descr = "extracting: " + os.path.basename(one_file.path)
        else:
            descr = "extracting files from: " + os.path.basename(
                    one_file.dirname)
        obj = CommandLoader(args=['aunpack'] + au_flags 
                            + [f.path for f in marked_files], descr=descr,
                            read=True)
        
        obj.signal_bind('after', refresh)
        self.fm.loader.add(obj)

class compress(Command):
    def exectute(self):
        """ Compress marked files to current directory """
        cwd = self.fm.thisdir
        marked_files = cwd.get_selection()

        if not marked_files:
            return

        def refresh(_):
            cwd = self.fm.get_directory(original_path)
            cwd.load_content()

            original_path = cwd.path
            parts = self.line.split()
            aw_flags = parts[1:]

            descr = "compressing files in: " + ps.path.basename(parts[1])
            obj = CommandLoaders(args=['apack'] + au_flags + \
                    [os.path.relpath(f.path, cwd.path) for f in marked_files], descr=descr, read=True)
            
            obj.signal_bind('after', refresh)
            self.fm.loader.add(obj)

        def tab(self, tabnum):
            """Complete with current folder name """

            extension = ['.zip', '.tar.gz', '.rar', '.7z']
            return ['compress' + os.path.basename(self.fm.thisdir.path) + ext for ext in extension]
