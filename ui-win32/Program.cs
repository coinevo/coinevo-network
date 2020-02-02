using System;
using System.Diagnostics;
using System.Windows.Forms;

namespace network.coinevo.coinevonet.win32.ui
{
    static class Program
    {
        public static OperatingSystem os_id = Environment.OSVersion;
        public static PlatformID platform = os_id.Platform;
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            // Scrub any old coinevonet process left behind
            Process[] old_pids = Process.GetProcessesByName("coinevonet");
            foreach (Process pid in old_pids)
            {
                try
                {
                    pid.Kill();
                }
                catch { } // don't yell
            }
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new main_frame());
            try
            {
                main_frame.coinevoNetDaemon.Kill();
            }
            catch
            { }
        }
    }
}
