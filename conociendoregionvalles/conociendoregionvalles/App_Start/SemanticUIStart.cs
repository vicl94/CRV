using System.Web;
using System.Web.Optimization;

[assembly: WebActivatorEx.PostApplicationStartMethod(
      typeof(conociendoregionvalles.SemanticUIStart), "PostStart")]


namespace conociendoregionvalles
{
    public static class SemanticUIStart
    {
        public static void PostStart()
        {
            BundleTable.Bundles.Add(new ScriptBundle("~/bundles/semantic").
			   Include("~/Scripts/semantic.js",
			           "~/Scripts/semantic.site.js"));
			   
            BundleTable.Bundles.Add(new StyleBundle("~/Content/semantic").
			   Include("~/Content/semantic.css",
			           "~/Content/semantic.site.css"));
        }
    }
}