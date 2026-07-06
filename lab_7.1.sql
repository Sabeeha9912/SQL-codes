USE LAB_7;

CREATE TABLE IF NOT EXISTS Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    UnitPrice DECIMAL(10, 2),
    QuantityPerUnit VARCHAR(50)
);
INSERT INTO Products VALUES 
(1, 'Chai', 18.00, '10 boxes x 20 bags'),
(2, 'Chang', 19.00, '24 - 12 oz bottles'),
(3, 'Aniseed Syrup', 10.00, '12 - 550 ml bottles');
SELECT ProductName, UnitPrice, QuantityPerUnit FROM Products;


For form1.cs:
private void Form1_Load(object sender, EventArgs e)
{
    try
    {
        con.Open();
        
        // Task requirement: ProductName, UnitPrice, and QuantityPerUnit
        string query = "SELECT ProductName, UnitPrice, QuantityPerUnit FROM Products";
        
        OdbcDataAdapter da = new OdbcDataAdapter(query, con);
        DataTable dt = new DataTable();
        da.Fill(dt);

        this.reportViewer1.LocalReport.DataSources.Clear();
        
        // Binding the resulting data to the report
        ReportDataSource rds = new ReportDataSource("DataSet1", dt);
        this.reportViewer1.LocalReport.DataSources.Add(rds);
        
        this.reportViewer1.RefreshReport();
    }
    catch (Exception ex)
    {
        MessageBox.Show("Error fetching Products: " + ex.Message);
    }
    finally
    {
        con.Close();
    }
}