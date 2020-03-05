using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using UrunFatura.Models.Entity;

namespace UrunFatura.Models
{
    public class DataContext:DbContext 
    {
        public DbSet<tbl_Fatura> Fatura { get; set; }
        public DbSet<tbl_Urun> Urun { get; set; }
    }
}