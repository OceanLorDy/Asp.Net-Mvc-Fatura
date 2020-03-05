using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UrunFatura.Models.Entity;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using UrunFatura.Models;
using System.Web.Configuration;
using System.Diagnostics;

namespace UrunFatura.Controllers
{
    public class FaturaController : Controller
    {
        // GET: Fatura
        FaturalandirmaEntities1 db = new FaturalandirmaEntities1();
        public ActionResult Index()
        {
            var deger = db.tbl_Fatura.ToList();
            return View(deger);
        }
        [HttpGet]
        public ActionResult FaturaEkle()
        {
            List<SelectListItem> Musteriler = (from i in db.tbl_Musteri.ToList()
                                            select new SelectListItem
                                            {
                                                Text = i.MusteriAdi,
                                                Value = i.MusteriId.ToString()
                                            }).ToList();
            ViewBag.dgr = Musteriler;
            return View();
        }

        [HttpPost]
        public ActionResult FaturaEkle(tbl_Fatura f1)
        {
            DataContext dtb = new DataContext();
            var mst = db.tbl_Musteri.Where(m => m.MusteriId == f1.MusteriId).FirstOrDefault();
            f1.tbl_Musteri = mst;
            
            db.tbl_Fatura.Add(f1);
            db.SaveChanges();
            dtb.Database.ExecuteSqlCommand("UPDATE tbl_Fatura SET FaturaTutar=0 WHERE FaturaNo=@p0", f1.FaturaNo);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult FaturaGoruntule(int Id)
        {
            //var ftr = from f in db.tbl_FaturaBilgi select f;
            //ftr = ftr.Where(f => f.FaturaNo(Id));

            //var ftr = (from i in db.tbl_FaturaBilgi
            //           where i.FaturaNo == 1
            //           select new
            //           {
            //               i.FBId,
            //               i.FBUrunAdi,
            //               i.FBUrunAdet,
            //               i.FBTutar
            //           }).ToString();
            var ftr = (from i in db.tbl_FaturaBilgi.Where(p => p.FaturaNo == Id) 
                       select new { i.FBId, i.FaturaNo, i.FBUrunAdi, i.FBTutar, i.FBUrunAdet}).ToList().Select(x => new tbl_FaturaBilgi 
                       { FBId = x.FBId, FaturaNo = x.FaturaNo, FBUrunAdi=x.FBUrunAdi, FBTutar=x.FBTutar, FBUrunAdet=x.FBUrunAdet}).ToList();
            return View(ftr);
        }
    }
}