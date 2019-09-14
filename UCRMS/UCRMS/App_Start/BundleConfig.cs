using System.Web;
using System.Web.Optimization;
using System.Web.UI.WebControls;

namespace UCRMS
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js",
                      "~/Content/dist/raphael/raphael.min.js",
                      "~/Content/plugins/morris/morris.min.js",
                      "~/Content/plugins/sparkline/jquery.sparkline.min.js",
                      "~/Content/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js",
                      "~/Content/plugins/jvectormap/jquery-jvectormap-world-mill-en.js",
                      "~/Content/plugins/knob/jquery.knob.js",
                      "~/Content/dist/js/moment.js",
                      "~/Content/plugins/daterangepicker/daterangepicker.js",
                      "~/Content/plugins/datepicker/bootstrap-datepicker.js",
                      "~/Content/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js",
                      "~/Content/plugins/slimScroll/jquery.slimscroll.min.js",
                      "~/Content/plugins/fastclick/fastclick.min.js",
                      "~/Content/dist/js/app.min.js",
                      "~/Content/dist/js/demo.js",
                      "~/Content/dist/js/jquery-ui.min.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/dist/css/font-awesome.css",
                      "~/Content/dist/css/ionicons.css",
                      "~/Content/dist/css/AdminLTE.css",
                      "~/Content/dist/css/skins/_all-skins.min.css",
                      "~/Content/plugins/iCheck/flat/blue.css",
                      "~/Content/plugins/morris/morris.css",
                      "~/Content/plugins/daterangepicker/daterangepicker-bs3.css",
                      "~/Content/plugins/datepicker/datepicker3.css",
                      "~/Content/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css",
                      "~/Content/plugins/jvectormap/jquery-jvectormap-1.2.2.css"));
        }
    }
}
