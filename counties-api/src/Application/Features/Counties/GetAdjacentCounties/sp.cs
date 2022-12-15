using System.Text;
using System.Threading;
using System.Diagnostics;
using System;

namespace Api.SQL;

public class SqlCmdWrapper
{
  public String ExecSQLQuery(Int32 countyId1, Int32 countyId2)
  {
    var process = new Process();
    
    try {

      String str_query = "";
      str_query = "\"exec getAdjacentCounties " + countyId1.ToString() + ", " + countyId2.ToString() + " \"";

      var processStartInfo = new ProcessStartInfo()
      {
          WindowStyle = ProcessWindowStyle.Hidden,
          FileName = $"runsqlcmd.sh",
          Arguments = $" -d /opt/mssql-tools/bin/sqlcmd -u sa -p seq1erverTw3nyyTwo -b counties -t " + str_query + "",
          RedirectStandardOutput = true,
          RedirectStandardError = true,
          UseShellExecute = false
      };

      process.StartInfo = processStartInfo;
      process.Start();

      var output = process.StandardOutput.ReadToEnd();
      return output;
    }
    catch (Exception ex)
    {
      Console.WriteLine(ex.Message);
      var errorOutput = process.StandardError.ReadToEnd();
      return errorOutput;
    }

  }
}

