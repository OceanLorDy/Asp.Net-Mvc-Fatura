using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UrunFatura.Models.Entity;

namespace UrunFatura.Controllers
{
    public class FaturaBilgiController : Controller
    {
        // GET: FaturaBilgi
        FaturalandirmaEntities1 db = new FaturalandirmaEntities1();
        public ActionResult Index()
        {
            var deger = db.tbl_FaturaBilgi.ToList();
            return View(deger);
        }
        [HttpGet]
        public ActionResult FaturaBilgiEkle()
        {
            return View();
        }

        [HttpPost]
        public ActionResult FaturaBilgiEkle(tbl_FaturaBilgi fb1)
        {
            db.tbl_FaturaBilgi.Add(fb1);
            db.SaveChanges();
            return View();
        }
    }
}