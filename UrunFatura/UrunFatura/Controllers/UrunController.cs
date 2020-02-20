using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UrunFatura.Models.Entity;

namespace UrunFatura.Controllers
{
    public class UrunController : Controller
    {
        FaturalandirmaEntities1 db = new FaturalandirmaEntities1();
        // GET: Urun
        public ActionResult Index()
        {
            var deger = db.tbl_Urun.ToList();
            return View(deger);
        }
        [HttpGet]
        public ActionResult UrunEkle()
        {
            return View();
        }

        [HttpPost]
        public ActionResult UrunEkle(tbl_Urun u1)
        {
            db.tbl_Urun.Add(u1);
            db.SaveChanges();
            return View();
        }
    }
}