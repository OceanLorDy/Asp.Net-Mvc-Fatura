//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace UrunFatura.Models.Entity
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbl_FaturaBilgi
    {
        public int FBId { get; set; }
        public int FBNo { get; set; }
        public Nullable<int> FaturaNo { get; set; }
        public string FBUrunAdi { get; set; }
        public Nullable<int> FBUrunAdet { get; set; }
        public Nullable<decimal> FBTutar { get; set; }
        public Nullable<int> UrunNo { get; set; }
    
        public virtual tbl_Fatura tbl_Fatura { get; set; }
        public virtual tbl_Urun tbl_Urun { get; set; }
    }
}
