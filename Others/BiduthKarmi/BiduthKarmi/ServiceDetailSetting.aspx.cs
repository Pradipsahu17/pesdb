using BusinessLayer;
using CommonLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static CommonLayer.MessageExtension;

namespace BiduthKarmi
{
    public partial class ServiceDetailSettting : DJBaseClass
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (IsEditHiddenField.Value == "true" )
            {
                var model = new ClassCollection()
                {
                    ServiceDetailsInfo = new ServiceDetails()
                    {
                        Id = SelectedIdHiddenField.Value.ToInt(),
                        SavingHead = SavingHeadTxtB.Text.Trim(),
                        InterestRate = InterestRateTxtB.Text.ToDecimal(),
                        TermCondition = TermConditionTxtB.Text.Trim(),
                    }
                };
                int i = ServiceDetailService.UpdateServiceDetail(model);
                if (i > 0)
                {
                    SavingHeadTxtB.Text = string.Empty;
                    InterestRateTxtB.Text = string.Empty;
                    TermConditionTxtB.Text = string.Empty;
                    ShowMessage("Update Successfully", new Success());
                    Response.Redirect("ServiceDetailSetting.aspx");

                }
            }
            else
            {
                var model = new ClassCollection()
                {
                    ServiceDetailsInfo = new ServiceDetails()
                    {
                        SavingHead = SavingHeadTxtB.Text.Trim(),
                        InterestRate = InterestRateTxtB.Text.ToDecimal(),
                        TermCondition = TermConditionTxtB.Text.Trim(),
                        ServiceId = ServiceCategroyDropdownList.SelectedValue.ToInt(),
                    }
                };
                int i = ServiceDetailService.SaveServiceDetails(model);
                if (i > 0)
                {
                    SavingHeadTxtB.Text = string.Empty;
                    InterestRateTxtB.Text = null;
                    TermConditionTxtB.Text = string.Empty;
                    ServiceCategroyDropdownList.Text = null;
                    ShowMessage("Save Successful", new Success());
                    Response.Redirect("ServiceDetailSetting.aspx");
                }
            }
        }

        [WebMethod]
        public static JSONObject LoadServiceDetail()
        {
            var result = new JSONObject();
            var NewsList = "";
            var dt = ServiceDetailService.GetServiceDetailsList();
            if (dt.Rows.Count > 0)
            {
                result.Success = true;
                foreach (DataRow dr in dt.Rows)
                {
                    NewsList += "<tr id='a" + dr["Id"] + "'><td  style='text-align:center'>" + dr["Id"] + "</td><td  style='text-align:justify'>" + dr["ServiceName"] + "</td><td  style='text-align:justify'>" + dr["SavingHead"] + "</td><td  style='text-align:center'>" + dr["InterestRate"] + "</td><td  style='text-align:justify'>" + dr["TermCondition"] + "</td><td  style='text-align:center'>" + dr["IsActive"] + "</td>"
                       + "<td  style='text-align:center'><button id='c" + dr["Id"] + "' onclick=Active(this)   class='btn btn-success' type='button'><i class='fa fa-eye fa-xs'></i></button>&nbsp;&nbsp;<button id='b" + dr["Id"] + "' onclick=Edit(this) class='btn btn-primary' type='button' style='font-size:14px; padding:7px 12px '><i class='fas fa-edit fa-xs'></i></button>&nbsp;&nbsp;<button id='b" + dr["Id"] + "' onclick=Delete(this) class='btn btn-danger' type='button'><i class='fa fa-trash fa-xs'></i></button></td></tr>";
                }
                result.Data = NewsList;
            }
            return result;
        }

        [WebMethod]
        public static JSONObject MakeInactive(string CID)
        {
            var result = new JSONObject();
            string NewsList = "";
            var dt = ServiceDetailService.MakeActiveOrInActive(CID.ToInt());
            if (dt.Rows.Count > 0)
            {

                result.Success = true;
                result.Data = NewsList;
            }
            else
            {
                result.Success = false;
            }

            return result;
        }

        [WebMethod]
        public static JSONObject EditServiceDetail(string CID)
        {
            var result = new JSONObject();
            result.Datas = new object[7];
            var dt = ServiceDetailService.GetServiceDetailById(CID.ToInt());
            if (dt.Rows.Count > 0)
            {
                result.Success = true;
                result.Datas[0] = dt.Rows[0]["SavingHead"].ToText();
                result.Datas[1] = dt.Rows[0]["InterestRate"].ToText();
                result.Datas[2] = dt.Rows[0]["TermCondition"].ToText();
                result.Datas[3] = dt.Rows[0]["ServiceId"].ToText();
                result.Datas[4] = dt.Rows[0]["Id"].ToText();


            }
            else
            {
                result.Success = false;
            }
            return result;
        }

        [WebMethod]
        public static JSONObject DeleteServiceDetail(string CID)
        {
            var result = new JSONObject();
            var dt = ServiceDetailService.DeleteServiceDetail(CID.ToInt());
            if (dt > 0)
            {
                result.Success = true;
            }
            else
            {
                result.Success = false;
            }


            return result;
        }


    }
}