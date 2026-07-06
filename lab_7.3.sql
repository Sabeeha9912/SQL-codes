USE LAB_7;

CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT PRIMARY KEY,
    Region VARCHAR(50),
    OrderDate DATE
);

INSERT INTO Orders VALUES 
(10248, 'North', '2026-03-10'),
(10249, 'North', '2026-03-12'),
(10250, 'South', '2026-03-15'),
(10251, 'East', '2026-03-20'),
(10252, 'South', '2026-03-22');

SELECT Region, OrderID, OrderDate FROM Orders ORDER BY Region;

FOR fom1.cs:

using System;
using System.Data;
using System.Data.Odbc;
using System.Windows.Forms;
using Microsoft.Reporting.WinForms;
using System.IO;

namespace WindowsFormsApp1
{
    public partial class Form1 : Form
    {
        // Connection string for MySQL ODBC 9.6
        OdbcConnection con = new OdbcConnection(
            "Driver={MySQL ODBC 9.6 Unicode Driver};" +
            "Server=localhost;" +
            "Database=LAB_7;" +
            "User=root;" +
            "Password=Fatima9912.;" +
            "Option=3;"
        );

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // Execute the specific task logic here
            LoadTask3_Orders(); 
        }

        /// <summary>
        /// TASK 3: Region, Order ID, and Order Date grouped by region with summaries.
        /// </summary>
        private void LoadTask3_Orders()
        {
            try
            {
                if (con.State == ConnectionState.Closed) con.Open();

                // 1. SQL Query for Task 3
                string query = "SELECT Region, OrderID, OrderDate FROM Orders ORDER BY Region";
                
                OdbcDataAdapter da = new OdbcDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                // 2. Clear and Bind to Report
                this.reportViewer1.LocalReport.DataSources.Clear();
                
                // Ensure "DataSet1" matches your RDLC Dataset name exactly
                ReportDataSource rds = new ReportDataSource("DataSet1", dt);
                this.reportViewer1.LocalReport.DataSources.Add(rds);

                // 3. Set the report path and refresh
                this.reportViewer1.LocalReport.ReportPath = "Report2.rdlc";
                this.reportViewer1.RefreshReport();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Task 3 Error: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// TASK 2: Employee Name, Title, Hire Date with C# filtering.
        /// To use this, call LoadTask2_Employees() in Form1_Load.
        /// </summary>
        private void LoadTask2_Employees()
        {
            try
            {
                con.Open();
                string query = "SELECT CONCAT(FirstName, ' ', LastName) AS EmployeeName, Title, HireDate FROM Employees";
                OdbcDataAdapter da = new OdbcDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                // C# FILTERING: Show employees hired after Jan 1, 2023
                DataView dv = new DataView(dt);
                dv.RowFilter = "HireDate > #1/1/2023#"; 

                this.reportViewer1.LocalReport.DataSources.Clear();
                this.reportViewer1.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", dv.ToTable()));
                this.reportViewer1.RefreshReport();
            }
            catch (Exception ex) { MessageBox.Show(ex.Message); }
            finally { con.Close(); }
        }
    }
}