using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UrunFatura.Models.Entity;

namespace UrunFatura.Models
{
    public class F_U_ViewModel
    {
        public IEnumerable<tbl_Fatura> Fatura { get; set; }
        public IEnumerable<tbl_Urun> Urun { get; set; }
    }
}