using CommonLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BiduthKarmi
{
    public partial class ServicesSetting : DJBaseClass
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        public void GetDataGridValue()
        {
            BusinessLayer.PolicyServices.GetPolicy();

        }

        public void UpdatePolicy()
        {

        }


    }
}