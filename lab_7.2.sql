USE LAB_7;
CREATE TABLE IF NOT EXISTS Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Title VARCHAR(50),
    HireDate DATE
);
INSERT INTO Employees VALUES 
(1, 'Nancy', 'Davolio', 'Sales Representative', '2023-01-15'),
(2, 'Andrew', 'Fuller', 'Vice President, Sales', '2022-08-14'),
(3, 'Janet', 'Leverling', 'Sales Representative', '2024-03-01');
SELECT CONCAT(FirstName, ' ', LastName) AS EmployeeName, Title, HireDate FROM Employees;

For form1.cs:
private void Form1_Load(object sender, EventArgs e)
{
    try
    {
        con.Open();

        // 1. SQL Query - We fetch everything first
        string query = "SELECT CONCAT(FirstName, ' ', LastName) AS EmployeeName, Title, HireDate FROM Employees";
        
        OdbcDataAdapter da = new OdbcDataAdapter(query, con);
        DataTable dt = new DataTable();
        da.Fill(dt);

        // 2. IMPLEMENT FILTER IN C# (Requirement #2)
        // Filtering for employees hired after 2023-01-01
        DataView dv = new DataView(dt);
        dv.RowFilter = "HireDate > #1/1/2023#"; 

        // 3. Bind the filtered DataView to the report
        this.reportViewer1.LocalReport.DataSources.Clear();
        ReportDataSource rds = new ReportDataSource("DataSet1", dv.ToTable());
        this.reportViewer1.LocalReport.DataSources.Add(rds);

        this.reportViewer1.RefreshReport();
    }
    catch (Exception ex)
    {
        MessageBox.Show("Error: " + ex.Message);
    }
    finally
    {
        con.Close();
    }
}
