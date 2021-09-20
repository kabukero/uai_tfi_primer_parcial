using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Helpers
{
    internal static class SqlHelperAsync
    {
        readonly static string conString;

        public static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["Master"].ConnectionString;
        }

        public static async Task<Int32> ExecuteNonQuery(String commandText, CommandType commandType, params SqlParameter[] parameters)
        {
            using(SqlConnection conn = new SqlConnection(GetConnectionString()))
            {
                using(SqlCommand cmd = new SqlCommand(commandText, conn))
                {
                    // There're three command types: StoredProcedure, Text, TableDirect. The TableDirect 
                    // type is only for OLE DB.
                    cmd.CommandType = commandType;
                    cmd.Parameters.AddRange(parameters);

                    conn.Open();
                    return await cmd.ExecuteNonQueryAsync();
                }
            }
        }

        /// <summary>
        /// Set the connection, command, and then execute the command and only return one value.
        /// </summary>
        public static async Task<Object> ExecuteScalar(String commandText,
            CommandType commandType, params SqlParameter[] parameters)
        {
            using(SqlConnection conn = new SqlConnection(GetConnectionString()))
            {
                using(SqlCommand cmd = new SqlCommand(commandText, conn))
                {
                    cmd.CommandType = commandType;
                    if(parameters != null)
                        cmd.Parameters.AddRange(parameters);

                    conn.Open();
                    return await cmd.ExecuteScalarAsync();
                }
            }
        }

        /// <summary>
        /// Set the connection, command, and then execute the command with query and return the reader.
        /// </summary>
        public static async Task<SqlDataReader> ExecuteReader(String commandText,
            CommandType commandType, params SqlParameter[] parameters)
        {
            SqlConnection conn = new SqlConnection(GetConnectionString());

            using(SqlCommand cmd = new SqlCommand(commandText, conn))
            {
                cmd.CommandType = commandType;
                if(parameters != null)
                    cmd.Parameters.AddRange(parameters);

                conn.Open();
                // When using CommandBehavior.CloseConnection, the connection will be closed when the 
                // IDataReader is closed.
                SqlDataReader reader = await cmd.ExecuteReaderAsync(CommandBehavior.CloseConnection);

                return reader;
            }
        }
    }
}
