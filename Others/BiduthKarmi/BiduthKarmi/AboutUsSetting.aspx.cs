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
    public partial class AboutUsSetting : DJBaseClass
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (IsEditHiddenField.Value == "true")
            {
                var model = new ClassCollection()
                {
                    AboutUsInfo = new AboutUsDetails()
                    {
                        Id = SelectedIdHiddenField.Value.ToInt(),
                        InstitutionName = INameTxtB.Text.Trim(),
                        InstitutionEstablishment = IEstablishmentTxtB.Text.Trim(),
                        InstitutionWorkPlace = IWorkPlaceTxtB.Text.Trim(),
                        Address = IAddressTxtB.Text.Trim(),
                        MemberNumberAndShareCapital = IMNAShareCapitalTxtB.Text.Trim(),
                        OrganizationPurpose = IPurposeTxtB.Text.Trim(),
                    }
                };
                int i = AboutUsService.UpdateAboutUs(model);
                if (i > 0)
                {
                    INameTxtB.Text = string.Empty;
                    IEstablishmentTxtB.Text = string.Empty;
                    IWorkPlaceTxtB.Text = string.Empty;
                    IAddressTxtB.Text = string.Empty;
                    IMNAShareCapitalTxtB.Text = string.Empty;
                    IPurposeTxtB.Text = string.Empty;
                    ShowMessage("Save Successfully", new Success());
                    Response.Redirect("AboutUsSetting.aspx");
                }
            }
            else
            {
                var model = new ClassCollection()
                {
                    AboutUsInfo = new AboutUsDetails()
                    {
                        InstitutionName = INameTxtB.Text.Trim(),
                        InstitutionEstablishment = IEstablishmentTxtB.Text.Trim(),
                        InstitutionWorkPlace = IWorkPlaceTxtB.Text.Trim(),
                        Address = IAddressTxtB.Text.Trim(),
                        MemberNumberAndShareCapital = IMNAShareCapitalTxtB.Text.Trim(),
                        OrganizationPurpose = IPurposeTxtB.Text.Trim(),
                    }
                };
                int i = AboutUsService.SaveAboutUs(model);
                if (i > 0)
                {
                    INameTxtB.Text = string.Empty;
                    IEstablishmentTxtB.Text = string.Empty;
                    IWorkPlaceTxtB.Text = string.Empty;
                    IAddressTxtB.Text = string.Empty;
                    IMNAShareCapitalTxtB.Text = string.Empty;
                    IPurposeTxtB.Text = string.Empty;
                    ShowMessage("Save Successfully", new Success());
                    Response.Redirect("AboutUsSetting.aspx");
                }
            }
          

        }

        [WebMethod]
        public static JSONObject LoodAboutUsDetails()
        {
            var result = new JSONObject();
            var NewsList = "";
            var dt = AboutUsService.GetAboutUsLists();
            if (dt.Rows.Count > 0)
            {
                result.Success = true;
                foreach (DataRow dr in dt.Rows)
                {
                    NewsList += "<tr id='a" + dr["Id"] + "'><td style='text-align:center; width:5%'>" + dr["Id"] + "</td><td style='text-align:justify; width:13%;'>" + dr["InstitutionName"] + "</td><td style='text-align:justify; width:8%;'>" + dr["InstitutionEstablishment"] + "</td><td style='text-align:justify; width:10%;'>" + dr["InstitutionWorkPlace"] + "</td><td style='text-align:justify; width:8%'>" + dr["Address"] + "</td><td style='text-align:justify; width:10%'>" + dr["MemberNumberAndShareCapital"] + "</td><td style='text-align:justify; width:20%'>" + dr["OrganizationPurpose"] + "</td><td style='text-align:center; width:8%'>" + dr["IsActive"] + "</td>"
                       + "<td style='width:22%; text-align:center'><button id='c" + dr["Id"] + "' onclick=Active(this)   class='btn btn-success' type='button'><i class='fa fa-eye fa-xs'></i></button>&nbsp;&nbsp;<button id='b" + dr["Id"] + "' onclick=Edit(this) class='btn btn-primary' type='button' style='font-size:14px; padding:7px 12px '><i class='fas fa-edit fa-xs'></i></button>&nbsp;&nbsp;<button style='margin-top:10px;' id='b" + dr["Id"] + "' onclick=Delete(this) class='btn btn-danger' type='button'><i class='fa fa-trash fa-xs'></i></button></td></tr>";
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
            var dt = AboutUsService.MakeActiveAndInActive(CID.ToInt());
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
        public static JSONObject EditAboutUs(string CID)
        {
            var result = new JSONObject();
            result.Datas = new object[7];
            var dt = AboutUsService.GetAboutUsById(CID.ToInt());
            if (dt.Rows.Count > 0)
            {
                result.Success = true;
                result.Datas[0] = dt.Rows[0]["InstitutionName"].ToText();
                result.Datas[1] = dt.Rows[0]["InstitutionEstablishment"].ToText();
                result.Datas[2] = dt.Rows[0]["InstitutionWorkPlace"].ToText();
                result.Datas[3] = dt.Rows[0]["Address"].ToText();
                result.Datas[4] = dt.Rows[0]["MemberNumberAndShareCapital"].ToText();
                result.Datas[5] = dt.Rows[0]["OrganizationPurpose"].ToText();


            }
            else
            {
                result.Success = false;
            }
            return result;
        }

        [WebMethod]
        public static JSONObject DeleteAboutUs(string CID)
        {
            var result = new JSONObject();
            var dt = AboutUsService.DeleteAboutUs(CID.ToInt());
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