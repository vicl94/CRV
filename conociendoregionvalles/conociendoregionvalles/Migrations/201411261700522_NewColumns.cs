namespace conociendoregionvalles.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class NewColumns : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AspNetUsers", "Names", c => c.String());
            AddColumn("dbo.AspNetUsers", "LastNames", c => c.String());
            AddColumn("dbo.AspNetUsers", "Email", c => c.String());
            AddColumn("dbo.AspNetUsers", "IdCompany", c => c.Int());
        }
        
        public override void Down()
        {
            DropColumn("dbo.AspNetUsers", "IdCompany");
            DropColumn("dbo.AspNetUsers", "Email");
            DropColumn("dbo.AspNetUsers", "LastNames");
            DropColumn("dbo.AspNetUsers", "Names");
        }
    }
}
